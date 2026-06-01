fun main() {
    println("Controles de flujo iteraciones, ciclos repetitivos - ciclo while en Motos")
    println("While basico (Venta de accesorios)")
    var accesoriosComprados = 1
    while (accesoriosComprados <= 5) {
        println("Accesorio añadido al carrito: $accesoriosComprados")
        accesoriosComprados++
    }

    println("Do while (Prueba de manejo)")
    var vueltas = 1
    do {
        println("Vuelta de prueba completada: $vueltas")
        vueltas++
    } while (vueltas <= 3)

    println("Break y continue (Procesando pagos)")
    var pago = 1
    while (pago <= 10) {
        pago++
        if (pago == 3) continue // Pago fallido, saltar
        if (pago == 8) break // Límite de transacciones
        println("Pago $pago procesado exitosamente")
    }

    var input: String
    while (true) {
        println("Escribe 'salir' para terminar la búsqueda de motos:")
        input = readLine() ?: ""
        if (input == "salir" || input == "") break
        println("Buscando modelo: $input en el inventario...")
    }
}
