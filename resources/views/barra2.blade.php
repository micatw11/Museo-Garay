 <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Museo</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="{{url('/')}}">Museo</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Inicio</a></li>
            <li><a href="#about">Quienes Somos</a></li>
            <li><a href="#contact">Encontranos</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Exhibiciones <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Visitas</a></li>
                <li><a href="#">Galeria de fotos</a></li>
                <li><a href="{{url('/personas/todos')}}">Piezas</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>