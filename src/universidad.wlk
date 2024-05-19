class Universidad {
	var provincia
	var honorarios
	var dineroTotal = 0
	
	method establecerProvincia(prov){ provincia = prov }
	method provinciaEnLaQueEsta() = provincia
	
	method establecerHonorarios(valor){ honorarios = valor }
	method honorariosPorHoraRecomendado() = honorarios	
	
	method recibirDinero(cantidad){
		dineroTotal = dineroTotal + cantidad
	}
	
	method obtenerDineroTotal() = dineroTotal
}

object asocProfesionalesLitoral{
	var dineroTotal = 0
	
	method recibirDinero(cantidad){
		dineroTotal = dineroTotal + cantidad
	}
	
	method obtenerDineroTotal() = dineroTotal
}

