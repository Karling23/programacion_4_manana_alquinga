fun main() {
    println("Funciones en Venta de Motos")
    
    val bienvenida = bienvenidaTienda()
    println(bienvenida)
    val precioTotal: Int = calcularTotal(5000, 200) // Moto + Casco
    println("Total: $$precioTotal")
    println("Descuento rápido: $${aplicarDescuentoExpresion(5200, 500)}")
    println("Descuento rápido inferido: $${aplicarDescuentoInferido(5200, 500)}")
    atenderCliente("Carlos") 
}

fun bienvenidaTienda(): String {
    return "¡Hola, bienvenido a MotoStore!"
}

fun calcularTotal(precioMoto: Int, precioAccesorios: Int): Int {
    return precioMoto + precioAccesorios
}

//Tipo expresion
fun aplicarDescuentoExpresion(total: Int, descuento: Int): Int = total - descuento
//Tipo inferido
fun aplicarDescuentoInferido(total: Int, descuento: Int) = total - descuento

fun atenderCliente(nombre: String) {
    println("¡Hola, $nombre! ¿Qué moto buscas hoy?")
}
