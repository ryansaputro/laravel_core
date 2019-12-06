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
use App\Model\Backend\Article;
use App\Model\Backend\ArticleMedia;
use App\Model\Backend\Category;
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
        $this->middleware('permission:article-list');
        $this->middleware('permission:article-create', ['only' => ['create', 'store']]);
        $this->middleware('permission:article-edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:article-delete', ['only' => ['destroy']]);
    }


    public function index(Request $request)
    {
        
        $data = DB::table('hd_pemesanan')
                ->select('hd_pemesanan.*', 'hd_vendor.nama_vendor', 'users.name')
                ->join('hd_vendor', 'hd_vendor.id_vendor', '=', 'hd_pemesanan.id_vendor')
                ->join('users', 'users.id', '=', 'hd_pemesanan.dibuat_oleh')
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
        $result = substr($data->no_pemesanan, 0, 3);
        $no = (Int)$result + 1;
        if($no < 10){
            $no_pemesanan = "00" . $no.substr($data->no_pemesanan, 3, 5).date('dmY') ;
        }else if($no < 100){
            $no_pemesanan = "0" . $no.substr($data->no_pemesanan, 3, 5).date('dmY');
        }else{
            $no_pemesanan = $no.substr($data->no_pemesanan, 3, 5).date('dmY');
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
            'id_barang' => 'array',
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
                ]
            );

            foreach($request->id_barang AS $k => $v):
                $detail = PemesananDetail::create(
                    [
                        'id_pemesanan' => $data->id_pemesanan,
                        'id_barang' => $v,
                        'qty' => $request->qty[$k],
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
        $data = Pemesanan::where('id_pemesanan', $id)->orderBy('no_pemesanan', 'DESC')->limit(1)->first();
        $result = substr($data->no_pemesanan, 0, 3);
        $no = (Int)$result + 1;
        if ($no < 10) {
            $no_pemesanan = "00" . $no . substr($data->no_pemesanan, 3, 5) . date('dmY');
        } else if ($no < 100) {
            $no_pemesanan = "0" . $no . substr($data->no_pemesanan, 3, 5) . date('dmY');
        } else {
            $no_pemesanan = $no . substr($data->no_pemesanan, 3, 5) . date('dmY');
        }
        $vendor = Vendor::where('status', '1')->get();
        return view('backend.pemesanan.edit', compact('vendor', 'no_pemesanan', 'data'));

    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required',
            'description' => 'required',
            'image' => 'image|mimes:jpg,png,jpeg'
        ]);
		


        DB::beginTransaction();
        try {
            //code...
            if (!File::isDirectory($this->path)) {
                File::makeDirectory($this->path, 777, true);
            }
            $banner = Banner::where('id', $id);
            $ImgOld = $banner->value('data');
            $DmnsOld = $banner->value('dimension');
            $file = $request->file('image');
            if($file != null){
                $fileName = Carbon::now()->timestamp . '_' . uniqid() . '.' . $file->getClientOriginalExtension();
                Image::make($file)->save($this->path . '/' . $fileName);

                foreach ($this->dimensions as $row) {
                    $canvas = Image::canvas($row, $row);
                    $resizeImage = Image::make($file)->resize($row, $row, function ($constraint) {
                        $constraint->aspectRatio();
                    });

                    if (!File::isDirectory($this->path . '/' . $row)) {
                        File::makeDirectory($this->path . '/' . $row);
                    }

                    $canvas->insert($resizeImage, 'center');
                    $canvas->save($this->path . '/' . $row . '/' . $fileName);
                }

            }

            Banner::find($id)->update([
                'name' => $request->name,
                'description' => $request->description,
                'data' => ($file != null ? $fileName : $ImgOld),
                'dimension' => ($file != null ? implode('|', $this->dimensions) : $DmnsOld),
                'path' => $this->path,
                'status' => '1',
                'created_by' => Auth::user()->id
            ]);

        } catch (\Illuminate\Database\QueryException $ex) {
            DB::rollback();
            return redirect()->route('banner.index')
                ->with('danger', 'Banner updated failed');
        }

        DB::commit();

        return redirect()->route('banner.index')
                            ->with('success', 'Banner updated successfully');

    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        
        DB::beginTransaction();
        try {
            //code...
            $data = Banner::find($id);
            $data->delete();

        } catch (\Throwable $th) {
            //throw $th;
            DB::rollback();
            return redirect()->route('banner.index')
                ->with('failed', 'Banner deleted failed');

        }
        DB::commit();

        return redirect()->route('banner.index')
                        ->with('success','Banner deleted successfully');
    }
}