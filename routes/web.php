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

Route::post('/checkout/store', 'CheckoutController@store');