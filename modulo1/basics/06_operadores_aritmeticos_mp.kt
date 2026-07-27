fun main() {

    println("Operadores aritmeticos en Venta de Motos")
    val precioBase = 10000
    val descuento = 300

    println("Suma (Precio con accesorios)")
    println("$precioBase + $descuento = ${precioBase + descuento}")

    println("Resta (Precio con descuento)")
    println("$precioBase - $descuento = ${precioBase - descuento}")

    println("Multiplicacion (Compra de varias unidades)")
    val cantidad = 3
    println("$precioBase * $cantidad = ${precioBase * cantidad}")

    println("Division (Pago en cuotas)")
    val cuotas = 12
    println("$precioBase / $cuotas = ${precioBase / cuotas}")

    println("Modulo")
    println("$precioBase % $cuotas = ${precioBase % cuotas}")

    println("Operadores de asignacion compuestos")
    var stockMotos = 50
    stockMotos += 10 
    println("stock + = $stockMotos")
    stockMotos -= 5
    println("stock - = $stockMotos")
    stockMotos *= 2
    println("stock * = $stockMotos")
    stockMotos /= 2
    println("stock / = $stockMotos")
    stockMotos %= 3
    println("stock % = $stockMotos")

    //Incremento o decremento
    stockMotos++
    println("stock++ = $stockMotos")
    stockMotos--
    println("stock-- = $stockMotos")
    
}
