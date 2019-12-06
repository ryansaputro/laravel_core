<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/clear', function () {
    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('view:clear');
    return view('installation.step3');
})->name('clear');

Route::get('/build', function () {
    Artisan::call('migrate');
    Artisan::call('db:seed');
    return 'selesai';
});

Auth::routes();


Route::post('/login', 'Auth\LoginController@login');
Route::get('/login', 'Auth\LoginController@showLoginForm')->name('login');

Route::get('/', 'Frontend\FrontController@step1');
Route::get('/step-1', 'Frontend\FrontController@step1');
// Route::post('/step-1', 'Frontend\FrontController@step1Checking');
Route::post('/step-2', 'Frontend\FrontController@step2')->name('step-2');
// Route::post('/step-2', function(){
//     return "woe";
// });
Route::post('/step-3', 'Frontend\FrontController@step2Checking')->name('step2');
Route::post('/step-4', 'Frontend\FrontController@step3Checking')->name('step3');


// // Route::get('auth/{provider}', 'Auth\LoginController@redirectToProvider');
// // Route::get('auth/{provider}/callback', 'Auth\LoginController@handleProviderCallback');
// $routes = DB::table('routes')->select('*')->where('uses_controller', 'LIKE', '%Frontend%')->get();
// Route::group(['as' => 'user.'], function () use ($routes) {
//     foreach ($routes as $k => $v) {
//         Route::resource($v->url, $v->uses_controller);
//     }
// });
Route::auth();

Route::group(['middleware' => ['auth']], function () {

// Route::get('/home', 'HomeController@index');
Route::post('administrator/menus/ajaxSave', ['uses' => 'Backend\MenuController@ajaxSave', 'middleware' => ['permission:menu-list']]);
Route::post('administrator/menus/ajaxEdit', ['uses' => 'Backend\MenuController@ajaxEdit', 'middleware' => ['permission:menu-edit']]);
Route::post('administrator/menus/ajaxDelete', ['uses' => 'Backend\MenuController@ajaxDelete', 'middleware' => ['permission:menu-delete']]);
Route::post('administrator/pages/ajaxFieldPages', ['uses' => 'Backend\PageController@ajaxFieldPages', 'middleware' => ['permission:pages-create']]);
Route::post('administrator/pemesanan/ajaxVendorGetItem', ['uses' => 'Backend\PemesananController@ajaxVendorGetItem', 'middleware' => ['permission:pages-create']]);
Route::post('administrator/pemesanan/ajaxBarangGetItem', ['uses' => 'Backend\PemesananController@ajaxBarangGetItem', 'middleware' => ['permission:pages-create']]);
// Route::get('administrator/pemesanan/{pemesanan}/edit', ['uses' => 'Backend\PemesananController@edit', 'middleware' => ['permission:pages-edit']]);
$routesB = DB::table('routes')->select('*')->where('uses_controller', 'LIKE', '%Backend%')->get();
foreach($routesB as $k => $v){
    Route::resource($v->url, $v->uses_controller);
}

});
