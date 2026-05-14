object knightRider {
    method peso() = 500
    method nivelDePeligro() = 10

    method cantidadBulto() = 1
    method sufrirCambio() {}
}
object bumblebee {
    var property estaTransformadoEnAuto = true 
    method peso() = 800
    method nivelDePeligro() {
        if (estaTransformadoEnAuto) 
            return 15
        else 
            return 30
    }
    method sufrirCambio() {
        estaTransformadoEnAuto = false
    }

    method cantidadBulto() = 2
}
object paqueteLadrillos {
    var property cantidadLadrillos = 0
    method peso() = ladrillo.peso()  * cantidadLadrillos
    method nivelDePeligro() = 2

    method cantidadBulto() {
        if (cantidadLadrillos <= 100) return 1
        else if (cantidadLadrillos <= 300) return 2
        else return 3
    }
    method sufrirCambio() {
        cantidadLadrillos += 12
    }
}
object ladrillo {
    method peso() = 2
}
object arenaAGranel {
    var property peso = 0
    method nivelDePeligro() = 1
    
    method cantidadBulto() = 1
    method sufrirCambio() {
        peso -= 10.max(0)
    }
}
object bateriaAntiaerea {
    var property tieneMisiles = false
    method peso() = if (tieneMisiles) 300 else 200
    method nivelDePeligro() = if (tieneMisiles) 100 else 0

    method cantidadBulto() = if (tieneMisiles) 2 else 1
    method sufrirCambio() {
        tieneMisiles = true
    }
}
object contenedorPortuario {
    const objetosDentro = []
    method añadirDentro(elemento) = objetosDentro.add(elemento)
    method peso() = objetosDentro.sum({o => o.peso()}) + 100
    method nivelDePeligro() = if (!objetosDentro.isEmpty()) objetosDentro.map({o => o.nivelDePeligro()}).max() else 0

    method cantidadBulto() = 1 + objetosDentro.sum({o => o.cantidadBulto()})
    method sufrirCambio() {
        objetosDentro.forEach({o => o.sufrirCambio()})
    }
}
object residuosRadiactivos {
    var property peso = 0
    method nivelDePeligro() = 200

    method cantidadBulto() = 1
    method sufrirCambio() {
        peso += 15
    }
}
object embalajeDeSeguridad {
    var property objetoDentro = knightRider
    method peso() = objetoDentro.peso()
    method nivelDePeligro() = (objetoDentro.nivelDePeligro() / 2).truncate(0)
    
    method cantidadBulto() = 2
    method sufrirCambio() {}
}