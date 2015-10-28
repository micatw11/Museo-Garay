@extends('layout')
@section('title','Museo Regional Salesiano')

@section ('contenido')

<div class="page-header">
    <br>
        <h1>Museo Regional Salesiano</h1>
      </div>
    <div class="container theme-showcase" role="main">
      <div id="foto" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#foto" data-slide-to="0" class="active"></li>
          <li class="" data-target="#foto" data-slide-to="1"></li>
          <li class="" data-target="#foto" data-slide-to="2"></li>
          <li class="" data-target="#foto" data-slide-to="3"></li>
        </ol>
          
        <div class="carousel-inner" role="listbox">         
            <div class="item active">
             <img src="{{asset('img/imagen.jpg')}}" class="img-thumbnail" alt="foto1" width="1000" height="1300" style="margin: auto">
          </div>
          <div class="item">
             <img src="{{asset('img/imagen2.jpg')}}" class="img-thumbnail" alt="foto2" width="1000" height="1300"  style="margin: auto; width: 70%">
          </div>
            <div class="item">
             <img src="{{asset('img/imagen3.jpg')}}" class="img-thumbnail" alt="foto3" width="1000" height="1300" style="margin: auto; width: 70%">
          </div>
          <div class="item">
              <img src="{{asset('img/imagen4.jpg')}}" class="img-circle" alt="foto4" width="1000" height="1300" style="margin: auto; width: 70%">
          </div>
        </div>
        <a class="left carousel-control" href="#foto" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Anterior</span>
        </a>
        <a class="right carousel-control" href="#foto" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Siguiente</span>
        </a>
      </div>
   

         <div class="gradient-vertical-three"></div>
        
         <br><br>
  @include('paneles')
   </div> 
@endsection