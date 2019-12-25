<?php

/**
 * @author ryan saputro
 * @email ryansaputro52@gmail.com
 * @create date 2019-06-28 08:34:10
 * @modify date 2019-06-28 08:34:10
 * @desc [description]
 */
namespace App\Http\Controllers\Backend;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Item;
// use ConsoleTVs\Charts\Charts;;
use ConsoleTVs\Charts\Facades\Charts AS Charts;
use App\User;
use DB;


class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $users = User::where(DB::raw("(DATE_FORMAT(created_at,'%Y'))"), date('Y'))
            ->get();
        $chart = Charts::database($users, 'area', 'fusioncharts')
            ->title("Monthly new Register Users")
            ->elementLabel("Total Users")
            // ->dimensions(500, 500)
            ->responsive(false)
            ->groupByMonth(date('Y'), true);

        $pie = Charts::multi('bar', 'fusioncharts')
                ->colors(['#ff0000', '#00ff00', '#0000ff'])
                ->labels(['Pemesanan', 'Penerimaan', 'Invoice'])
                ->dataset('Test 1', [1, 2, 3])
                ->dataset('Test 2', [0, 6, 0])
                ->dataset('Test 3', [3, 4, 1]);


        return view('backend.dashboard.index', compact('chart','pie'));
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