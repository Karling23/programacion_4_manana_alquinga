fun main() {
    println("Controles de flujo")

    println("condicional if - else")
    println("Tiene seguro medico s/n: ")
    val tieneseguro = readLine() ?.trim() ?.lowercase() == "s"
    println("Costo Base: ")
    val costobase = readLine() ?.toDoubleOrNull() ?: 0.0
    if (tieneseguro) {
        val cobertura = costobase * 0.80
        println("Seguro cubre: $${"%.2f".format(cobertura)}")
    } else {
        println("Pago particular: $${"%.2f".format(costobase)}")
    }
}