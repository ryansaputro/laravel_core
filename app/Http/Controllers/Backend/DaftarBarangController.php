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




class DaftarBarangController extends Controller
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
                ->select('hd_barang.*', 'hd_barang_golongan.nama_golongan', 'hd_barang_jenis.nama_jenis_barang')
                ->join('hd_barang_golongan', 'hd_barang.id_golongan_barang', 'hd_barang_golongan.id_golongan_barang')
                ->join('hd_barang_jenis', 'hd_barang.id_jenis_barang', 'hd_barang_jenis.id_jenis_barang')
                // ->where('hd_barang.status', '1')

                ->orderBy('hd_barang.created_at', 'DESC')
                ->get();
        return view('backend.daftar-barang.index', compact('data'));
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
        return view('backend.daftar-barang.create', compact('golongan', 'jenis', 'satuan'));
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
            'kode_barang' => 'required|max:20|unique:hd_barang,kode_barang',
            'nama_barang' => 'required|unique:hd_barang,nama_barang',
            'id_satuan' => 'required',
            'id_golongan_barang' => 'required',
            'stock_minimal' => 'required|numeric',
            'id_jenis_barang' => 'required',
            'status' => 'required',
            'image.*.*' => 'image|mimes:jpg,png,jpeg'
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

            $barang = Barang::create([
                'kode_barang' => $request->kode_barang,
                'nama_barang' => $request->nama_barang,
                'stock_minimal' => $request->stock_minimal,
                'id_satuan' => $request->id_satuan,
                'id_golongan_barang' => $request->id_golongan_barang,
                'id_jenis_barang' => $request->id_jenis_barang,
                'deskripsi' => $request->deskripsi,
                'dibuat_oleh' => Auth::user()->id,
                'status' => $request->status,
            ]);

            $file = $request->file('image');
            if(isset($file) && count($file) > 0){
                if (!File::isDirectory($this->path)) {
                    File::makeDirectory($this->path, 777, true);
                }
                
                foreach($file AS $k => $v){
                    $fileName = Carbon::now()->timestamp.'-'.str_replace(' ', '-', $request->kode_barang).'-'.str_replace(' ', '-', $request->nama_barang).'.' . $v->getClientOriginalExtension();
                    // $fileName = Carbon::now()->timestamp . '_' . uniqid() . '.' . $file->getClientOriginalExtension();
                    Image::make($v)->save($this->path . '/' . $fileName);
        
                    foreach ($this->dimensions as $row) {
                        $canvas = Image::canvas($row, $row);
                        $resizeImage = Image::make($v)->resize($row, $row, function ($constraint) {
                            $constraint->aspectRatio();
                        });
        
                        if (!File::isDirectory($this->path . '/' . $row)) {
                            File::makeDirectory($this->path . '/' . $row);
                        }
        
                        $canvas->insert($resizeImage, 'center');
                        $canvas->save($this->path . '/' . $row . '/' . $fileName);
                    }
    
                    FotoBarang::create([
                        'id_barang' => $barang->id_barang,
                        'image' => $fileName
                    ]);

                }


            }

            
        } catch (\Illuminate\Database\QueryException $ex) {
            //throw $th;
            DB::rollback();
            return redirect()->route('daftar_barang.index')
                ->with('danger', 'Daftar barang gagal dibuat');

        }

        DB::commit();

        return redirect()->route('daftar_barang.index')
            ->with('success', 'Daftar barang berhasil dibuat');

    }



    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function import()
    {
        return view('backend.daftar-barang.import');
    }


    public function importStore(Request $request)
    {
        
        DB::beginTransaction();
        try {
            //code...

            $rules = [
                'import_file' => 'required|mimes:xls,xlsx',
            ];

            $customMessages = [
                'required' => 'field :attribute harus diisi.',
                'mimes' => 'field :attribute harus berformat xls atau xlsx.',
            ];

            $valid = $this->validate($request, $rules, $customMessages);

            if ($request->hasFile('import_file')) {
                $file = $request->file('import_file'); //GET FILE
                Excel::import(new BarangImport, $file); //IMPORT FILE 
            }  

        } catch (\Throwable $th) {
            //throw $th;
            DB::rollback();
            return redirect()->route('daftar_barang.index')
                ->with('danger', 'Daftar barang gagal dibuat');
        }
        DB::commit();

        return redirect()->route('daftar_barang.index')
            ->with('success', 'Daftar barang berhasil dibuat');
    }


    public function edit($id)
    {
        $barang = Barang::select('hd_barang.*', 'users.name')->join('users', 'hd_barang.dibuat_oleh', '=', 'users.id')->where(DB::raw('md5(id_barang)'), $id)->first();
        $foto = FotoBarang::where(DB::raw('md5(id_barang)'), $id)->get();
        $satuan = Satuan::where('status', '1')->get();
        $golongan = Golongan::where('status', '1')->get();
        $jenis = Jenis::where('status', '1')->get();
        return view('backend.daftar-barang.edit', compact('barang', 'foto', 'satuan', 'golongan', 'jenis'));
    }

    public function update(Request $request, $id)
    {
        print_r("baca ini");
        dd($request->all());
        $key = $request->key;
        if (isset($key)) {
            Barang::where(DB::raw('md5(id_barang)'), $id)->update(['status' => '0']);

            return redirect()->route('daftar_barang.index')
                ->with('success', 'Daftar barang berhasil dihapus');
        }

        $barangAtr = Barang::where(DB::raw('md5(id_barang)'), $id)->first();
        $kode_barang = $barangAtr->kode_barang;
        $nama_barang = $barangAtr->nama_barang;
        $id_barang = $barangAtr->id_barang;

        $rules = [
            'kode_barang' => 'required|max:20|unique:hd_barang,kode_barang,'. $id_barang.',id_barang',
            'nama_barang' => 'required|unique:hd_barang,nama_barang,'. $id_barang .',id_barang', 
            'id_satuan' => 'required',
            'id_golongan_barang' => 'required',
            'stock_minimal' => 'required|numeric',
            'id_jenis_barang' => 'required',
            'status' => 'required',
            'image.*.*' => 'image|mimes:jpg,png,jpeg'
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
            $barang = Barang::where(DB::raw('md5(id_barang)'), $id)->update([
                'kode_barang' => $request->kode_barang,
                'nama_barang' => $request->nama_barang,
                'stock_minimal' => $request->stock_minimal,
                'id_satuan' => $request->id_satuan,
                'id_golongan_barang' => $request->id_golongan_barang,
                'id_jenis_barang' => $request->id_jenis_barang,
                'deskripsi' => $request->deskripsi,
                'dibuat_oleh' => Auth::user()->id,
                'status' => $request->status,
            ]);

            $kdBrg = Barang::where(DB::raw('md5(id_barang)'), $id)->value('id_barang');
            //code...
            $file = $request->file('image');
            if (isset($file) && count($file) > 0) {
                if (!File::isDirectory($this->path)) {
                    File::makeDirectory($this->path, 777, true);
                }

                // $fotoBrg = FotoBarang::where(DB::raw('md5(id_barang)'), $id);
                // $link = $fotoBrg->get();
                // if($fotoBrg->count() > 0){
                //     foreach($link AS $k => $v){
                //         unlink($this->path . '/' . $v->image); 
                //         // print_r($this->path . '/' . $v->image);
                //     }
                // }
                // $jmlFoto = $fotoBrg->count();
                // dd("oke");
                foreach ($file as $k => $v) {
                    $no = $k + 1;
                    $fileName = $no . '-' . str_replace(' ', '-', $request->kode_barang) . '-' . str_replace(' ', '-', $request->nama_barang) . '.' . $v->getClientOriginalExtension();
                    // $fileName = Carbon::now()->timestamp . '_' . uniqid() . '.' . $file->getClientOriginalExtension();
                    Image::make($v)->save($this->path . '/' . $fileName);
                    
                    foreach ($this->dimensions as $row) {
                        $canvas = Image::canvas($row, $row);
                        $resizeImage = Image::make($v)->resize($row, $row, function ($constraint) {
                            $constraint->aspectRatio();
                        });
                        
                        if (!File::isDirectory($this->path . '/' . $row)) {
                            File::makeDirectory($this->path . '/' . $row);
                        }
                        
                        $canvas->insert($resizeImage, 'center');
                        $canvas->save($this->path . '/' . $row . '/' . $fileName);
                    }


                    // if ($jmlFoto > 0) {
                    //     foreach ($link as $k => $v) {
                    //             // unlink($this->path . '/' . $v->image); 
                    //     // print_r($this->path . '/' . $v->image);
                    //         unlink($this->path . '/245/' . $v->image);
                    //         unlink($this->path . '/300/' . $v->image);
                    //         unlink($this->path . '/500/' . $v->image);
                    //     }

                    //     FotoBarang::where(DB::raw('md5(id_barang)'), $id)->update(
                    //         [
                    //             'id_barang' => $kdBrg,
                    //             'image' => $fileName
                    //         ]
                    //     );
                    // } else {
                    //     FotoBarang::create([
                    //         'id_barang' => $kdBrg,
                    //         'image' => $fileName
                    //     ]);

                    // }


                }


            }


        } catch (\Illuminate\Database\QueryException $ex) {
            DB::rollback();
            dd($ex->getMessage());
            return redirect()->route('daftar_barang.index')
                ->with('danger', 'Daftar barang gagal diupdate');            
        }
        DB::commit();

        return redirect()->route('daftar_barang.index')
            ->with('success', 'Daftar barang berhasil diupdate');


    }


    public function ajaxBarangUpdateFoto(Request $request)
    {
        $file = $request->file('image');
        print_r($file);
        dd($request->kode_barang);
        // $prd = Products::updateOrCreate(['prod_code' => 'PR7002']);
        // $prd->prod_name = $row['product_name'];

        // if ($prd->wasRecentlyCreated) {
        //     $prd->prod_brand = $row['brand'];
        // }
        // return response()->json(["status" => 200, 'data' => $data]);
    }


}
