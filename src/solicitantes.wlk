import profesionales.*

class Persona{
	var provincia
			
	method puedeSerAtendidoPor(prof) = prof.provinciasDondePuedeTrabajar().contains(provincia)
}

class Institucion{
	const unisReconocidas = []
	
	method puedeSerAtendidoPor(prof) = unisReconocidas.contains(prof.universidad())
}

class Club{
	const provsEnLasQueEsta = #{}
	
	method puedeSerAtendidoPor(prof) = !(provsEnLasQueEsta.intersection
	(prof.provinciasDondePuedeTrabajar()).isEmpty())
}