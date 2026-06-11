class RegistroGarantia(val chasis: String, val emailCliente: String) {
    val chasisNormalizado: String
    val dominioEmail: String

    init {
        // Encapsulamiento en acción: validamos antes de construir el registro de garantía
        require(chasis.isNotBlank()) { "El número de chasis no puede estar vacío" }
        require(emailCliente.contains("@")) { "Email inválido para la garantía: $emailCliente" }

        chasisNormalizado = chasis.trim().uppercase()
        dominioEmail      = emailCliente.substringAfter("@")
    }
}

fun main() {
    val registro = RegistroGarantia("  yamaha-x123  ", "cliente@motos.dev")
    println("Chasis válido: ${registro.chasisNormalizado}")  
    println("Contacto dominio: ${registro.dominioEmail}")       

    // RegistroGarantia("", "invalido")   // IllegalArgumentException - require falla
}
