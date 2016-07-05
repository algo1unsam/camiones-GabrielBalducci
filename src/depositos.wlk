class Deposito {
	const camiones = []
	
	/** Punto F 
	 * Saber para un dep�sito el total de carga que est� viajando, o sea la suma de lo que 
	 * llevan todos los camiones de ese dep�sito que est�n de viaje
	 * */
	method totalCargaViajando() = 
		self.camionesViajando().sum({unCamion => unCamion.totalCarga()})
		
	method camionesViajando() = 
		camiones.filter({unCamion => unCamion.estaViajando()})
		
	method agregarCamion(unCamion) {
		camiones.add(unCamion)
	}
	
	/** <b>Punto H</b><br>
	 * Saber en qu� camiones de un dep�sito se est�n cargando un determinado elemento,
	 * por ejemplo ketchup o aceite. Decimos que un cami�n se est� cargando cuando no 
	 * est� listo para partir
	 */
	method seEstaCargando(elemento) = 
		self.camionesNoListosParaPartir().filter({
			unCamion => unCamion.elementos().contains(elemento)
		})

	method camionesNoListosParaPartir() = 
		camiones.filter({unCamion => not unCamion.listoParaPartir()})

	/** <b>Punto K</b><br>
	 * Para un dep�sito, saber el cami�n que transporta mayor cantidad de cosos.
	 */
	method transportaMayorCantidadDeCosos() = 
		camiones.max({unCamion => unCamion.cosos().size()})

	/** <b>Punto L</b><br> 
	 * Para dos dep�sitos, el conjunto de productos que est�n almacenados en ambos,
	 * ordenado por el peso de cada producto en forma ascendente.
	 */ 
	method elementosEnComunCon(otroDeposito) =
		self.elementos()
			.intersection(otroDeposito.elementos())
			.sortedBy({ unElemento, otroElemento =>		/* Orden ascendente por peso */
				self.pesoTotalCon(otroDeposito, unElemento) <=
				self.pesoTotalCon(otroDeposito, otroElemento)
			})
	
	method pesoTotalCon(otroDeposito, elemento) = 
		self.pesoTotalDe(elemento) + otroDeposito.pesoTotalDe(elemento)
		
	method pesoTotalDe(unElemento) = 
		camiones.sum({unCamion => unCamion.pesoTotalDe(unElemento)})
		
	method elementos() = camiones.flatMap({unCamion => unCamion.elementos()}).asSet()	
}