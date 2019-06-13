<?php
namespace App\Http\Controllers\Backend;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Backend\Permission;
use DB;
use Illuminate\Validation\Rule;


class PermissionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    function __construct()
    {
        $this->middleware('permission:permission-list');
        $this->middleware('permission:permission-create', ['only' => ['create', 'store']]);
        $this->middleware('permission:permission-edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:permission-delete', ['only' => ['destroy']]);
    }



    public function index(Request $request)
    {
        $data = Permission::orderBy('created_at', 'DESC')->get();
        return view('backend.permission.index', compact('data'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.permission.create', compact('option'));
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
                    "name" => "required|array|min:1",
                    "name.*" => "required|string|distinct|unique:permissions,name|min:1",
                    'guard_name' => 'required',
        ]);

                        
        DB::beginTransaction();
        try {
            //code...
           foreach($request->name AS $k => $v){
               Permission::create([
                   'name' => $v,
                   'guard_name' => 'web',
               ]);
           }
            
        } catch (\Illuminate\Database\QueryException $ex) {
            DB::rollback();
            return redirect()->route('permission.index')
                ->with('danger', 'Permission created failed');
        }
        
        DB::commit();
        
        return redirect()->route('permission.index')
                        ->with('success','Permission created successfully');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $permission = Permission::find($id);
        $nameLike = explode('-', $permission->name);
        $permissionArrId = Permission::where('name', 'LIKE', '%'. $nameLike[0]. '%')->pluck('id', 'name')->toArray () ;
        $permissionArr = Permission::where('name', 'LIKE', '%'. $nameLike[0]. '%')->pluck('name', 'id')->toArray () ;
        return view('backend.permission.edit',compact('permission', 'permissionArr', 'permissionArrId', 'nameLike'));
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
            "name" => "required|array|min:3",
            "name.*" => "required|string|distinct|unique:permissions,name|min:3",
            'guard_name' => 'required',
        ]);

        DB::beginTransaction();
        try {
            foreach ($request->name as $key => $value) {
                Permission::find($key)->update(
                    [
                    'id' => $key,
                    'name' => $value,
                    'guard_name' => 'web'
                    ]);
            }
        } catch (\Illuminate\Database\QueryException $ex) {
            //throw $th;

            DB::rollback();
            dd($ex->getMessage());

            return redirect()->route('permission.index')
                ->with('danger', 'Permission updated failed');

        }
        
        DB::commit();
        
        return redirect()->route('permission.index')
                        ->with('success', 'Permission updated successfully');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Permission::find($id)->delete();
        return redirect()->route('permission.index')
                        ->with('success','Permission deleted successfully');
    }
}