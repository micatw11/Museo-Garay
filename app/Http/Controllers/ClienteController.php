<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Cliente;

class ClienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function personas($apellido = null)
    {
          //metodo 1:
   //  $resultado = DB::select ('SELECT * FROM operaciones WHERE banco',['ape' => "%$apellido%"]);
    //metodo 2 laravel query builder
  //  $resultado = DB::table('cliente')
    //        ->where('apellido','like', "%$apellido%")
    //        ->orderBy('apellido')->get();
    
    //        //metodo 3: modelos (eloquent orm)
        if ($apellido=='todos'){
            $resultado = Cliente::
                    orderBy('apellido')->get();
        }
        else{
        $resultado = Cliente::where('apellido','like', "%$apellido%")
                    ->orderBy('apellido')->get();
        }
     return view('personas', ["clientes" =>$resultado]);
    
    }
    
     public function nuevo(Request $request)
    {
         //recibir los datos del request
         //instanciar un nuevo cliente
         //guardar en la base
         
         $apellido = $request->input("apellido");
         $nombre   = $request->input("nombre");
         $dni      = $request->input("dni");
         
         
         $reglas = [
             'apellido' => 'required|min:2|max:120',
             'nombre'   => 'required|min:2|max:120',
             'dni'     => 'required|integer|min:100000|max:99999999'
         ];
        
         //validamos..
          $this->validate($request, $reglas);
         $clientes =new Cliente;
         $clientes->apellido = $apellido;
         $clientes->nombre = $nombre;
         $clientes->dni = $dni;
         $clientes->save();
         
         return redirect('personas/todos');
    }
    
   /* public function editar($id)
{
   //
   $bookUpdate=Request::all();
   $book=Book::find($id);
   $book->update($bookUpdate);
   return redirect('books');
}*/
    
     public function borrar($id)
    {//recupero el reg x id de la base
         //lo borro
         //redirijo
         $clientes = Cliente::findOrFail($id);
         
         $clientes->delete();
         
       
         return redirect('personas/todos');
         
    }
  
}
