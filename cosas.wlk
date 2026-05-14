object knightRider {
    method peso() = 500
    method nivelDePeligro() = 10
}
object bumblebee {
    var property estaTransformado = true 
    method peso() = 800
    method nivelDePeligro() {
        if (estaTransformado) 
            return 15
        else 
            return 30
    }
}
object paqueteLadrillos {
    var property cantidadLadrillos = 0
    method peso() = ladrillo.peso()  * cantidadLadrillos
    method nivelDePeligro() = 2
}
object ladrillo {
    method peso() = 2
}
object arenaAGranel {
    var property pesoDado = 0
    method peso() = pesoDado
    method nivelDePeligro() = 1
}
object bateriaAntiaerea {
    var property tieneMisiles = true
    method peso() = if (tieneMisiles) 300 else 200
    method nivelDePeligro() = if (tieneMisiles) 100 else 0
}
object contenedorPortuario {
    const objetosDentro = []
    method añadirDentro(elemento) = objetosDentro.add(elemento)
    method peso() = objetosDentro.sum({o => o.peso()}) + 100
    method nivelDePeligro() = if (!objetosDentro.isEmpty()) objetosDentro.map({o => o.nivelDePeligro()}).max() else 0
}
object residuosRadiactivos {
    var property peso = 0
    method peso() = peso
    method nivelDePeligro() = 200
}
object embalajeDeSeguridad {
    var property objetoDentro = knightRider
    method peso() = objetoDentro.peso()
    method nivelDePeligro() = (objetoDentro.nivelDePeligro() / 2).truncate(0)
}