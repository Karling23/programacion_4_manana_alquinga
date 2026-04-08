fun main() {

    println("Operadores aritmeticos")
    val numero1 = 10
    val numero2 = 3

    println("Suma")
    println("$numero1 + $numero2 = ${numero1 + numero2}")

    println("Resta")
    println("$numero1 - $numero2 = ${numero1 - numero2}")

    println("Multiplicacion")
    println("$numero1 * $numero2 = ${numero1 * numero2}")

    println("Division")
    println("$numero1 / $numero2 = ${numero1 / numero2}")

    println("Modulo")
    println("$numero1 % $numero2 = ${numero1 % numero2}")

    println("Operadores de asignacion compuestos")
    var x = 5
    x += 3 
    println("x + = $x")
    x -= 2
    println("x - = $x")
    x *= 4
    println("x * = $x")
    x /= 2
    println("x / = $x")
    x %= 3
    println("x % = $x")

    //Incremento o decremento
    x++
    println("x++ = $x")
    x--
    println("x-- = $x")
    
}