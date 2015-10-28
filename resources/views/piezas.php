@extends('layout')
@section('title','Museo Regional Salesiano')

@section ('contenido')

<h1> listado de Piezas</h1>


<a href="{{url('/alta')}}" class="btn btn-success">Ingresar Pieza</a>
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
     @foreach ($clientes as $cliente)
         <tr>
             <td>{{ $cliente->id }}</td>
             <td>{{ $cliente->apellido }}</td>
             <td>{{ $cliente->nombre }}</td>
             <td>{{ $cliente->dni }}</td>
             <td><a href="{{url('personas/'.$cliente->apellido)}}" class="btn btn-primary" style="   margin: auto">Read</a></td>
             <td><a href="{{url('/personas/'.$cliente->apellido)}}" class="btn btn-warning">Update</a></td>
             <td><a href="{{url('/personas/'.$cliente->id.'/borrar')}}" class="btn btn-danger" style="border-collapse: collapse ">Borrar</a> </td>
         </tr>
     @endforeach

     </tbody>

 </table>
</div>
@endsection