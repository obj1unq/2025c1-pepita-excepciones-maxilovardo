object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method volar(distancia) {
		self.validarVolar(distancia)
		energia = energia - self.consumoEnergiaAlVolar(distancia)
	}

	method consumoEnergiaAlVolar(distancia){
		return 10 + distancia
	}
		
	method energia() {
		return energia
	}

	method energia(_energia){
		energia = _energia
	}

	method puedeVolar(distancia){
		return self.consumoEnergiaAlVolar(distancia) <= self.energia()
	}

	method validarVolar(distancia){
		if(not self.puedeVolar(distancia)){
			self.error("pepita no tiene energia suficiente")
		}
	}
}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	var ultimaComida = manzana

	method ultimaComida(_ultimaComida){
		ultimaComida = _ultimaComida
	}
	
	method energia() {
		return energia
	}

	method energia(_energia){
		energia = _energia
	}
		
	method comer(comida) {
		self.validarUltimaComida(comida)
		energia = energia + (comida.energiaQueAporta() / 2)
		self.ultimaComida(comida)
	}

	method validarUltimaComida(comida){
		if(not self.puedeComer(comida)){
			self.error("pepon no quiere comer")
		}
	}

	method puedeComer(comida){
		return comida != ultimaComida
	}
	
	method volar(distancia) {
		self.validarVolar(distancia)
		energia = energia - self.consumoEnergiaAlVolar(distancia)
	}

	method consumoEnergiaAlVolar(distancia){
		return 20 + 2*distancia
	}

	method validarVolar(distancia){
		if(not self.puedeVolar(distancia)){
			self.error("pepon no tiene energia suficiente")
		}
	}

	method puedeVolar(distancia){
		return self.consumoEnergiaAlVolar(distancia) <= self.energia()
	}
}

object roque {
	var ave = pepita
	var cenas = 0;
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}
}

