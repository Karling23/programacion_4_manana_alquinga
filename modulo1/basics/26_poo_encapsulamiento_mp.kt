class CuentaClienteMoto(titular: String, saldoInicial: Double) {

    val titular: String = titular       // público - cualquiera puede leer

    private var saldo: Double = saldoInicial  // privado - solo esta clase lo modifica

    internal val numeroCliente: String =        // internal - visible en el mismo módulo
        "CLI${(100000..999999).random()}"

    protected open fun calcularDescuentoFidelidad(): Double = saldo * 0.05  // protected - visible en subclases

    // El saldo solo cambia a través de estos métodos - NUNCA directamente
    fun abonarReserva(monto: Double) {
        require(monto > 0) { "El monto del abono debe ser positivo" }
        saldo += monto
        println("Abono de reserva: $${"%.2f".format(monto)} | Nuevo saldo a favor: ${consultarSaldo()}")
    }

    fun pagarCuota(monto: Double): Boolean {
        require(monto > 0) { "La cuota debe ser positiva" }
        if (monto > saldo) {
            println("Fondos insuficientes para cubrir la cuota de la moto")
            return false
        }
        saldo -= monto
        println("Cuota pagada: $${"%.2f".format(monto)} | Saldo restante a favor: ${consultarSaldo()}")
        return true
    }

    fun consultarSaldo(): String = "$${"%.2f".format(saldo)}"
}

fun main() {
    val cuenta = CuentaClienteMoto("Carlos López", 5000.0) // Cliente con presupuesto

    cuenta.abonarReserva(1000.0)    // Abona para separar una moto
    cuenta.pagarCuota(2500.0)       // Paga parte de la moto
    cuenta.pagarCuota(4000.0)       // Fondos insuficientes

    println(cuenta.titular)         // Carlos López - acceso público permitido
    println(cuenta.consultarSaldo()) 
    // cuenta.saldo = 999999.0       // ERROR - saldo es privado
}
