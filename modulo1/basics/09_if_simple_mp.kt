fun main() {
    println("Controles de flujo en Motos")
    
    println("condicional if")
    println("Ingresa el kilometraje de la moto:")
    val kilometraje = readLine()?.toDoubleOrNull() ?: 0.0
    
    if (kilometraje == 0.0) {
        println("Moto nueva: Ofrecer garantía extendida")
    }
    
    if (kilometraje > 50000.0) {
        println("Moto de alto kilometraje: Ofrecer revisión general")
    }

    println("Kilometraje registrado: $kilometraje km")
}
