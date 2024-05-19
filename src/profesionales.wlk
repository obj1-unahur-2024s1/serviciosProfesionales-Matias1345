import universidad.*

class ProfesionalAsociado {
	var universidad
	var dinero = 0
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	
	method cobrar(cantidad){
		dinero = dinero + cantidad
		self.donar(cantidad)
	} 
	
	method donar(cantidad){
		self.gastar(cantidad)
		asocProfesionalesLitoral.recibirDinero(cantidad)
	} 
	
	method gastar(cantidad){
		dinero = dinero - cantidad
	}
	
	method obtenerDinero() = dinero
}


class ProfesionalVinculado {
	var universidad
	var dinero = 0
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{universidad.provinciaEnLaQueEsta()} }
	
	method honorariosPorHora() { return universidad.honorariosPorHoraRecomendado() }
	
	method cobrar(cantidad){
		dinero = dinero + cantidad
		self.donar(cantidad/2)
		self.gastar(cantidad/2)
	}
	
	method donar(cantidad){
		self.gastar(cantidad)
		universidad.recibirDinero(cantidad)
	} 
	
	method gastar(cantidad){
		dinero = dinero - cantidad
	}
	
	method obtenerDinero() = dinero
}


class ProfesionalLibre {
	var universidad
	const provincias = #{}
	var honorarios
	var dinero = 0
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method establecerProvinciaNueva(provincia) = provincias.add(provincia)
	method provinciasDondePuedeTrabajar() { return provincias }
	
	method establecerHonorarios(valor){ honorarios = valor }
	method honorariosPorHora() { return honorarios }
	
	method cobrar(cantidad){
		dinero = dinero + cantidad
	}
	
	method pasarDineroA(prof,cantidad){
		dinero = dinero - cantidad
		prof.cobrar(cantidad)
	}
	
	method obtenerDinero() = dinero
}
