enum class EstadoVentaMoto(val descripcion: String, val esTerminal: Boolean) {
    SEPARADA   ("Moto reservada por el cliente", false),
    EN_FINANCIAMIENTO ("Esperando aprobación del banco", false),
    ENTREGADA  ("Moto entregada al cliente",    true),
    RECHAZADA  ("Crédito rechazado",    true),
    CANCELADA  ("Cancelada por el cliente",   true);

    fun puedeTransicionarA(siguiente: EstadoVentaMoto): Boolean = when (this) {
        SEPARADA  -> siguiente == EN_FINANCIAMIENTO || siguiente == CANCELADA || siguiente == ENTREGADA
        EN_FINANCIAMIENTO -> siguiente == ENTREGADA || siguiente == RECHAZADA
        else       -> false
    }
}

fun main() {
    val estadoVenta = EstadoVentaMoto.EN_FINANCIAMIENTO
    println(estadoVenta.descripcion)  // Esperando aprobación del banco
    println("¿Es estado final?: ${estadoVenta.esTerminal}")   // false

    // when exhaustivo
    val accion = when (estadoVenta) {
        EstadoVentaMoto.SEPARADA   -> "Guardar en bodega de reservas"
        EstadoVentaMoto.EN_FINANCIAMIENTO  -> "Llamar al banco"
        EstadoVentaMoto.ENTREGADA  -> "Cerrar expediente de venta"
        EstadoVentaMoto.RECHAZADA     -> "Devolver moto a piso de ventas"
        EstadoVentaMoto.CANCELADA   -> "Devolver abono al cliente"
    }
    println(accion)  

    println("¿Puede pasar a Entregada?: ${estadoVenta.puedeTransicionarA(EstadoVentaMoto.ENTREGADA)}")  // true
}
