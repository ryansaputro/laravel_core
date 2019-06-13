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

// Route::get('/', function () {
//     return view('welcome');
// });

Auth::routes();

Route::get('/', 'Frontend\FrontController@index');
// Route::get('auth/{provider}', 'Auth\LoginController@redirectToProvider');
// Route::get('auth/{provider}/callback', 'Auth\LoginController@handleProviderCallback');
$routes = DB::table('routes')->select('*')->where('uses_controller', 'LIKE', '%Frontend%')->get();
Route::group(['as' => 'user.'], function () use ($routes) {
    foreach ($routes as $k => $v) {
        Route::resource($v->url, $v->uses_controller);
    }
});
Route::auth();

Route::group(['middleware' => ['auth']], function () {

// Route::get('/home', 'HomeController@index');
Route::post('administrator/menus/ajaxSave', ['uses' => 'Backend\MenuController@ajaxSave', 'middleware' => ['permission:menu-list']]);
Route::post('administrator/menus/ajaxEdit', ['uses' => 'Backend\MenuController@ajaxEdit', 'middleware' => ['permission:menu-edit']]);
Route::post('administrator/menus/ajaxDelete', ['uses' => 'Backend\MenuController@ajaxDelete', 'middleware' => ['permission:menu-delete']]);
Route::post('administrator/pages/ajaxFieldPages', ['uses' => 'Backend\PageController@ajaxFieldPages', 'middleware' => ['permission:pages-create']]);
$routesB = DB::table('routes')->select('*')->where('uses_controller', 'LIKE', '%Backend%')->get();
foreach($routesB as $k => $v){
    Route::resource($v->url, $v->uses_controller);
}
// Route::group(['as' => 'user.'], function () use ($routes) {
//     foreach($routes as $k => $v){
//         Route::resource($v->url, $v->uses_controller);
//     }
// });
    // Route::resource('administrator/users', 'UserController');



    // Route::get('administrator/roles', ['as' => 'roles.index', 'uses' => 'RoleController@index', 'middleware' => ['permission:role-list|role-create|role-edit|role-delete']]);

    // Route::get('administrator/roles/create', ['as' => 'roles.create', 'uses' => 'RoleController@create', 'middleware' => ['permission:role-create']]);

    // Route::post('administrator/roles/create', ['as' => 'roles.store', 'uses' => 'RoleController@store', 'middleware' => ['permission:role-create']]);

    // Route::get('administrator/roles/{id}', ['as' => 'roles.show', 'uses' => 'RoleController@show']);

    // Route::get('administrator/roles/{id}/edit', ['as' => 'roles.edit', 'uses' => 'RoleController@edit', 'middleware' => ['permission:role-edit']]);

    // Route::patch('administrator/roles/{id}', ['as' => 'roles.update', 'uses' => 'RoleController@update', 'middleware' => ['permission:role-edit']]);

    // Route::delete('administrator/roles/{id}', ['as' => 'roles.destroy', 'uses' => 'RoleController@destroy', 'middleware' => ['permission:role-delete']]);



    // Route::get('itemCRUD2', ['as' => 'itemCRUD2.index', 'uses' => 'ItemCRUD2Controller@index', 'middleware' => ['permission:item-list|item-create|item-edit|item-delete']]);

    // Route::get('itemCRUD2/create', ['as' => 'itemCRUD2.create', 'uses' => 'ItemCRUD2Controller@create', 'middleware' => ['permission:item-create']]);

    // Route::post('itemCRUD2/create', ['as' => 'itemCRUD2.store', 'uses' => 'ItemCRUD2Controller@store', 'middleware' => ['permission:item-create']]);

    // Route::get('itemCRUD2/{id}', ['as' => 'itemCRUD2.show', 'uses' => 'ItemCRUD2Controller@show']);

    // Route::get('itemCRUD2/{id}/edit', ['as' => 'itemCRUD2.edit', 'uses' => 'ItemCRUD2Controller@edit', 'middleware' => ['permission:item-edit']]);

    // Route::patch('itemCRUD2/{id}', ['as' => 'itemCRUD2.update', 'uses' => 'ItemCRUD2Controller@update', 'middleware' => ['permission:item-edit']]);

    // Route::delete('itemCRUD2/{id}', ['as' => 'itemCRUD2.destroy', 'uses' => 'ItemCRUD2Controller@destroy', 'middleware' => ['permission:item-delete']]);
    
    // Route::get('administrator/', ['as' => 'administrator.index', 'uses' => 'Backend\AdministratorController@index', 'middleware' => ['permission:dashboard-list']]);

});
