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


Route::get('/personas/{apellido}', 'PersonasController@personas');
Route::post('/personas/nuevo', 'PersonasController@nuevo');

Route::get('/personas/{id}/borrar', 'PersonasController@borrar');

Route::get('/actualizar', function () {
 return view('actualizar');
});

Route::get('/personas/editar/{id}', 'PersonasController@edit');
Route::resource('/personas/actualizar/{id}', 'PersonasController@update');
/*
Route::post('login', 'WelcomeController@login');
Route::get('logout', function(){
    Auth::logout(); // logout user
    return Redirect::to('/');
});*/