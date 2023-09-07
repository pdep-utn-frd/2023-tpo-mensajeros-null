// Mensajeros de pelicula, primera parte

object roberto {
	var peso = 90
	var transporte = camion

	method peso() {
		return peso + transporte.peso()
	}

	method transporte(vehiculo) {
		transporte = vehiculo
	}

	method tieneCredito() {
		return false
	}
}

object neo {
	var peso = 0
	// no hay una var de transporte porque neo vuela
	var llamo = true
	// la capacidad de neo para llamar se intercala dependiendo de si ya hizo una llamada antes
	method peso() = peso

	method llamar(){
		llamo=!llamo
		
	}
	method tieneCredito() {
		return llamo
	}
}

object chuck {
	var peso = 900
	var transporte = camion

	method peso() {
		return peso + transporte.peso()
	}

	method transporte(vehiculo) {
		transporte = vehiculo
	}

	method tieneCredito() {
		return true
	}
}

// nuevo mensajero
object iron_man {
	var peso = 0 // igual que neo, ya que tambien vuela

	// no hay transporte, usa su traje
	
	method peso() = peso

	// es millonario y llama desde el traje asi que siempre tiene credito
	method tieneCredito() {
		return true  
	}
}

object camion {
	var acoplados = 2

	method peso() {
		return acoplados * 500
	}

	method acoplados(cantAcoplados) {
		acoplados = cantAcoplados
	}
}

object bicicleta {

	method peso() {
		return 1
	}
}

object brooklyn {

	method dejarPasar(mensajero) {
		return mensajero.peso() < 1000
	}
}

object matrix {

	method dejarPasar(mensajero) {
		return mensajero.tieneCredito()
	}
}

object paquete {
	var pago = false
	var destino = brooklyn
	const precio = 50

	method pagar() {
		pago = true
	}
	
	method precio(){
		return precio
	}

	method estaPago() {
		return pago
	}

	method destino(lugar) {
		destino = lugar
	}

	method puedeSerEntregadoPor(mensajero) {
		return destino.dejarPasar(mensajero) and self.estaPago()
	}
}
object paquetito {
	var pago = true
	var destino = brooklyn
	var precio = 0


	method estaPago() {
		return pago
	}

	method precio(){
		return precio
	}

	method destino(lugar) {
		destino = lugar
	}

	method puedeSerEntregadoPor(mensajero) {
		return true
	}
}

object paquetonViajero {
	var pago = false
	var pagando = false
	var destino = []
	var precio = 0 // si intento inicializar directo destino.size()*50, 
	               //no funciona siempre da 0. Usar method precio() para eso

	method pagar(cantidad) {
		precio = precio - cantidad
		pagando = true
	}
	
	method estaPago() {
		return precio <= 0
	}
	
	method precio(){
		if (not pagando){
			precio = destino.size() * 50
			return precio} 
		else {
			return precio
		}
	}
	method destino(lugar) {
		destino.add(lugar)
	}
	

	method puedeSerEntregadoPor(mensajero) {
		return destino.all({x=>x.dejarPasar(mensajero)}) and self.estaPago()
	}
}

// nuevo paquete
object carta {
	var pago = false
	var destino = matrix
	var precio = 3.14159265

	method pagar() {
		pago = true
	}

	method precio() = precio

	method estaPago() {
		return pago
	}

	method destino() = destino

	method puedeSerEntregadoPor(mensajero) {
		return destino.dejarPasar(mensajero) and self.estaPago()
	}
}