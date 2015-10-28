<?php


//Route::get('/', function () {
//return view('pagina');
//});

//Route::get('/hola/{nombre}/{apellido}', function ($nombre, $apellido) {
//});


Route::get('/', function () {
 return view('bienvenida');
});
//
//
//Route::get('/hola/{nombre}/{apellido}', function ($nombre, $apellido) {
 //   return view('bienvenida', ["nombre" => $nombre, "apellido" => $apellido]);
//});

Route::get('/alta', function () {
 return view('alta');
});


Route::get('/personas/{apellido}', 'ClienteController@personas');
Route::post('/personas/nuevo', 'ClienteController@nuevo');

Route::get('/personas/{id}/borrar', 'ClienteController@borrar');
