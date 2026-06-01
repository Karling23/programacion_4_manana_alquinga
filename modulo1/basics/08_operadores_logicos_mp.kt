fun main () {

    println("Operadores logicos en Venta de Motos")
    val tieneLicencia = true
    val tieneHistorialCrediticio = false
    val esMayorDeEdad = true

    println("&& - And logico (Para crédito)")
    println("$esMayorDeEdad && $tieneHistorialCrediticio = ${esMayorDeEdad && tieneHistorialCrediticio}")
    println("$tieneLicencia && $esMayorDeEdad = ${tieneLicencia && esMayorDeEdad}")

    println("|| - Or logico (Opciones de pago)")
    val pagoEfectivo = false
    println("$pagoEfectivo || $tieneHistorialCrediticio = ${pagoEfectivo || tieneHistorialCrediticio}")

    println("! - Not logico")
    println("!$tieneLicencia = ${!tieneLicencia}")
    println("!$tieneHistorialCrediticio = ${!tieneHistorialCrediticio}")
}
