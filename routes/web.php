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

Route::get('/catalog/show', 'CatalogController@show');

Route::get('/checkout', 'CheckoutController@index');

Route::get('/checkout/item', 'CheckoutItemController@index');

Route::post('/checkout/item/store', 'CheckoutItemController@store');

Route::post('/checkout/item/update', 'CheckoutItemController@update');

Route::delete('/checkout/item/destroy', 'CheckoutItemController@destroy');

Route::get('/login', 'LoginController@index');

Route::post('/login/store', 'LoginController@store');

Route::get('/login/destroy', 'LoginController@destroy');