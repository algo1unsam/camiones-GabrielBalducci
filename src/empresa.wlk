object empresa {
	var camion = []
	var cargamaxima
	var deposito = []
// FUNCIONES CAMIÓN	
	method cambiarcargamaxima(nuevoValor){cargamaxima=nuevoValor}
	method cargar (carga) {if (camion.puedeCargar(carga)) camion.add(carga)}
	method descargar (carga) {camion.remove (carga)}
	method tieneCarga () {return camion.count()>0}
	method peso() {camion.sum({carga=> carga.peso()})}
	method cargaDisponible(){return cargamaxima -camion.peso()}
	method puedeCargar(carga){return (camion.cargaDisponible()-carga.peso())>0}
// FUNCIONES DEPOSITO
	method recibir(carga) { deposito.add (carga)}
	method llenarCamion() {
		deposito.foreach(){ carga =>
			self.cargar(carga)
			deposito.remove(carga)		
		}
	}
	method mayorPeligro(){
		camion.max(carga){carga=> carga.peligro()}
	}
}
