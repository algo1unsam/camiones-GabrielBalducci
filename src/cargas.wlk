object knightRider {	// 500 kilos y 10 puntos
	method peso() {return 500}
	method peligrosidad() {return 10}
}

object bumbleBee {		//800 kg y 15 puntos si auto - 30 puntos si robot
	var forma = "auto"
	method cambiarForma() {if (forma = "auto") forma = "robot" else forma = "auto"} 
	method peso() {return 800}
	method peligrosidad() {return self.forma()*15}
	method forma() {if (forma = "auto") return 1 else return 2}
}

object ladrillos{		// cada ladrillo pesa 2 kg. - 2 puntos
	var cantidadLadrillos
	method cuantosLadrillos() {return cantidadLadrillos}
	method cambiarCantidad(nuevoValor){cantidadLadrillos = nuevoValor}
	method peso() {return cantidadLadrillos * 2}
	method peligrosidad (){ return 2}
	
}