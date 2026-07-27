fun main() {
    println("Controles de flujo en Motos")

    println("condicional if - anidado")
    println("¿El cliente busca una moto deportiva? (s/n)")
    val buscaDeportiva = readLine()?.trim()?.lowercase() == "s"

    println("Presupuesto disponible ($):")
    val presupuesto = readLine()?.toIntOrNull() ?: 0

    if (buscaDeportiva) {
        println("Cliente busca moto deportiva")
        if (presupuesto < 3000) {
            println("Ofrecer opciones usadas de baja cilindrada")
        } else if (presupuesto > 10000) {
            println("Ofrecer superbikes de última generación")
        } else {
            println("Ofrecer deportivas de media cilindrada nuevas")
        }
    } else {
        println("Cliente busca otro estilo (naked, custom, scooter)")
        if (presupuesto < 2000) {
            println("Ofrecer scooters económicos")
        } else {
            println("Ofrecer naked o custom según preferencia")
        }
    }
}
