object empresa {
	var camion = []
	var cargaMax = 1000
	var deposito = []
	var peligrosidadMax = 10
	var transporte = camion
	var motoneta = []
	
	method cambiarTransporte(){
		if (transporte = camion){
			transporte = motoneta
			cargaMax= 100
			peligrosidadMax = 5}
		else{
			transporte = camion
			cargaMax = 1000
			peligrosidadMax = 10			
			} 
	}

// FUNCIONES TRANSPORTE	
	method cargar 	(carga) {if (transporte.puedeCargar(carga)) camion.add(carga)}
	method descargar(carga) {transporte.remove (carga)}
	method tieneCarga () {return transporte.count()>0}
	
// FUNCIONES PESO
	method cambiarCargaMax(nuevoValor){cargaMax=nuevoValor}
	method pesoCargas() = transporte.sum({carga=> carga.peso()})
	method cargaDisponible(){return cargaMax - transporte.pesoCargas()}
	method puedeCargar(carga){return (transporte.cargaDisponible()- carga.pesoCargas())>0}

// FUNCIONES PELIGROSIDAD
	method cambiarPeligrosidadMax (nuevoValor) {peligrosidadMax=nuevoValor}
	method mayorPeligro() = transporte.max({carga=> carga.peligro()})
	method peligroCargas() = transporte.sum({carga=> carga.peligro()})
	method puedeCircular(){return (peligrosidadMax>= camion.peligro())}

// FUNCIONES DEPOSITO
	method recibir(carga) { deposito.add (carga)}
	method llenar() {
		deposito.foreach({carga =>
			transporte.cargar(carga)
			deposito.remove(carga)		
		})
	}	
}