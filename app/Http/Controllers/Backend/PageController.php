<?php

/**
 * @author ryan saputro
 * @email ryansaputro52@gmail.com
 * @create date 2019-06-28 08:34:01
 * @modify date 2019-06-28 08:34:01
 * @desc [description]
 */
namespace App\Http\Controllers\Backend;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Backend\Permission;
use App\Model\Backend\PageDetail;
use App\Model\Backend\Page;
use App\Model\Backend\Route;
use DB;
use Illuminate\Validation\Rule;
use Auth;
use Illuminate\Support\Facades\Schema;



class PageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    function __construct()
    {
        $this->middleware('permission:pages-list');
        $this->middleware('permission:pages-create', ['only' => ['create', 'store']]);
        $this->middleware('permission:pages-edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:pages-delete', ['only' => ['destroy']]);
    }



    public function index(Request $request)
    {
        $data = Page::where('status', 1)->orderBy('created_at', 'DESC')->get();
        return view('backend.pages.index', compact('data'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $tables = DB::select('SHOW TABLES');
        return view('backend.pages.create', compact('tables'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function ajaxFieldPages(Request $request)
    {
        $data = Schema::getColumnListing($request->data);
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
        $name = strtolower($request->name);
        $url = '/'.str_replace(' ', '-', $name);
        if($request->pages_type == 'custom'){
            $this->validate($request, [
                "name" => "required|unique:pages,name",
                "pages_type" => "required",
                "custom_html" => "required",
                "status" => "required",
                ]);

        }else{
                $this->validate($request, [
                    "name" => "required|unique:pages,name",
                    "pages_type" => "required",
                    "table" => "required",
                    "table" => "required",
                    "condition" => "required",
                    "orderby" => "required",
                    "status" => "required",
                    "groupby" => "required",
                    ]);
            
                $query = "";
                $query .= 'SELECT * from ';
                $query .= $request->table;
                $query .= ($request->condition != 'none' ? ' WHERE ' . $request->condition . ' ' . $request->operator . ' ' . $request->filter : '');
                $query .= ($request->groupby != 'none' ? " GROUP BY " . $request->groupby : '');
                $query .= ($request->orderby != 'none') ? " ORDER BY " . $request->orderby . ' ' . $request->orderbyAtoZ : '';

                    // $query = "SELECT * from ".$request->table. ($request->condition != 'none' ? ' WHERE '. $request->condition. ' '.$request->operator.' '.$request->filter : '') . ($request->groupby != 'none' ? " GROUP BY " . $request->groupby : '') .' '.($request->orderby != 'none') ? " ORDER BY ".$request->orderby. ' '. $request->orderbyAtoZ : '';
        }
        DB::beginTransaction();
        try {
            //code...
            $data = Page::create([
                'name' => $request->name,
                'url' => $url,
                'pages_type' => $request->pages_type,
                'created_by' => Auth::user()->id,
            ]);

            PageDetail::create([
                'id_page' => $data->id,
                'custom_html' => $request->pages_type == 'custom' ? $request->custom_html  : $query,
            ]);

            Route::create([
                'url' => $url,
                'name_as' => $request->name,
                'uses_controller' => 'Frontend\CustomPageController',
                'created_by' => Auth::user()->id,
            ]);
            
        } catch (\Illuminate\Database\QueryException $ex) {
            DB::rollback();
            return redirect()->route('pages.index')
                ->with('danger', 'Pages created failed');
        }
        
        DB::commit();
        
        return redirect()->route('pages.index')
                        ->with('success','Pages created successfully');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $pages = DB::table('pages')
                ->select('pages.*', 'pages_detail.custom_html')
                ->join('pages_detail', 'pages.id', '=', 'pages_detail.id_page')
                ->where('pages.id', $id)
                ->first();
        $tables = DB::select('SHOW TABLES');
        return view('backend.pages.edit', compact('tables', 'pages'));
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
        $name = strtolower($request->name);
        $url = '/' . str_replace(' ', '-', $name);

        if ($request->pages_type == 'custom') {
            $this->validate($request, [
                "name" => "required|unique:pages,name,".$id,
                "pages_type" => "required",
                "custom_html" => "required",
                "status" => "required",
            ]);

        } else {
            $this->validate($request, [
                "name" => "required|unique:pages,name,".$id,
                "pages_type" => "required",
                "table" => "required",
                "table" => "required",
                "condition" => "required",
                "orderby" => "required",
                "status" => "required",
                "groupby" => "required",
            ]);

            $query = "";
            $query .= 'SELECT * from ';
            $query .= $request->table;
            $query .= ($request->condition != 'none' ? ' WHERE ' . $request->condition . ' ' . $request->operator . ' ' . $request->filter : '');
            $query .= ($request->groupby != 'none' ? " GROUP BY " . $request->groupby : '');
            $query .= ($request->orderby != 'none') ? " ORDER BY " . $request->orderby . ' ' . $request->orderbyAtoZ : '';
        }
        // $tes = tes;
        // dd($query);

        DB::beginTransaction();
        try {
            //code...
            $data = Page::find($id)->update([
                'name' => $request->name,
                'url' => $url,
                'pages_type' => $request->pages_type,
                'created_by' => Auth::user()->id,
            ]);

            PageDetail::where('id_page', $id)->update([
                'id_page' => $id,
                'custom_html' => $request->pages_type == 'custom' ? $request->custom_html : $query,
            ]);

        } catch (\Illuminate\Database\QueryException $ex) {
            DB::rollback();
            dd($ex->getMessage());
            return redirect()->route('pages.index')
                ->with('danger', 'Pages updated failed');
        }

        DB::commit();

        return redirect()->route('pages.index')
                            ->with('success', 'Pages updated successfully');

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
            $data = Page::find($id);
            PageDetail::where('id_page', $id)->delete();
            DB::table('routes')->where('url', $data->url)->delete();
            $data->delete();

        } catch (\Throwable $th) {
            //throw $th;
            DB::rollback();
            return redirect()->route('pages.index')
                ->with('failed', 'Page deleted failed');

        }
        DB::commit();

        return redirect()->route('pages.index')
                        ->with('success','Page deleted successfully');
    }
}