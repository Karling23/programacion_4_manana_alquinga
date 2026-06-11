fun main() {
    println("Controles de flujo")

    println("condicional if - anidado")
    println("Tiene antecedentes cardiacos?")
    val tieneAntecedentes = readLine()?.trim()?.lowercase() == "s"

    println("Frecuencia cardiaca (lpm):")
    val frecuencia = readLine()?.toIntOrNull() ?: 0

    if (tieneAntecedentes) {
        println("Paciente con antecedentes cardiacos")
        if (frecuencia < 50) {
            println("Bradicardia severa")
        } else if (frecuencia > 100) {
            println("Taquicardia")
        } else {
            println("Frecuencia cardiaca normal")
        }
    } else {
        println("Paciente sin antecedentes cardiacos")
        if (frecuencia < 50 || frecuencia > 100) {
            println("Frecuencia cardiaca anormal")
        } else {
            println("Frecuencia cardiaca normal")
        }
    }
}