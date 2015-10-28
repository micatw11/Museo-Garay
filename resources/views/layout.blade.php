<!DOCTYPE html>

<html>
    <head>
       @include('control') 
    <br>
     <title>@yield('title')</title>
            @include('estilo')
           
  </head>

  <body role="document">
 
    @include('barra2')
    @yield('contenido')
    </body>
</html>