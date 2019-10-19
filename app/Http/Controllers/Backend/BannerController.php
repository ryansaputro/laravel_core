<?php

/**
 * @author ryan saputro
 * @email ryansaputro52@gmail.com
 * @create date 2019-06-28 08:34:30
 * @modify date 2019-06-28 08:34:30
 * @desc [description]
 */
namespace App\Http\Controllers\Backend;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Backend\Banner;
use Carbon\Carbon;
use Intervention\Image\ImageManagerStatic as Image;
use File;
use DB;
use Illuminate\Validation\Rule;
use Auth;



class BannerController extends Controller
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
        $this->middleware('permission:banner-list');
        $this->middleware('permission:banner-create', ['only' => ['create', 'store']]);
        $this->middleware('permission:banner-edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:banner-delete', ['only' => ['destroy']]);
        $this->path = public_path('images/banner');
        $this->dimensions = ['245', '300', '500'];

    }


    public function index(Request $request)
    {
        $data = Banner::where('status', 1)->orderBy('created_at', 'DESC')->get();
        return view('backend.banner.index', compact('data'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.banner.create');
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {   
        
        DB::beginTransaction();
        try {
            $this->validate($request, [
                'name' => 'required',
                'description' => 'required',
                'image' => 'required|image|mimes:jpg,png,jpeg'
            ]);
		
            if (!File::isDirectory($this->path)) {
                File::makeDirectory($this->path,777, true);
            }
            
            $file = $request->file('image');
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
        
            Banner::create([
                'name' => $request->name,
                'description' => $request->description ,
                'data' => $fileName,
                'dimension' => implode('|', $this->dimensions),
                'path' => $this->path,
                'status' => '1',
                'created_by' => Auth::user()->id
            ]);
            
        } catch (\Illuminate\Database\QueryException $ex) {
            DB::rollback();
            return redirect()->route('banner.index')
                ->with('danger', 'Banner created failed');
        }
        
        DB::commit();
        
        return redirect()->route('banner.index')
                        ->with('success','Banner created successfully');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $banner = Banner::find($id); 
        return view('backend.banner.edit', compact('banner'));
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