import mensajeros.*

object mensajeria {

    const mensajeros = new Set()
    var lista = []

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
        mensajeros.find({x => mensaje.puedeSerEntregadoPor(x)})
    }
    method paqueteFacil(mensaje) {
        mensajeros.all({x => mensaje.puedeSerEntregadoPor(x)})
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
    method tieneSobrepeso() {

    } 
}
