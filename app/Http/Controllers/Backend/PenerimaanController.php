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
use App\Model\Backend\Rak;
use App\Model\Backend\Penerimaan;
use App\Model\Backend\PenerimaanDetail;
use DB;
use Auth;



class PenerimaanController extends Controller
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
        $this->middleware('permission:penerimaan-list');
        $this->middleware('permission:penerimaan-create', ['only' => ['create', 'store']]);
        $this->middleware('permission:penerimaan-edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:penerimaan-delete', ['only' => ['destroy']]);
    }


    public function index(Request $request)
    {
        
        $data = DB::table('hd_penerimaan')
                ->select('hd_penerimaan.*','hd_pemesanan.no_pemesanan', 'users.name')
                ->join('users', 'users.id', '=', 'hd_penerimaan.diterima_oleh')
                ->join('hd_pemesanan', 'hd_penerimaan.id_pemesanan', '=', 'hd_pemesanan.id_pemesanan')
                ->orderBy('created_at', 'DESC')
                ->get();
        return view('backend.penerimaan.index', compact('data'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data = Penerimaan::orderBy('no_penerimaan', 'DESC')->limit(1)->first();
        if($data != null){
            $result = substr($data->no_penerimaan, 0, 3);
            $no = (Int)$result + 1;
            $no_penerimaan = substr($data->no_penerimaan, 3, 7);
        }else{
            $no = 1;
            $no_penerimaan = "RECEIVE";
        }
        if($no < 10){
            $no_penerimaan = "00" . $no.$no_penerimaan.date('dmY') ;
        }else if($no < 100){
            $no_penerimaan = "0" . $no.$no_penerimaan.date('dmY');
        }else{
            $no_penerimaan = $no.$no_penerimaan.date('dmY');
        }

        $pemesanan = Pemesanan::where('status','1')->orWhere('status', '2')->orWhere('status', '5')->get();
        return view('backend.penerimaan.create', compact('vendor', 'no_penerimaan', 'pemesanan'));
    }


    public function ajaxOrderGetItem(Request $request){
        $data = DB::table('hd_pemesanan')
                ->select('hd_pemesanan.*', 'hd_vendor.nama_vendor', 'users.name')
                ->join('hd_vendor', 'hd_pemesanan.id_vendor', '=', 'hd_vendor.id_vendor')
                ->join('users', 'hd_pemesanan.dibuat_oleh', '=', 'users.id')
                ->where('id_pemesanan', $request->id_pemesanan)
                ->first();

        $datas = DB::table('hd_pemesanan_detail')
                ->select('hd_pemesanan_detail.*', 'hd_barang.nama_barang', 'hd_barang_satuan.nama_satuan')
                ->join('hd_barang', 'hd_barang.id_barang', '=', 'hd_pemesanan_detail.id_barang')
                ->join('hd_barang_vendor', 'hd_barang.id_barang', '=', 'hd_barang_vendor.id_barang')
                ->join('hd_barang_satuan', 'hd_barang_vendor.id_satuan', '=', 'hd_barang_satuan.id_satuan')
                ->where('id_pemesanan', $request->id_pemesanan);

        $dataNew = DB::table('hd_penerimaan')
                ->select('hd_penerimaan_detail.id_barang', DB::raw('SUM(hd_penerimaan_detail.qty) AS qty'))
                ->join('hd_penerimaan_detail', 'hd_penerimaan.id_penerimaan', '=', 'hd_penerimaan_detail.id_penerimaan')
                ->where('hd_penerimaan.id_pemesanan', $request->id_pemesanan)
                ->groupBy('hd_penerimaan_detail.id_barang')
                ->pluck('qty', 'id_barang')
                ->toArray();

        $detail = $datas->get();
        $dataOld = $datas->pluck('qty', 'id_barang')->toArray();

        $rak = Rak::where('status', '1')->get();

        return response()->json(["status" => 200, 'data' => $data, 'detail' => $detail, 'rak' => $rak, 'dataOld' => $dataOld, 'dataNew' => $dataNew]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $detail = PemesananDetail::where('id_pemesanan', $request->no_pemesanan)->pluck('qty', 'id_barang')->toArray();

        $qty = $request->qty;

        $rules = [
            'no_penerimaan' => 'required|max:100|unique:hd_penerimaan,no_penerimaan',
            'dibuat_tgl' => 'required|date',
            'no_pemesanan' => 'required',
            'qty' => 'array',
            'qty.*' => 'required',
            // 'id_barang' => 'array',
            'id_barang.*' => 'required',
            'id_rak' => 'array',
            'id_rak.*' => 'required',
            'no_batch' => 'array',
            'no_batch.*' => 'required',
            // 'tanggal_kadaluarsa' => 'array',
            'tanggal_kadaluarsa.*' => 'required',
        ];

        $customMessages = [
            'required' => 'field :attribute harus diisi.',
            'numeric' => 'field :attribute harus dengan angka.',
            'unique' => 'field :attribute harus unik.',
        ];

        $valid = $this->validate($request, $rules, $customMessages);
            
        DB::beginTransaction();
        try {
            $data = Penerimaan::create(
                [
                    'no_penerimaan' => $request->no_penerimaan,
                    'no_faktur' => $request->no_faktur,
                    'id_pemesanan' => $request->no_pemesanan,
                    'diterima_oleh' => Auth::user()->id,
                    'tanggal_penerimaan' => $request->dibuat_tgl,
                    'catatan' => $request->catatan
                ]
            );

            foreach ($request->id_barang as $k => $v) {
                $detail = PenerimaanDetail::create(
                    [
                        'id_penerimaan' => $data->id_penerimaan,
                        'id_barang' => $v,
                        'qty' => $request->qty[$k],
                        'keterangan' => $request->keterangan[$k],
                        'id_rak' => $request->id_rak[$k],
                        'tanggal_kadaluarsa' => $request->tanggal_kadaluarsa[$k],
                        'no_batch' => $request->no_batch[$k],
                    ]
                );
                
            }

            $dataNew = DB::table('hd_penerimaan')
                ->select('hd_penerimaan_detail.id_barang', DB::raw('SUM(hd_penerimaan_detail.qty) AS qty'))
                ->join('hd_penerimaan_detail', 'hd_penerimaan.id_penerimaan', '=', 'hd_penerimaan_detail.id_penerimaan')
                ->where('hd_penerimaan.id_pemesanan', $request->no_pemesanan)
                ->groupBy('hd_penerimaan_detail.id_barang')
                ->pluck('qty', 'id_barang')
                ->toArray();

            $datas = DB::table('hd_pemesanan_detail')
                ->select('hd_pemesanan_detail.*', 'hd_barang.nama_barang', 'hd_barang_satuan.nama_satuan')
                ->join('hd_barang', 'hd_barang.id_barang', '=', 'hd_pemesanan_detail.id_barang')
                ->join('hd_barang_vendor', 'hd_barang.id_barang', '=', 'hd_barang_vendor.id_barang')
                ->join('hd_barang_satuan', 'hd_barang_vendor.id_satuan', '=', 'hd_barang_satuan.id_satuan')
                ->where('id_pemesanan', $request->no_pemesanan);

            $dataOld = $datas->pluck('qty', 'id_barang')->toArray();

            $status = array();
            foreach ($request->id_barang as $k => $v) {
                $status[] = $dataOld[$v] - $dataNew[$v] == 0 ? '3' : '5';

            }
            $statusx =  in_array('5', $status) ? '5' : '3';

            Pemesanan::where('id_pemesanan', $request->no_pemesanan)->update(['status' => $statusx]);

            
        } catch (\Illuminate\Database\QueryException $ex) {
            //throw $th;
            DB::rollback();
            dd($ex->getMessage());
            return redirect()->route('penerimaan.index')
                ->with('danger', 'Penerimaan gagal dibuat');

        }

        DB::commit();

        return redirect()->route('penerimaan.index')
            ->with('success', 'Penerimaan berhasil dibuat');

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

        $dataPenerima = DB::table('hd_penerimaan')
            ->select('hd_penerimaan.*', 'users.name')
            ->join('users', 'users.id', '=', 'hd_penerimaan.diterima_oleh')
            ->where(DB::raw('md5(hd_penerimaan.id_pemesanan)'), $id)
            ->orderBy('no_penerimaan', 'DESC')
            ->first();



        $item = DB::table('hd_penerimaan_detail')
            ->select('hd_penerimaan_detail.*', 'hd_barang.nama_barang', 'hd_barang_satuan.id_satuan', 'hd_barang_satuan.nama_satuan', 'hd_barang_vendor.harga_beli', 'hd_pemesanan_detail.harga')
            ->join('hd_barang', 'hd_penerimaan_detail.id_barang', '=', 'hd_barang.id_barang')
            ->join('hd_barang_vendor', 'hd_barang_vendor.id_barang', '=', 'hd_barang.id_barang')
            ->join('hd_barang_satuan', 'hd_barang_satuan.id_satuan', '=', 'hd_barang_vendor.id_satuan')
            ->join('hd_penerimaan', 'hd_penerimaan.id_penerimaan', '=', 'hd_penerimaan_detail.id_penerimaan')
            ->join('hd_pemesanan_detail', 'hd_pemesanan_detail.id_pemesanan', '=', 'hd_penerimaan.id_pemesanan')
            ->where('hd_penerimaan.id_penerimaan', $dataPenerima->id_penerimaan)
            ->get();

        $datas = DB::table('hd_pemesanan')
            ->select('hd_pemesanan.*', 'users.name', 'hd_vendor.nama_vendor')
            ->join('users', 'users.id', '=', 'hd_pemesanan.dibuat_oleh')
            ->join('hd_vendor', 'hd_vendor.id_vendor', '=', 'hd_pemesanan.id_vendor')
            ->where('hd_pemesanan.no_pemesanan', 'like', '%'. substr($data->no_pemesanan, 0, 16) .'%')
            ->orderBy('hd_pemesanan.no_pemesanan', 'ASC')
            ->get();

        $apotek = DataApotek::first();

        return view('backend.penerimaan.show', compact('data', 'item', 'datas', 'apotek', 'dataPenerima'));
    }


}