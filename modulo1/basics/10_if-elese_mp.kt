fun main() {
    println("Controles de flujo en Motos")

    println("condicional if - else")
    println("¿El cliente paga en efectivo? (s/n): ")
    val pagaEfectivo = readLine()?.trim()?.lowercase() == "s"
    
    println("Precio base de la moto: ")
    val precioBase = readLine()?.toDoubleOrNull() ?: 0.0
    
    if (pagaEfectivo) {
        val descuento = precioBase * 0.10
        val total = precioBase - descuento
        println("Aplica descuento (10%). Total a pagar: $${"%.2f".format(total)}")
    } else {
        println("Pago con financiamiento. Total a pagar: $${"%.2f".format(precioBase)}")
    }
}
