<?php
namespace App\Http\Controllers\Frontend;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Backend\Banner;
use App\Model\Backend\Menu;
use App\Model\Backend\Article;
use DB;



class FrontController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $banners = Banner::where('status', 1)->get();
        $dataQuery = Menu::all();
        $articles = DB::table('articles')
                    ->select('articles.*', 'users.name', 'articles_category.name AS category')
                    ->join('users', 'users.id', '=', 'articles.created_by')
                    ->join('articles_category', 'articles_category.id', '=', 'articles.id_category')
                    ->where('articles.status', 1)
                    ->orderBy('articles.created_at', 'DESC')
                    ->get();
        return view('frontend.front.home', compact('banners', 'dataQuery', 'articles'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('ItemCRUD2.create');
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
            'title' => 'required',
            'description' => 'required',
        ]);


        Item::create($request->all());


        return redirect()->route('itemCRUD2.index')
                        ->with('success','Item created successfully');
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $item = Item::find($id);
        return view('ItemCRUD2.show',compact('item'));
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $item = Item::find($id);
        return view('ItemCRUD2.edit',compact('item'));
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
            'title' => 'required',
            'description' => 'required',
        ]);


        Item::find($id)->update($request->all());


        return redirect()->route('itemCRUD2.index')
                        ->with('success','Item updated successfully');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Item::find($id)->delete();
        return redirect()->route('itemCRUD2.index')
                        ->with('success','Item deleted successfully');
    }
}