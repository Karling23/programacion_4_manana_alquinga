fun main() {

    println("Ingrese numero 1:")
    val numero1 = readLine()?.toIntOrNull() ?: 0
    println("Ingrese numero 2:")
    val numero2 = readLine()?.toIntOrNull() ?: 0
    println("Suma")
    println("$numero1 + $numero2 = ${numero1 + numero2}")
    println("Resta")
    println("$numero1 - $numero2 = ${numero1 - numero2}")
    println("Multiplicacion")
    println("$numero1 * $numero2 = ${numero1 * numero2}")
    println("Division")
    if (numero2 != 0) {
        println("$numero1 / $numero2 = ${numero1 / numero2}")
    } else {
        println("No se puede dividir por cero")
    }
}