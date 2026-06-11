// El constructor primario integra la declaración de propiedades
class AsesorVentas(val nombre: String, val ventasMes: Int)

// Con cuerpo adicional
class ClienteMoto(val nombre: String, val presupuesto: Int) {
    fun perfilCliente() = "Soy $nombre y busco una moto de hasta $$presupuesto"
    fun puedeComprarPremium() = presupuesto >= 15000
}

fun main() {
    val asesor = AsesorVentas("Ana", 12)
    println("Asesor: ${asesor.nombre}")   
    println("Motos vendidas: ${asesor.ventasMes}")     

    val cliente = ClienteMoto("Luis", 8000)
    println(cliente.perfilCliente())     
    println("¿Puede comprar Premium? ${cliente.puedeComprarPremium()}")   
}
