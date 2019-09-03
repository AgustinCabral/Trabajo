object alquimista {
  var itemsDeCombate = []
  
  method tieneCriterio() {
    return self.cantidadDeItemsDeCombateEfectivos() >= self.cantidadDeItemsDeCombate() / 2
  }
  
  method cantidadDeItemsDeCombate() {
    return itemsDeCombate.size()
  }
  
  method cantidadDeItemsDeCombateEfectivos() {
    return itemsDeCombate.count({ itemDeCombate =>
      itemDeCombate.esEfectivo()
    })
  }
  method esBuenExplorador(){
      return self.cantidadDeItemsDeRecoleccion >= 3
  }
method cantidadDeItemsDeRecoleccion(){
      return itemsDeCombate.size()
  }
  method capacidadOfensiva(){
      return itemsDeCombate.sum({ itemDeCombate =>
      itemDeCombate.capacidadOfensiva()
    })
}

object bomba {
  var danio = 15
  
  method esEfectivo() {
    return danio > 100
  }
  method capacidadOfensiva(){
  	return danio/2
  }
}

object pocion {
  var materiales = []
  var poderCurativo = 0
  
  method esEfectivo() {
    return poderCurativo > 50 and self.fueCreadaConAlgunMaterialMistico()
  }
  
  method fueCreadaConAlgunMaterialMistico() {
    return materiales.any({ material =>
      material.esMistico()
    })
  }
  method capacidadOfensiva(){
  	return podercurativo + (self.cantidadDeMaterialesMisticos*10)
  }
  	method cantidadDeMaterialesMisticos(){
      return materiales.count({material => 
          material.esMistico()
      })
  }
 
}

object debilitador {
  var materiales = []
  var potencia = 0
  
  method esEfectivo() {
    return potencia > 0 and self.fueCreadoPorAlgunMaterialMistico().negate()
  }
  
  method fueCreadoPorAlgunMaterialMistico() {
    return materiales.any({ material =>
      material.esMistico()
    })
  }
  
method capacidadOfensiva(){
	if(self.fueCreadoPorAlgunMaterialMistico()){
		return 12 * self.cantidadDeMaterialesMisticos()}
		return 5
	
}
method cantidadDeMaterialesMisticos(){
      return materiales.count({material => 
          material.esMistico()
      })
  }
 
}