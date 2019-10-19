<?php

/**
 * @author ryan saputro
 * @email ryansaputro52@gmail.com
 * @create date 2019-06-28 08:35:36
 * @modify date 2019-06-28 08:35:36
 * @desc [description]
 */
namespace App\Http\Controllers\Frontend;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Backend\PageDetail;
use App\Model\Backend\Page;
use App\Model\Backend\Route;
use Illuminate\Support\Facades\URL;
use DB;


class CustomPageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $url = app('router')->getRoutes()->match(app('request'));
        $data = DB::table('pages')
                ->select('pages.*', 'pages_detail.custom_html')
                ->join('pages_detail', 'pages.id', '=', 'pages_detail.id_page')
                ->where('pages.url', '/'.$url->uri)
                ->first();

        if($data->pages_type == 'query'){
            $dataQuery = DB::select($data->custom_html);
        }
        return view('frontend.custom.index', compact('data', 'dataQuery'));
    }


}