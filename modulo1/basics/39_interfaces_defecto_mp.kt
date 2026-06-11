interface CotizableMoto {
    val numeroCotizacion: String      // abstracta — debe implementarse
    fun exportarCotizacion(): String  // abstracta — debe implementarse
    val vigenciaDias: Int get() = 15  // con default — puede sobreescribirse
}

interface FinanciamientoValidable {
    val requisitosFaltantes: List<String>
    val apruebaCredito: Boolean get() = requisitosFaltantes.isEmpty()

    fun validarHistorial(): Boolean
    fun mostrarRequisitos() {                // implementación por defecto
        if (requisitosFaltantes.isEmpty()) println("Cliente pre-aprobado para crédito")
        else requisitosFaltantes.forEach { println("  ❌ Faltante: $it") }
    }
}

// POLIMORFISMO: VentaFinanciada puede usarse donde se espere CotizableMoto O FinanciamientoValidable
data class VentaFinanciadaMoto(
    override val numeroCotizacion: String,
    val nombreCliente:     String,
    val modeloMoto:        String,
    val ingresoMensual:    Double
) : CotizableMoto, FinanciamientoValidable {

    override fun exportarCotizacion() =
        "Cotización $numeroCotizacion | Cliente: $nombreCliente | Moto: $modeloMoto | Vigencia: $vigenciaDias días"

    override val requisitosFaltantes: List<String> get() = buildList {
        if (nombreCliente.isBlank()) add("El nombre del cliente es obligatorio")
        if (ingresoMensual < 800.0)  add("El ingreso no alcanza el mínimo requerido para financiar")
        if (modeloMoto.isBlank())    add("Debe seleccionar una moto a financiar")
    }

    override fun validarHistorial() = apruebaCredito
}

fun main() {
    val venta1 = VentaFinanciadaMoto("COT-001", "Luis", "Yamaha MT-03", 1200.0)
    val venta2 = VentaFinanciadaMoto("COT-002", "",    "Honda Navi",    500.0)

    // Polimorfismo por interfaz
    fun imprimirCotizacion(c: CotizableMoto) = println("→ ${c.exportarCotizacion()}")
    fun verificarCredito(v: FinanciamientoValidable) {
        println("Aprobado: ${v.apruebaCredito}")
        v.mostrarRequisitos()
    }

    imprimirCotizacion(venta1)   
    verificarCredito(venta1)     
    verificarCredito(venta2)      
}
