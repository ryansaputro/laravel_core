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
use App\Model\Backend\Satuan;
use App\Model\Backend\Golongan;
use App\Model\Backend\Jenis;
use App\Model\Backend\FotoBarang;
use App\Model\Backend\Barang;
use DB;
use Auth;
use Carbon\Carbon;
use File;
use Intervention\Image\ImageManagerStatic as Image;
use Excel;
use App\Imports\BarangImport;




class BarangVendorController extends Controller
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
        $this->middleware('permission:daftar_barang-list');
        $this->middleware('permission:daftar_barang-create', ['only' => ['create', 'store']]);
        $this->middleware('permission:daftar_barang-edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:daftar_barang-delete', ['only' => ['destroy']]);

        $this->path = public_path('images/list-barang');
        $this->dimensions = ['245', '300', '500'];

    }


    public function index(Request $request)
    {
        
        $data = DB::table('hd_barang')
                ->select('hd_vendor.nama_vendor', 'hd_barang.*', 'hd_barang_golongan.nama_golongan', 'hd_barang_jenis.nama_jenis_barang', 'hd_barang_vendor.id AS id_barang_vendor', 'hd_barang_vendor.harga_beli', 'hd_barang_vendor.qty', 'hd_barang_vendor.harga_jual', 'hd_barang_satuan.nama_satuan')
                ->join('hd_barang_golongan', 'hd_barang.id_golongan_barang', 'hd_barang_golongan.id_golongan_barang')
                ->join('hd_barang_jenis', 'hd_barang.id_jenis_barang', 'hd_barang_jenis.id_jenis_barang')
                ->join('hd_barang_satuan', 'hd_barang.id_satuan', 'hd_barang_satuan.id_satuan')
                ->join('hd_barang_vendor', 'hd_barang.id_barang', 'hd_barang_vendor.id_barang')
                ->join('hd_vendor', 'hd_vendor.id_vendor', 'hd_barang_vendor.id_vendor')
                // ->where('hd_barang.status', '1')

                ->orderBy('hd_barang.created_at', 'DESC')
                ->get();
        return view('backend.barang-vendor.index', compact('data'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $satuan = Satuan::where('status','1')->get();
        $golongan = Golongan::where('status','1')->get();
        $jenis = Jenis::where('status','1')->get();
        $barang = DB::table('hd_barang')
                ->select('hd_barang.*', 'hd_barang_golongan.nama_golongan', 'hd_barang_jenis.nama_jenis_barang')
                ->join('hd_barang_golongan', 'hd_barang.id_golongan_barang', 'hd_barang_golongan.id_golongan_barang')
                ->join('hd_barang_jenis', 'hd_barang.id_jenis_barang', 'hd_barang_jenis.id_jenis_barang')
                ->where('hd_barang.status', '1')
                ->orderBy('hd_barang.created_at', 'DESC')
                ->get();
        $vendor = Vendor::where('status', '1')->get();
        return view('backend.barang-vendor.create', compact('golongan', 'jenis', 'satuan', 'barang', 'vendor'));
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
            'id_barang.*' => 'required',
            'id_vendor.*' => 'required',
            'id_satuan.*' => 'required',
            'qty.*' => 'required|numeric',
            'harga_beli.*' => 'required|numeric',
            'harga_jual.*' => 'required|numeric',
        ];

        $customMessages = [
            'required' => 'field :attribute harus diisi.',
            'numeric' => 'field :attribute harus dengan angka.',
            'unique' => 'field :attribute harus tidak boleh sama.',
            'image' => 'field :attribute harus berformat gambar.',
            'mimes' => 'field :attribute harus berformat jpg,png,jpeg.',
            'array' => 'field :attribute dapat berupa array.',
        ];

        $valid = $this->validate($request, $rules, $customMessages);
            
        DB::beginTransaction();
        try {

            foreach($request->id_barang AS $k => $v){
                $barang = BarangVendor::create([
                    'id_barang' => $v,
                    'id_vendor' => $request->id_vendor[$k],
                    'id_satuan' => $request->id_satuan[$k],
                    'qty' => $request->qty[$k],
                    'harga_beli' => $request->harga_beli[$k],
                    'harga_jual' => $request->harga_jual[$k],
                    'dibuat_oleh' => Auth::user()->id,
                    'status' => $request->status[$k],
                ]);
            }

            
        } catch (\Illuminate\Database\QueryException $ex) {
            //throw $th;
            DB::rollback();
            return redirect()->route('barang_vendor.index')
                ->with('danger', 'Daftar barang gagal dibuat');

        }

        DB::commit();

        return redirect()->route('barang_vendor.index')
            ->with('success', 'Daftar barang berhasil dibuat');

    }


    public function edit($id)
    {
        $satuan = Satuan::where('status', '1')->get();
        $golongan = Golongan::where('status', '1')->get();
        $jenis = Jenis::where('status', '1')->get();
        $barang = DB::table('hd_barang')
            ->select('hd_barang.*', 'hd_barang_golongan.nama_golongan', 'hd_barang_jenis.nama_jenis_barang')
            ->join('hd_barang_golongan', 'hd_barang.id_golongan_barang', 'hd_barang_golongan.id_golongan_barang')
            ->join('hd_barang_jenis', 'hd_barang.id_jenis_barang', 'hd_barang_jenis.id_jenis_barang')
            ->where('hd_barang.status', '1')
            ->orderBy('hd_barang.created_at', 'DESC')
            ->get();
        $vendor = Vendor::where('status', '1')->get();
        $barangSelected = BarangVendor::where(DB::raw('md5(id)'), $id)->first();
        return view('backend.barang-vendor.edit', compact('id', 'vendor', 'barang', 'foto', 'satuan', 'golongan', 'jenis', 'barangSelected'));
    }

    public function update(Request $request, $id)
    {
        
        
        DB::beginTransaction();
        try {
            $rules = [
                'id_barang.*' => 'required',
                'id_vendor.*' => 'required',
                'id_satuan.*' => 'required',
                'qty.*' => 'required|numeric',
                'harga_beli.*' => 'required|numeric',
                'harga_jual.*' => 'required|numeric',
            ];

            $customMessages = [
                'required' => 'field :attribute harus diisi.',
                'numeric' => 'field :attribute harus dengan angka.',
                'unique' => 'field :attribute harus tidak boleh sama.',
                'image' => 'field :attribute harus berformat gambar.',
                'mimes' => 'field :attribute harus berformat jpg,png,jpeg.',
                'array' => 'field :attribute dapat berupa array.',
            ];

            $valid = $this->validate($request, $rules, $customMessages);

            foreach ($request->id_barang as $k => $v) {
                $barang = BarangVendor::where(DB::raw('md5(id)'), $id)->update([
                    'id_barang' => $v,
                    'id_vendor' => $request->id_vendor[$k],
                    'id_satuan' => $request->id_satuan[$k],
                    'qty' => $request->qty[$k],
                    'harga_beli' => $request->harga_beli[$k],
                    'harga_jual' => $request->harga_jual[$k],
                    'dibuat_oleh' => Auth::user()->id,
                    'status' => $request->status[$k],
                ]);
            }


        } catch (\Illuminate\Database\QueryException $ex) {
            DB::rollback();
            dd($ex->getMessage());
            return redirect()->route('barang_vendor.index')
                ->with('danger', 'Barang vendor gagal diupdate');            
        }
        DB::commit();

        return redirect()->route('barang_vendor.index')
            ->with('success', 'Barang vendor berhasil diupdate');


    }

}
