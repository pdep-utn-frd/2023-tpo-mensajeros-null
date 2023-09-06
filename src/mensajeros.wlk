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
	var precio = 50

	method pagar() {
		pago = true
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


	method estaPago() {
		return pago
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
	var destino = []
	var precio = 50

	method pagar(cantidad) {
		precio = precio - cantidad
	}
	
	method precio() {
		return precio
}
	method estaPago() {
		return precio <= 0
	}
	method precioTotal(){
		precio = destino.size() * 50
		return precio
	}
	method destino(lugar) {
		destino.add(lugar)
	}

	method puedeSerEntregadoPor(mensajero) {
		return destino.all({x=>x.dejarPasar(mensajero)}) and self.estaPago()
	}
}