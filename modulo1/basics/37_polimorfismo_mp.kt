// La interfaz define el contrato — QUÉ puede hacer
// Las implementaciones definen el CÓMO
interface MetodoPagoMoto {
    fun procesar(monto: Double): Boolean
    val nombre: String
}

class TarjetaCreditoMoto(val numero: String) : MetodoPagoMoto {
    override val nombre = "Tarjeta de crédito"
    override fun procesar(monto: Double): Boolean {
        println("💳 Cargando $${"%.2f".format(monto)} a $numero para la compra de la moto")
        return true
    }
}

class FinanciamientoBancario(val banco: String) : MetodoPagoMoto {
    override val nombre = "Crédito $banco"
    override fun procesar(monto: Double): Boolean {
        println("🏦 Aprobando crédito por $${"%.2f".format(monto)} en $banco")
        return true
    }
}

class EfectivoMoto : MetodoPagoMoto {
    override val nombre = "Efectivo"
    override fun procesar(monto: Double): Boolean {
        println("💵 Recibiendo $${"%.2f".format(monto)} en efectivo en caja")
        return true
    }
}
class RetomaMotoUsada(val placa: String) : MetodoPagoMoto {
    override val nombre = "Retoma de Moto Usada"
    override fun procesar(monto: Double): Boolean {
        println("🏍️ Aplicando saldo a favor de $${"%.2f".format(monto)} por moto entregada placa $placa")
        return true
    }
}

// Esta función no sabe ni le importa qué tipo de pago es
// Solo sabe que recibe algo que implementa MetodoPagoMoto — POLIMORFISMO
fun cobrarVentaMoto(monto: Double, metodoPago: MetodoPagoMoto) {
    println("Procesando pago con ${metodoPago.nombre}...")
    val exito = metodoPago.procesar(monto)
    println(if (exito) "✅ Pago exitoso, moto vendida" else "❌ Pago fallido")
}

fun main() {
    val metodos: List<MetodoPagoMoto> = listOf(
        TarjetaCreditoMoto("**** **** **** 1234"),
        FinanciamientoBancario("Banco Nacional"),
        EfectivoMoto(),
        RetomaMotoUsada("XYZ-987")
    )

    // Misma función — comportamiento distinto según el tipo
    metodos.forEach { cobrarVentaMoto(2500.00, it) }

    for(pago in metodos){
        println("$pago")
    }
}
