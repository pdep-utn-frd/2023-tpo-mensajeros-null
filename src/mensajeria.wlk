import mensajeros.*

object mensajeria {

    const mensajeros = new Set()
    var lista = []
    var paquetesPendientes = []
    var facturacion = 0

	method contratar(persona) {
        mensajeros.add(persona)
        return mensajeros
    }
    method despedir(persona){
    	mensajeros.remove(persona)
    	return mensajeros
    }
    method despedirTodos(){
    	mensajeros.clear()
    	return mensajeros
    }
    method mensajeros() {
        return mensajeros
    }
   
    method candidatosPara(mensaje) {
      return mensajeros.filter({x => mensaje.puedeSerEntregadoPor(x)})
    }
    method paqueteFacil(mensaje) {
       return mensajeros.all({x => mensaje.puedeSerEntregadoPor(x)})
    }
  	method mensajeriaGrande(){
  		return mensajeros.size()>2
  	}
  	method puedePrimerEmpleado(mensaje){
  		lista=mensajeros.asList()
  		return mensaje.puedeSerEntregadoPor(lista.first())
  	}
  	method pesoDelUltimoEmpleado(){
  		lista=mensajeros.asList()
  		return lista.last().peso()
  	}
  	
  	method puedeSerEnviado(mensaje){
  		lista=mensajeros.filter({x => mensaje.puedeSerEntregadoPor(x)}).asList()
  		return lista.size()>0 and mensaje.estaPago()
  	}
  	
  	method enviarPaquete(mensaje){ //si mensaje es paquetonViajero primero inicializar con su method precio 
  		if (self.puedeSerEnviado(mensaje)) {
  			facturacion = facturacion + mensaje.precio()}
  		else{ paquetesPendientes.add(mensaje)
  		} 
  	}
  	
  	method paquetesPendientes(){
  		return paquetesPendientes
  	}
  	
  	method agregarPaquete(mensaje){
  		paquetesPendientes.add(mensaje)
  	}
  	
  	method facturacion(){
  		return facturacion
  	}
  	
  	
  	method enviarTodos(){
  		lista=paquetesPendientes.filter({x => self.puedeSerEnviado(x)})
  		lista.forEach({x => self.enviarPaquete(x)})
  		paquetesPendientes=paquetesPendientes.filter({x => !self.puedeSerEnviado(x)})
  	  
  	}
  		
  	method enviarMasCaro(){
  		self.enviarPaquete(paquetesPendientes.max({x=>x.precio()}))
  		paquetesPendientes.remove(paquetesPendientes.max({x=>x.precio()}))
  		
  	}
  	
    method tieneSobrepeso() {
		return mensajeros.sum({x => x.peso()}) > 500
    } 
}
