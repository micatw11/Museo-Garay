@extends('layout')
@section('title','Actualizar')

@section('contenido')
<div class="container">
    <h1>Actualizar Persona</h1>
    {!! Form::model($personas, ['url' => ['/personas/actualizar', $personas->id],'method' => 'Post']) !!}
   
     <div class="form-group">
        {!! Form::label('nombre', 'Nombre:') !!}
        {!! Form::text('nombre',null,['class'=>'form-control']) !!}
    </div>
    <div class="form-group">
        {!! Form::label('apellido', 'Apellido:') !!}
        {!! Form::text('apellido',null,['class'=>'form-control']) !!}
    </div>
    <div class="form-group">
        {!! Form::label('dni', 'Dni:') !!}
        {!! Form::text('dni',null,['class'=>'form-control']) !!}
    </div>
    <div class="form-group">
        {!! Form::label('cuil', 'Cuil:') !!}
        {!! Form::text('cuil',null,['class'=>'form-control']) !!}
    </div>
    <div class="form-group">
        {!! Form::label('domicilio', 'Domicilio:') !!}
        {!! Form::text('domicilio',null,['class'=>'form-control']) !!}
    </div>
    <div class="form-group">
        {!! Form::label('telefono', 'Telefono:') !!}
        {!! Form::text('telefono',null,['class'=>'form-control']) !!}
    </div>
    <div class="form-group">
        {!! Form::label('email', 'Email:') !!}
        {!! Form::text('email',null,['class'=>'form-control']) !!}
    </div>
    <div class="form-group">
        {!! Form::submit('Actualizar Persona', ['class' => 'btn btn-primary form-control']) !!}
   
       
    </div> 
    {!! Form::close() !!}
</div>
@endsection




