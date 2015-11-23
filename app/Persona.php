<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Persona extends Model
{
    public $timestamps= false;
    public function getNombreCompletoAtribute(){
        return sprintf('%s, %s ', $this->apellido, $this->nombre); //seteo de parametros
        
}
protected $fillable=[
        'apellido',
        'nombre',
        'dni',
         'cuil',
         'domicilio',
        'telefono',
        'email'
    ];
}
