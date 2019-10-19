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
use App\Model\Backend\DataApotek;
use DB;
use Artisan;




class FrontController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        // $dataQuery = Menu::all();
        // if (DB::connection()->getDatabaseName()) {
        //     echo "conncted sucessfully to database " . DB::connection()->getDatabaseName();
        // }else{
        //     echo "gagal";
        // }
        return view('frontend.front.home');
    }

    public function step1(Request $request)
    {
        if (DB::connection()->getDatabaseName()) {
            $data = DataApotek::all()->count();
            if ($data == 0)
                return view('installation.step1');
            else
                return redirect('/');
        } else {
            return view('installation.step1');
        }
    }

    public function step2(Request $request)
    {
        // $new = base_path('.env');
        // if (file_exists($new)) {
        //     return redirect('/');
        // }

        return view('installation.step2');
    }

    public function step2Checking(Request $request)
    {
        DB::beginTransaction();
        
        try {
            $this->validate($request, [
                'nama' => 'required',
                'username' => 'required',
            ]);

            $new = base_path('.env');
            // $del = unlink($new);

            $myfile = fopen($new, "w") or die("Unable to open file!");
            $txt = 'APP_NAME=Laravel
                    APP_ENV=local
                    APP_KEY=base64:oYIShHR4b/qAT8+Qk8vTrNlQiey5BOeRSDoqW+RACJQ=
                    APP_DEBUG=true
                    APP_URL=http://localhost

                    TWITTER_ID=
                    TWITTER_SECRET=
                    TWITTER_URL=

                    FORCE_HTTPS=true

                    FB_ID=410986022813111
                    FB_SECRET=8c25989af2eab46952c2632532ce14e7
                    FB_URL=https://127.0.0.1:8000/auth/facebook/callback

                    GOOGLE_ID=
                    GOOGLE_SECRET=
                    GOOGLE_URL=

                    LOG_CHANNEL=stack

                    DB_CONNECTION=mysql
                    DB_HOST=127.0.0.1
                    DB_PORT=3306
                    DB_DATABASE=' . $request->nama . '
                    DB_USERNAME=' . $request->username . '
                    DB_PASSWORD=' . $request->password . '

                    BROADCAST_DRIVER=log
                    CACHE_DRIVER=array
                    QUEUE_CONNECTION=sync
                    SESSION_DRIVER=file
                    SESSION_LIFETIME=120

                    REDIS_HOST=127.0.0.1
                    REDIS_PASSWORD=null

                    MAIL_DRIVER=smtp
                    MAIL_HOST=smtp.mailtrap.io
                    MAIL_PORT=2525
                    MAIL_USERNAME=null
                    MAIL_PASSWORD=null
                    MAIL_ENCRYPTION=null

                    AWS_ACCESS_KEY_ID=
                    AWS_SECRET_ACCESS_KEY=
                    AWS_DEFAULT_REGI=us-east-1
                    AWS_BUCKET=

                    PUSHER_APP_ID=
                    PUSHER_APP_KEY=

                    MIX_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
                    MIX_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"';
            fwrite($myfile, $txt);
            $data = fclose($myfile);
            Artisan::call('cache:clear');
            Artisan::call('config:clear');
            Artisan::call('view:clear');
            
        } catch (\Throwable $th) {
            
            DB::rollback();
            return view('installation.step2');
        }
        
        DB::commit();
        return view('installation.step3');
        
    }



    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function step3Checking(Request $request)
    {
        
        DB::beginTransaction();
        
        try {
            $this->validate($request, [
                'kode' => 'required|unique:hd-data_apotek|max:20',
                'nama' => 'required',
                'telepon' => 'required|unique:hd-data_apotek|max:12',
                'email' => 'required|unique:hd-data_apotek',
                'alamat' => 'required',
                'noreg' => 'required',
                'penanggung_jawab' => 'required',
            ]);

            DataApotek::create([
                'kode' => $request->kode,
                'nama' => $request->nama,
                'telepon' => $request->telepon,
                'email' => $request->email,
                'alamat' => $request->alamat,
                'noreg' =>  $request->noreg,
                'penanggung_jawab' => $request->penanggung_jawab,
            ]);

            Artisan::call('migrate');
            Artisan::call('db:seed');
            //code...
        } catch (\Illuminate\Database\QueryException $ex) {
            dd($ex->getMessage()); 
            DB::rollback();

            // return view('installation.step3');
        }
        DB::commit();

        return view('installation.step4');
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