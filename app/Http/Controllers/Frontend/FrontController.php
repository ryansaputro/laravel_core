<?php

/**
 * @author ryan saputro
 * @email ryansaputro52@gmail.com
 * @create date 2019-06-28 08:35:42
 * @modify date 2019-06-28 08:35:42
 * @desc [description]
 */
namespace App\Http\Controllers\Frontend;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Backend\Banner;
use App\Model\Backend\Menu;
use App\Model\Backend\Article;
use App\Model\Backend\ArticleMedia;
use App\Model\Backend\ArticleLike;
use App\Model\Backend\ArticleComment;
use App\Model\Backend\Category;
use App\User;
use DB;
use Browser;
use Auth;



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
        $datas = DB::table('articles')
            ->select('articles.*', 'users.name', 'articles_category.name AS category', 'articles_category.id AS id_cat')
            ->join('users', 'users.id', '=', 'articles.created_by')
            ->join('articles_category', 'articles_category.id', '=', 'articles.id_category')
            ->where('articles.status', '1');
            
        $articles = $datas->orderBy('articles.created_at', 'DESC')->get();
        $category = $datas->selectRaw('COUNT(articles_category.id) AS jumlah, articles_category.name AS category')
            ->groupBy('category')
            ->orderBy('articles.created_at', 'DESC')
            ->get();

        $media = ArticleMedia::get();
        $data = ArticleLike::select('status', 'id_articles')->where('status', '1');
        $dataC = DB::table('articles_comments')
            ->select('articles_comments.created_at', 'articles_comments.comment', 'articles_comments.id_articles', 'users.name')
            ->join('users', 'articles_comments.id_user', '=', 'users.id')
            ->where('status', '1')
            ->get();
        foreach($dataC AS $k => $v){
            $comment[$v->id_articles][] = array("date" =>$v->created_at, "name" =>$v->name, "comment" => $v->comment);
        }
        // dd($comment);
        $id = !isset(Auth::user()->id) ? 'xxx' : Auth::user()->id;
        if($id != 'xxx'){
            $data->where('id_user', Auth::user()->id);
        }
        $like = $data->pluck('status', 'id_articles')->toArray();
        $Totlike = ArticleLike::select('id_articles', DB::raw('COUNT(id_articles) AS total'))->where('status', '1')->groupBy('id_articles')->pluck('total','id_articles')->toArray();
        return view('frontend.front.home', compact('comment', 'banners', 'dataQuery', 'articles', 'media', 'like', 'Totlike', 'category'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function comments(Request $request)
    {
        if ($request->ajax()) {
            
            DB::beginTransaction();
            
            try {
                //code...
                $id = $request->id;
                $comment = $request->data;
                $id_user = Auth::user()->id;
                $name = User::find($id_user)->value('name');
        
                $server = $_SERVER['HTTP_USER_AGENT'];
                if (isset($_SERVER['HTTP_CLIENT_IP']))
                    $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
                else if (isset($_SERVER['HTTP_X_FORWARDED_FOR']))
                    $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
                else if (isset($_SERVER['HTTP_X_FORWARDED']))
                    $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
                else if (isset($_SERVER['HTTP_FORWARDED_FOR']))
                    $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
                else if (isset($_SERVER['HTTP_FORWARDED']))
                    $ipaddress = $_SERVER['HTTP_FORWARDED'];
                else if (isset($_SERVER['REMOTE_ADDR']))
                    $ipaddress = $_SERVER['REMOTE_ADDR'];
                else
                    $ipaddress = 'UNKNOWN';
    
                $platform = Browser::platformName();
                $browser = Browser::browserName();
                $userAgent = Browser::userAgent();
                ArticleComment::create([
                    'id_articles' => $id,
                    'id_user' => $id_user,
                    'comment' => $comment,
                    'ip_address' => $ipaddress,
                    'browser' => $platform,
                    'platform' => $browser,
                    'status' => 1
                ]);
                $TotComent = ArticleComment::select('id_articles', DB::raw('COUNT(id_articles) AS total'))->where('id_articles', $id)->where('status', '1')->groupBy('id_articles')->count();
            } catch (\Illuminate\Database\QueryException $ex) {
                DB::rollback();
                dd($ex->getMessage());
                return redirect()->route('article.index')
                    ->with('danger', 'Artikel updated failed');

            }            
            
            DB::commit();
        
        }
        return response()->json(["status" => 200, 'comment' => $comment, 'name' => $name, 'total' => $TotComent]);

    }

    public function likes(Request $request)
    {
        if ($request->ajax()) {
            $id = $request->data;
            $id_user = Auth::user()->id;

            $status = ArticleLike::where('id_articles', $id)->where('id_user', $id_user)->where('status', '1')->count();
            $status = ($status == 1) ? '0' : '1';

            $server = $_SERVER['HTTP_USER_AGENT'];
            if (isset($_SERVER['HTTP_CLIENT_IP']))
                $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
            else if (isset($_SERVER['HTTP_X_FORWARDED_FOR']))
                $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
            else if (isset($_SERVER['HTTP_X_FORWARDED']))
                $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
            else if (isset($_SERVER['HTTP_FORWARDED_FOR']))
                $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
            else if (isset($_SERVER['HTTP_FORWARDED']))
                $ipaddress = $_SERVER['HTTP_FORWARDED'];
            else if (isset($_SERVER['REMOTE_ADDR']))
                $ipaddress = $_SERVER['REMOTE_ADDR'];
            else
                $ipaddress = 'UNKNOWN';

            $platform = Browser::platformName();
            $browser = Browser::browserName();
            $userAgent = Browser::userAgent();
            ArticleLike::updateOrCreate([
                'id_articles' => $id,
                'id_user' => $id_user],[
                'ip_address' => $ipaddress,
                'browser' => $platform,
                'platform' => $browser,
                'status' => $status
            ]);
            $Totlike = ArticleLike::select('id_articles', DB::raw('COUNT(id_articles) AS total'))->where('id_articles', $id)->where('status', '1')->groupBy('id_articles')->count();

        }
        return response()->json(["status" => 200, 'data' => $status, 'like' => $Totlike]);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function likeShow(Request $request)
    {
        if ($request->ajax()) {
            $id = $request->data;

            $like = DB::table('articles_likes')
                ->select('articles_likes.updated_at', 'users.name')
                ->join('users', 'users.id', 'articles_likes.id_user')
                ->where('id_articles', $id)
                ->where('status', '1')
                ->get();
        }
        return response()->json(["status" => 200, 'like' => $like]);

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