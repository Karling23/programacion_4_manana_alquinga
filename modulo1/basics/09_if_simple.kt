fun main() {
    println("Controles de flujo")
    
    println("condicional if")
    val temperatura = readLine()?.toDoubleOrNull() ?: 36.5
    if (temperatura >= 38.0) {
        println("Fiebre detectada: derivar consulta prioritaria")
    }
    
    if (temperatura >= 40.0) {
        println("Fiebre alta: atencion de emergencia inmediata")
    }

    println("Temperatura registrada: $temperatura °C")
}