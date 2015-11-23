<?php

namespace App\Http\Controllers;
//use Illuminate\Routing\Controller;
use Illuminate\Http\Request;
use App\Http\Requests;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\DB;
use App\Persona;
use App\Http\Controllers\Input;
use App\Http\Controllers\Controller;

class PersonasController extends Controller
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
            $resultado = Persona::
                    orderBy('apellido')->get();
        }
        else{
        $resultado = Persona::where('apellido','like', "%$apellido%")
                    ->orderBy('apellido')->get();
        }
     return view('personas', ["personas" =>$resultado]);
    
    }
    
     public function nuevo(Request $request)
    {
         //recibir los datos del request
         //instanciar un nuevo cliente
         //guardar en la base
         
         $apellido = $request->input("apellido");
         $nombre   = $request->input("nombre");
         $dni      = $request->input("dni");
         $cuil      = $request->input("cuil");
         $domicilio = $request->input("domicilio");
         $telefono = $request->input("telefono");
         $email    = $request->input("email");
         
         $reglas = [
             'apellido' => 'required|min:2|max:120',
             'nombre'   => 'required|min:2|max:120',
             'dni'     => 'required|integer',
             'cuil'   => 'required|integer',
            'domicilio' => 'required|min:2|max:120',
            'telefono'=> 'required|integer',
            'email'    => 'required|email'
         ];
        
         //validamos..
          $this->validate($request, $reglas);
         $personas =new Persona;
         $personas->apellido = $apellido;
         $personas->nombre = $nombre;
         $personas->dni = $dni;
          $personas ->cuil= $cuil;
         $personas->domicilio= $domicilio;
         $personas ->telefono =$telefono;
         $personas    ->email= $email;
         $personas->save();
         
         
         return redirect('personas/todos');
    }
   
       /**
    * Show the form for editing the specified resource.
    *
    * @param  int  $id
    * @return Response
    */
     public function edit($id)
    {
        $personas = Persona::findOrFail($id);
    
    return view('actualizar', ['personas' => $personas]);

    }
    
    /**
     * Update the specified user.
     *
     * @param  Request  $request
     * @param  int  $id
     * @return Response
     */
    
    public function update(Request $request, $id)
    {
   //$clienteUpdate = Request::all();
        
        $personas = Persona::findOrFail($id);
        $input = $request ->all();
        $personas->fill($input)->save();
  
         return redirect('personas/todos')->with('key', 'you have dona succesfully');

    }

    
     public function borrar($id)
    {//recupero el reg x id de la base
         //lo borro
         //redirijo
         $personas = Persona::findOrFail($id);
         
         $personas->delete();
         
       
         return redirect('personas/todos');
         
    }
  
}
