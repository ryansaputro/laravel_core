<?php
namespace App\Http\Controllers\Backend;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Backend\Article;
use App\Model\Backend\ArticleMedia;
use App\Model\Backend\Category;
use DB;
use Auth;



class ArticleController extends Controller
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
        $data = Article::where('status', 1)->orderBy('created_at', 'DESC')->get();
        return view('backend.article.index', compact('data'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $category = Category::where('status','1')->get();
        return view('backend.article.create', compact('category'));
    }


    public function ajaxFieldArticle(Request $request){
        dd($request->all());
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required|max:100|unique:articles,title',
            'description' => 'required',
        ]);
        //     print_r(public_path());
        // dd($request->all());
            // dd();
        DB::beginTransaction();
        try {
            //code...
            $data = Article::create(
                [
                    'title' => $request->title,
                    'id_category' => $request->id_category,
                    'description' => $request->description,
                    'status' => '1',
                    'created_by' => Auth::user()->id,

                ]
            );

            $file = $request->file('uploadFile');
            $destinationPath = public_path('articles');
            if($file != null){
                $this->validate($request, [
                    'uploadFile' => 'array',
                    'uploadFile.*' => 'mimes:jpg,jpeg,png,bmp,mov,mp4,ogg|max:2000'
                ]);
                foreach ($file as $key => $value) {
                    $imageName = uniqid() . '.' . $value->getClientOriginalExtension();
                    $value->move($destinationPath, $imageName);
                    ArticleMedia::create([
                        'id_articles' => $data->id,
                        'media' => $imageName,
                        'extension' => $value->getClientOriginalExtension()
                    ]);
                }

            }

            
        } catch (\Illuminate\Database\QueryException $ex) {
            //throw $th;
            DB::rollback();
            dd($ex->getMessage());
            return redirect()->route('article.index')
                ->with('danger', 'Artikel updated failed');

        }

        DB::commit();

        return redirect()->route('article.index')
            ->with('success', 'Artikel updated successfully');

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