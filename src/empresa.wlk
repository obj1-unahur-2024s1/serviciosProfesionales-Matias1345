import profesionales.* 
import solicitantes.*

class Empresa{
	const empleados = []
	var honorarioReferencia
	const listaClientes= []
	
	method agregarEmpleado(empl) = empleados.add(empl)
	
	method agregarCliente(cliente) = listaClientes.add(cliente)
	
	method establecerHonorarioRef(valor){ honorarioReferencia = valor }
	method obtenerHonorarioRef() = honorarioReferencia
	
	method cuantosEstudiaronEn(univ) = empleados.count({prof=>prof.universidad()==univ})
	
	method profesionalesCaros() = empleados.filter({prof=>prof.honorariosPorHora()>
		honorarioReferencia}).asSet()
		
	method universidadesFormadoras() = empleados.map({prof=>prof.universidad()}).asSet()
	
	method profesionalMasBarato() = empleados.min({prof=>prof.honorariosPorHora()})
	
	method esDeGenteAcotada() = empleados.all({prof=>prof.provinciasDondePuedeTrabajar().size()<=3})
	
	method puedeSatisfacerA(solic) = empleados.any({prof=>solic.puedeSerAtendidoPor(prof)})
	
	method darServicio(solic){		
		const primeroQueCumple = empleados.find({prof=>solic.puedeSerAtendidoPor(prof)})
		self.agregarCliente(solic)
		primeroQueCumple.cobrar(primeroQueCumple.honorariosPorHora())			
	} 
	
	method cantidadClientes() = listaClientes.size()
	
	method tieneDeClienteA(solic) = listaClientes.contains(solic)
	
	method provsDondeTrabajanEmpl() = empleados.map({prof=>prof.provinciasDondePuedeTrabajar()}).asSet()
	
	method honorariosDeTodos() = empleados.map({prof=>prof.honorariosPorHora()})
	
	method esPocoAtractivo(prof) = !(prof.provinciasDondePuedeTrabajar().
	intersection(self.provsDondeTrabajanEmpl()).isEmpty()) and (prof.honorariosPorHora() >=
	self.honorariosDeTodos().max())
	
	/*method esPocoAtractivo(prof) = (prof.provinciasDondePuedeTrabajar().
	intersection(self.provsDondeTrabajanEmpl()).isEmpty()) and (prof.honorariosPorHora()>=
	self.honorariosDeTodos().max())*/
}

