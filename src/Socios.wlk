class Socio {
    var property maxDeActividades
    const property edad
    const property idiomas = #{}

    const activQueRealizo = []
	
	method tamanioaAct(){
		return activQueRealizo.size()
	}
    method esAdoradorDelSol() = activQueRealizo.all({a => a.sirveParaBrocearse()})
    method actividadesForzadas() = activQueRealizo.filter({a => a.implicaEsfuerzo()})
    method realizaActividad(unaActividad) {
        if(self.tamanioaAct() == self.maxDeActividades())
        {
          self.error("No se pueden realizar mas actividades")
        }
        activQueRealizo.add(unaActividad)
    }
    
    method yaRealizoLaActividad(unaActividad){
    	return activQueRealizo.contains(unaActividad)
    }

}

class Tranquilo inherits Socio {

    method actividadAtractiva(actividad) = actividad.cantidadDeDias()>=4
}

class Coherente inherits Socio {

    method actividadAtractiva(actividad) = self.esAdoradorDelSol() and actividad.sirveParaBrocearse() or not actividad.implicaEsfuerzo()

}

class Relajado inherits Socio {

   method hablaIdioma(unIndioma) = idiomas.contains(unIndioma)

   method actividadAtractiva(actividad) = actividad.idiomas().any({i => self.hablaIdioma(i)})

}