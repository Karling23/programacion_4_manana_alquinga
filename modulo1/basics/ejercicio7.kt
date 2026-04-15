//Un medico debe registrar la temperatura de un paciente cada 4 horas
//durante 24 horas (6 mediciones). Usa repeat oara pedir cada valor, detecta
//si alguna supera 38.5 °C e imprime al final el promedio y si hubo fiebre sostenida 
//(mas de 2 mediciones con fiebre)

fun main() {
    println("Registro de temperatura de un paciente cada 4 horas durante 24 horas")
    println("Cuantas mediciones tomar para calcular temperatura promedio")
    
    val mediciones = readLine()?.toIntOrNull() ?: 6
    var totalTemperatura = 0.0
    var conteoFiebre = 0
    
    repeat(mediciones) { i ->
        println("Medición ${i + 1} (temperatura en °C)")
        val temperatura = readLine()?.toDoubleOrNull() ?: 0.0
        totalTemperatura += temperatura
        if (temperatura > 38.5) conteoFiebre++
    }
    val promedio = totalTemperatura / mediciones
    println("Temperatura promedio : $promedio °C")
    println("Fiebre sostenida: ${if (conteoFiebre > 2) "Sí" else "No"}")
}