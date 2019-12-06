<?php

/**
 * @author ryan saputro
 * @email ryansaputro52@gmail.com
 * @create date 2019-06-28 08:34:59
 * @modify date 2019-06-28 08:34:59
 * @desc [description]
 */
namespace App\Http\Controllers\Backend;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Backend\Meta;
use DB;


class MetaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    function __construct()
    {
        $this->middleware('permission:meta-list');
        $this->middleware('permission:meta-create', ['only' => ['create', 'store']]);
        $this->middleware('permission:meta-edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:meta-delete', ['only' => ['destroy']]);
    }



    public function index(Request $request)
    {
        $data = Meta::orderBy('created_at', 'DESC')->get();
        return view('backend.meta.index', compact('data'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.meta.create');
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
            'name' => 'required',
            'description' => 'required',
            'content' => 'required',
        ]);
        
        
        DB::beginTransaction();
        try {
            //code...
            Meta::create([
                'name' => $request->name,
                'description' => $request->description,
                'content' => $request->content,
                'status' => '1'
            ]);
            
        } catch (\Throwable $th) {
            DB::rollback();
            return redirect()->route('meta.index')
                ->with('danger', 'Meta created failed');
        }
        
        DB::commit();
        
        return redirect()->route('meta.index')
                        ->with('success','Meta created successfully');
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $meta = Meta::find($id);
        return view('backend.meta.show',compact('meta'));
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $meta = Meta::find($id);
        return view('backend.meta.edit',compact('meta'));
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
            'content' => 'required',
            'status' => 'required',
        ]);
        DB::beginTransaction();
        try {
            //code...
            Meta::find($id)->update(
                [
                'name' => $request->name,
                'description' => $request->description,
                'content' => $request->content,
                'status' => $request->status
                ]);
        } catch (\Throwable $th) {
            //throw $th;
            DB::rollback();
            return redirect()->route('meta.index')
                ->with('danger', 'Meta updated failed');

        }
        
        DB::commit();
        
        return redirect()->route('meta.index')
                        ->with('success','Meta updated successfully');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Meta::find($id)->delete();
        return redirect()->route('meta.index')
                        ->with('success','Meta deleted successfully');
    }
}