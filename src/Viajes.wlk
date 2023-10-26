class Viaje {
    const property idiomas = #{}

    method esInteresante() = idiomas.size() >= 2
    
    method esRecomendada(unSocio) = self.esInteresante() and unSocio.actividadAtractiva(self) and not unSocio.yaRealizoLaActividad(self)
	method cantidadDeDias()
	method implicaEsfuerzo()
	method sirveParaBrocearse()

}

class ViajeDePlaya inherits Viaje {
    const largoDePlaya

    override method cantidadDeDias() = largoDePlaya / 500
    override method implicaEsfuerzo () = (largoDePlaya > 1200)
    override method sirveParaBrocearse() = true
}

class ExcursionACiudad inherits Viaje {
    const  property cantDeAtraccionesAVisitar

    override method cantidadDeDias() = cantDeAtraccionesAVisitar / 2
    override method implicaEsfuerzo () = (cantDeAtraccionesAVisitar > 5 and cantDeAtraccionesAVisitar < 8)
    override method sirveParaBrocearse() = false
    override method esInteresante() = super() or  cantDeAtraccionesAVisitar == 5
}

class ExcursionACiudadTropical inherits ExcursionACiudad {
    override method cantidadDeDias() = super() + 1
    override method sirveParaBrocearse() = true
}

class SalidaDeTrekking inherits Viaje {
    const cantKmDeSenderos
    const cantDeDiasDeSol

    override method cantidadDeDias() = cantKmDeSenderos / 50
    override method implicaEsfuerzo() = (cantKmDeSenderos > 80)
    override method sirveParaBrocearse() = (cantDeDiasDeSol == 200) or (200 < cantDeDiasDeSol > 100 and cantKmDeSenderos >= 120)
    override method esInteresante() = super() and cantDeDiasDeSol > 140
}

class Gimnasia {

    const idiomas = "ingles"

    method cantidadDeDias() = 1
    method implicaEsfuerzo() = true
    method sirveParaBrocearse() = false
    
    method esRecomendada(unSocio) = unSocio.edad()>20 and unSocio.edad() < 30
}

class TallerLiterario  {
	const libros = #{}
	
	method idiomasUsados() = libros.map({l => l.idioma()})
	method cantidadDeDias()= libros.size() + 1
	method implicaEsfuerzo()= libros.any({l => l.cantDePaginas()>500}) or (self.esIgualATodos() and libros.size() > 1)
	
	method autorDeLibro(){
		return libros.first().nombreDeAutor()
	}
	
	method esIgualATodos(){
		return libros.all({l => l.autorDeLibro() == self.autorDeLibro()})
	}
	method sirveParaBrocearse() = false
	
	method esRecomendada(unSocio) = unSocio.idiomas().size()>1
}

class Libro {
	var property idioma
	const property cantDePaginas
	const property nombreDeAutor	
}