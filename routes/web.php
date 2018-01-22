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

Route::get('/', 'HomeController@index');

Route::get('/catalog/product/create', 'ProductController@create');

Route::get('/catalog/product/show/{id}', 'ProductController@show');

Route::get('/checkout', 'CheckoutController@index');

Route::get('/checkout/show', 'CheckoutController@show');

Route::post('/checkout/store', 'CheckoutController@store');

Route::post('/checkout/update', 'CheckoutItemController@update');

Route::delete('/checkout/destroy', 'CheckoutItemController@destroy');

Route::get('/login', 'LoginController@index');

Route::post('/login/store', 'LoginController@store');

Route::get('/login/destroy', 'LoginController@destroy');