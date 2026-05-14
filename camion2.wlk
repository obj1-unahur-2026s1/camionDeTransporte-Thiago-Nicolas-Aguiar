object camion {
    // Metodo de lista
    const carga = []
    method cargar(elemento) {
        elemento.sufrirCambio()
        carga.add(elemento)
    } 
    // Metodo bulto (nuevo)
    method totalBulto() = carga.sum({c => c.cantidadBulto()})
    method descargar(elemento) = carga.remove(elemento)
    // Peso del camion total (con carga incluida)
    method pesoCamion() = 1000
    method pesoDeLosElementos() = carga.sum({c => c.peso()})
    method pesoTotal() = self.pesoDeLosElementos() + self.pesoCamion()
    // Peso de carga Par
    method esPesoDeCargaPar() = carga.all({c => c.peso().even()})
    // Peso determinado
    method hayPeso(peso) = carga.any({c => c.peso() == peso})
    // Hay carga Peligrosa
    method primeraCargaPeligrosa(nivel) = carga.find({c => c.nivelDePeligro() == nivel})
    // Lista de carga peligrosa
    method listaDeCargaPeligrosa(nivel) = carga.filter({c => c.nivelDePeligro() > nivel})
    // Controles Pensar
    method cargaMasPeligrosa(elemento) = carga.filter({c => elemento.nivelDePeligro() < c.nivelDePeligro()})
    // Peso Maximo del camion
    method camionExcedido() = self.pesoTotal() >= 2500
    // Puede circular
    method puedeCircular(nivel) = !self.camionExcedido() && carga.all({c => c.nivelDePeligro() < nivel})

    // Agregados
    // Peso minimo/maximo
    method cargaEntreMinYMax(min, max) = carga.any({c => c.peso().between(min, max)})
    method pesoMinimo() = carga.min({c => c.peso()})
    // Carga de Mayor peso
    method cargaDeMayorPeso() = carga.max({c => c.peso()})
}