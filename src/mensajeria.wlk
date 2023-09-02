import mensajeros.*

object mensajeria {

    const mensajeros = new Set()

	method contratar(persona) {
        mensajeros.add(persona)
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
    method tieneSobrepeso() {

    } 
}
