
@extends('layout')
@section('title','Alta')
@section('contenido')
<br><br> <h2>Ingrese los siguientes datos a continuacion</h2>  
<div class="container">
  
    <form method="post" action= "{{url('/personas/nuevo')}}">
    <div class="form-group"  >

		 <div class="form-group">
      <label for="nombre">Nombres:</label>
      <input type="text" name="nombre" class="form-control" id="nombre" placeholder="Ingrese nombre">
    </div>
     <div class="form-group"  >
      <label for="apellido">Apellido:</label>
      <input type="text" name="apellido" class="form-control" id="apellido" placeholder="Ingrese apellido">
    </div>
   

    <div class="checkbox">

		<label>Sexo:</label>  
      <input type="radio" name="sex" id="sex" value="masculino">Masculino
	  <input type="radio" name="sex" id="sex" value="femenino">Femenino
    </div>
    
    <div class="form-group">
      <label for="">Numero de Documento:</label>
      <input type="number" class="form-control" name="dni" placeholder="Ingrese documento">
    </div>
					
    <input type="submit" value= "Enviar" class="btn btn-default"/>
    <input type="hidden" name="_token" value="{{ csrf_token() }}">
  </form>
</div>

@endsection