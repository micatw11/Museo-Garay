@extends('layout')
@section('title','Museo Regional Salesiano')

@section ('contenido')

<h1> listado de Personas</h1>


<a href="{{url('/alta')}}" class="btn btn-success">Ingresar Persona</a>
<hr>
<div class="table-responsive">
 <table class="table table-striped  table-bordered table-hover">
     <thead>
     <tr class="bg-info">
         <th>Id</th>
         <th>Apellido</th>
         <th>Nombre</th>
         <th>DNI</th>
         <th colspan="3">Actions</th>
     </tr>
     </thead>
     <tbody>
     @foreach ($personas as $res)
         <tr>
             <td>{{ $res->id }}</td>
             <td>{{ $res->apellido }}</td>
             <td>{{ $res->nombre }}</td>
             <td>{{ $res->dni }}</td>
             <td><a href="{{url('personas/'.$res->apellido)}}" class="btn btn-primary" style="   margin: auto">Read</a></td>
             <td><a href="{{url('/personas/editar/'.$res->id)}}" class="btn btn-warning">Update</a></td>
             <td><a href="{{url('/personas/'.$res->id.'/borrar')}}" class="btn btn-danger" style="border-collapse: collapse ">Borrar</a> </td>
         </tr>
     @endforeach

     </tbody>

 </table>
</div>
@endsection