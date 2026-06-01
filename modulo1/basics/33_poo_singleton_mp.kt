object ConfiguracionTienda {
    val sucursal:    String = "Central Motors"
    val maxAforo:    Int    = 50
    private val tokenInventario: String = "token-secreto-inventario-123"   // privado - nunca expuesto

    fun bienvenida() = "Bienvenido a $sucursal"
    fun headersApi() = mapOf("Authorization" to "Bearer $tokenInventario")
}

class VendedorMoto private constructor(val id: Int, val nombre: String) {
    companion object {
        private var contadorVendedores = 0

        // Factory function - encapsulamiento del constructor
        fun registrarVendedor(nombre: String, email: String): VendedorMoto? {
            if (nombre.isBlank() || !email.contains("@motos.com")) return null
            return VendedorMoto(++contadorVendedores, nombre.trim())
        }

        const val ROL_DEFECTO = "asesor_junior"
    }
}

fun main() {
    println(ConfiguracionTienda.bienvenida())  
    // ConfiguracionTienda.tokenInventario            // ERROR - privado

    val v = VendedorMoto.registrarVendedor("Carlos", "carlos@motos.com")
    if (v != null) {
        println("Vendedor: ${v.nombre} (ID: ${v.id})")  
    }
}
