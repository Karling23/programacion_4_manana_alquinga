fun main() {
    println("Controles de flujo when - con condiciones arbitrarias (Seguro de Moto)")
    println("Edad del conductor:")
    val edad = readLine()?.toIntOrNull()?:0
    println("¿Es cliente VIP? (s/n):")
    val esVip = readLine()?.trim()?.lowercase() == "s"
    val tipoSeguro = if (!esVip) {
        println("Tipo de seguro deseado (Basico, Terceros, Todo Riesgo):")
        readLine()?.trim()?.lowercase() ?: ""
    } else {
        "todo riesgo" // VIP siempre tiene todo riesgo por defecto
    }
    
    val costoSeguro = when {
        esVip -> 0.0 // Gratis para VIP como promoción
        edad < 21 && tipoSeguro == "todo riesgo" -> 500.0 // Alto riesgo
        edad < 25 -> 300.0
        tipoSeguro == "basico" -> 100.0
        tipoSeguro == "terceros" -> 150.0
        tipoSeguro == "todo riesgo" -> 250.0
        else -> 100.0
    }
    println("Costo anual del seguro: $${"%.2f".format(costoSeguro)}")
}
