<?php

/**
 * @author ryan saputro
 * @email ryansaputro52@gmail.com
 * @create date 2019-06-28 08:34:18
 * @modify date 2019-06-28 08:34:18
 * @desc [description]
 */
namespace App\Http\Controllers\Backend;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Backend\Route;
use App\Model\Backend\Vendor;
use App\Model\Backend\BarangVendor;
use App\Model\Backend\Pemesanan;
use App\Model\Backend\PemesananDetail;
use App\Model\Backend\DataApotek;
use DB;
use Auth;



class PemesananController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public $path;
    public $dimensions;

    function __construct()
    {
        $this->middleware('permission:pemesanan-list');
        $this->middleware('permission:pemesanan-create', ['only' => ['create', 'store']]);
        $this->middleware('permission:pemesanan-edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:pemesanan-delete', ['only' => ['destroy']]);
    }


    public function index(Request $request)
    {
        
        $data = DB::table('hd_pemesanan')
                ->select('hd_pemesanan.*', 'hd_vendor.nama_vendor', 'users.name')
                ->join('hd_vendor', 'hd_vendor.id_vendor', '=', 'hd_pemesanan.id_vendor')
                ->join('users', 'users.id', '=', 'hd_pemesanan.dibuat_oleh')
                ->where('hd_pemesanan.status', '<>', '7')
                ->orderBy('created_at', 'DESC')
                ->get();
        return view('backend.pemesanan.index', compact('data'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data = Pemesanan::orderBy('no_pemesanan', 'DESC')->limit(1)->first();
        if($data != null){
            $result = substr($data->no_pemesanan, 0, 3);
            $no = (Int)$result + 1;
            $no_pesanan = substr($data->no_pemesanan, 3, 5);
        }else{
            $no = 1;
            $no_pesanan = "ORDER";
        }
        if($no < 10){
            $no_pemesanan = "00" . $no.$no_pesanan.date('dmY') ;
        }else if($no < 100){
            $no_pemesanan = "0" . $no.$no_pesanan.date('dmY');
        }else{
            $no_pemesanan = $no.$no_pesanan.date('dmY');
        }
        $vendor = Vendor::where('status','1')->get();
        return view('backend.pemesanan.create', compact('vendor', 'no_pemesanan'));
    }


    public function ajaxVendorGetItem(Request $request){
        $data = DB::table('v_barang_vendor')
                ->select('*')
                ->where('id_vendor', $request->data)
                ->get();
        return response()->json(["status" => 200, 'data' => $data]);
    }


    public function ajaxBarangGetItem(Request $request){
        $data = DB::table('v_barang_vendor')
                ->select('*')
                ->where('id_barang', $request->data)
                ->get();
        return response()->json(["status" => 200, 'data' => $data]);
    }

    public function ajaxBarangRevItem(Request $request){
        $id_pemesanan = $request->id_pemesanan;
        $id_vendor = $request->id_vendor;

        $data = DB::table('hd_pemesanan_detail')
                ->select('hd_pemesanan_detail.*', 'hd_barang.nama_barang', 'hd_barang_satuan.id_satuan', 'hd_barang_satuan.nama_satuan')
                ->join('hd_barang', 'hd_pemesanan_detail.id_barang', '=', 'hd_barang.id_barang')
                ->join('hd_barang_vendor', 'hd_barang_vendor.id_barang', '=', 'hd_barang.id_barang')
                ->join('hd_barang_satuan', 'hd_barang_satuan.id_satuan', '=', 'hd_barang_vendor.id_satuan')
                ->where('id_pemesanan', $id_pemesanan)
                ->where('id_vendor', $id_vendor)
                ->get();
        return response()->json(["status" => 200, 'data' => $data]);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules = [
            'no_pemesanan' => 'required|max:100|unique:hd_pemesanan,no_pemesanan|',
            'dibuat_tgl' => 'required|date',
            'id_vendor' => 'required',
            'qty' => 'array',
            'qty.*' => 'required',
            // 'id_barang' => 'array',
            'id_barang.*' => 'required',
            'status' => 'required',
        ];

        $customMessages = [
            'required' => 'field :attribute harus diisi.',
            'numeric' => 'field :attribute harus dengan angka.',
            'unique' => 'field :attribute harus unik.',
        ];

        $valid = $this->validate($request, $rules, $customMessages);
            
        DB::beginTransaction();
        try {
            $data = Pemesanan::create(
                [
                    'no_pemesanan' => $request->no_pemesanan,
                    'dibuat_oleh' => Auth::user()->id,
                    'dibuat_tgl' => $request->dibuat_tgl,
                    'status' => $request->status,
                    'id_vendor' => $request->id_vendor,
                    'catatan' => $request->catatan
                ]
            );

            foreach($request->id_barang AS $k => $v):
                $detail = PemesananDetail::create(
                    [
                        'id_pemesanan' => $data->id_pemesanan,
                        'id_barang' => $v,
                        'qty' => $request->qty[$k],
                        'harga' => $request->harga[$k],
                        'keterangan' => $request->keterangan[$k]
                    ]
                );
            endforeach;
            
        } catch (\Illuminate\Database\QueryException $ex) {
            //throw $th;
            DB::rollback();
            dd($ex->getMessage());
            return redirect()->route('pemesanan.index')
                ->with('danger', 'Pemesanan gagal dibuat');

        }

        DB::commit();

        return redirect()->route('pemesanan.index')
            ->with('success', 'Pemesanan berhasil dibuat');

    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = DB::table('hd_pemesanan')
                ->select('hd_pemesanan.*', 'users.name')
                ->join('users', 'users.id', '=', 'hd_pemesanan.dibuat_oleh')
                ->where(DB::raw('md5(hd_pemesanan.id_pemesanan)'), $id)
                ->orderBy('hd_pemesanan.no_pemesanan', 'DESC')
                ->limit(1)
                ->first();
        
        $rev = substr($data->no_pemesanan, 19, 9);
        $revx = substr($data->no_pemesanan, 16, 5);
        $no = (Int)$rev + 1;

        
        if ($no < 10) {
            $no_pemesanan = ($revx == '') ? $data->no_pemesanan ."REV00".$no : substr($data->no_pemesanan, 0, 19)."00".$no;;
        } else if ($no < 100) {
            $no_pemesanan = ($revx == '') ? $data->no_pemesanan ."REV0".$no : substr($data->no_pemesanan, 0, 19)."0".$no;;
        } else {
            $no_pemesanan = ($revx == '') ? $data->no_pemesanan .$no : substr($data->no_pemesanan, 0, 19).$no;;
        }
        // dd($no_pemesanan);

        $item = DB::table('hd_pemesanan_detail')
                ->select('hd_pemesanan_detail.*', 'hd_barang.nama_barang', 'hd_barang_satuan.id_satuan', 'hd_barang_satuan.nama_satuan')
                ->join('hd_barang', 'hd_pemesanan_detail.id_barang', '=', 'hd_barang.id_barang')
                ->join('hd_barang_vendor', 'hd_barang_vendor.id_barang', '=', 'hd_barang.id_barang')
                ->join('hd_barang_satuan', 'hd_barang_satuan.id_satuan', '=', 'hd_barang_vendor.id_satuan')
                ->where(DB::raw('md5(id_pemesanan)'), $id)
                ->get();

        $listItem = DB::table('v_barang_vendor')->where('id_vendor', $data->id_vendor)->get();
        $result = substr($data->no_pemesanan, 0, 3);
        $vendor = Vendor::where('status', '1')->get();

        return view('backend.pemesanan.edit', compact('vendor', 'no_pemesanan', 'data', 'item', 'listItem'));

    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {

        $data = DB::table('hd_pemesanan')
            ->select('hd_pemesanan.*', 'users.name', 'hd_vendor.nama_vendor')
            ->join('users', 'users.id', '=', 'hd_pemesanan.dibuat_oleh')
            ->join('hd_vendor', 'hd_vendor.id_vendor', '=', 'hd_pemesanan.id_vendor')
            ->where(DB::raw('md5(id_pemesanan)'), $id)
            ->orderBy('no_pemesanan', 'DESC')
            ->first();

        $item = DB::table('hd_pemesanan_detail')
            ->select('hd_pemesanan_detail.*', 'hd_barang.nama_barang', 'hd_barang_satuan.id_satuan', 'hd_barang_satuan.nama_satuan', 'hd_barang_vendor.harga_beli')
            ->join('hd_barang', 'hd_pemesanan_detail.id_barang', '=', 'hd_barang.id_barang')
            ->join('hd_barang_vendor', 'hd_barang_vendor.id_barang', '=', 'hd_barang.id_barang')
            ->join('hd_barang_satuan', 'hd_barang_satuan.id_satuan', '=', 'hd_barang_vendor.id_satuan')
            // ->where('id_pemesanan', $id)
            ->where(DB::raw('md5(id_pemesanan)'), $id)
            ->get();

        $datas = DB::table('hd_pemesanan')
            ->select('hd_pemesanan.*', 'users.name', 'hd_vendor.nama_vendor')
            ->join('users', 'users.id', '=', 'hd_pemesanan.dibuat_oleh')
            ->join('hd_vendor', 'hd_vendor.id_vendor', '=', 'hd_pemesanan.id_vendor')
            ->where('hd_pemesanan.no_pemesanan', 'like', '%'. substr($data->no_pemesanan, 0, 16) .'%')
            ->orderBy('hd_pemesanan.no_pemesanan', 'ASC')
            ->get();

        $apotek = DataApotek::first();

        return view('backend.pemesanan.show', compact('data', 'item', 'datas', 'apotek'));
    }

    public function update(Request $request, $id)
    {
        $key = $request->key;
        if(isset($key)){
            Pemesanan::where(DB::raw('md5(id_pemesanan)'), $id)->update(['status' => '4']);
        }
        
        $rules = [
            'no_pemesanan' => 'required|max:100|unique:hd_pemesanan,no_pemesanan|',
            'dibuat_tgl' => 'required|date',
            'id_vendor' => 'required',
            'qty' => 'array',
            'qty.*' => 'required',
            'id_barang' => 'array',
            'id_barang.*' => 'required',
        ];

        $customMessages = [
            'required' => 'field :attribute harus diisi.',
            'numeric' => 'field :attribute harus dengan angka.',
            'unique' => 'field :attribute harus unik.',
        ];

        $valid = $this->validate($request, $rules, $customMessages);

        DB::beginTransaction();
        try {
            $id_pesan = Pemesanan::where(DB::raw('md5(id_pemesanan)'), $id)->value('id_pemesanan');
            Pemesanan::where(DB::raw('md5(id_pemesanan)'), $id)->update(['status' => '7']);
            
            $data = Pemesanan::create(
                [
                    'no_pemesanan' => $request->no_pemesanan,
                    'dibuat_oleh' => Auth::user()->id,
                    'dibuat_tgl' => $request->dibuat_tgl,
                    'status' => 2,
                    'id_vendor' => $request->id_vendor,
                    'catatan' => $request->catatan,
                    'referensi_id_pemesanan' => $id_pesan,
                ]
            );

            foreach ($request->id_barang as $k => $v) :
                $detail = PemesananDetail::create(
                [
                    'id_pemesanan' => $data->id_pemesanan,
                    'id_barang' => $v,
                    'qty' => $request->qty[$k],
                    'harga' => $request->harga[$k],
                    'keterangan' => $request->keterangan[$k]
                ]
            );
            endforeach;

        } catch (\Illuminate\Database\QueryException $ex) {
            //throw $th;
            DB::rollback();
            dd($ex->getMessage());
            return redirect()->route('pemesanan.index')
                ->with('danger', 'Pemesanan gagal dibuat');

        }

        DB::commit();

        return redirect()->route('pemesanan.index')
            ->with('success', 'Pemesanan berhasil dibuat');

    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

}