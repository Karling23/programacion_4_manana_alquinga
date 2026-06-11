fun main() {
    println("Controles de flujo iteraciones, ciclos repetitivos - clico for en Motos")
    println("For con rango (Cálculo de cuotas)")
    for (i in 1..5) {
        println("Cuota $i de 500: ${500 * i}")
    }

    println("For con until (Inventario)")
    for (i in 1 until 6) {
        println("Moto en exhibición $i")
    }

    println("For con pasos (Revisiones por kilometraje)")
    for (km in 0..10000 step 2000) {
        println("Revisión a los $km km")
    }

    println("For descendente (Cuenta regresiva para entrega)")
    for (i in 5 downTo 1) {
        println("Faltan $i días para entregar tu moto")
    }

    println("For con listas (Marcas disponibles)")
    val marcas = listOf("Yamaha", "Honda", "Suzuki", "Kawasaki", "BMW")
    for (marca in marcas) {
        println(marca)
    }

    println("For con listas index valor")
    for ((index, valor) in marcas.withIndex()) {
        println("Pasillo $index -> $valor")
    }

    println("For con break")
    for (i in 1..10) {
        if (i == 5) {
            println("Se encontró la moto buscada en el lote $i")
            break
        }
        println("Buscando en lote $i")
    }

    println("For con continue")
    for (i in 1..10) {
        if (i == 3) continue // Lote vacío
        if (i == 7) break
        println("Revisando stock en lote $i")
    }

    val inventario = listOf(
        Triple("Yamaha MT-03", 2, 5000),
        Triple("Honda CBR500R", 0, 7000),
        Triple("Suzuki GSX-R150", 5, 3000)
    )

    for ((posicion, moto) in inventario.withIndex()) {
        val (modelo, stock, precio) = moto
        val alertaStock = if(stock == 0) "Agotado" else "Disponible"
        val alertaPrecio = if(precio > 6000) "Premium" else "Estándar"
        println("Puesto $posicion - $modelo - Stock: $stock ($alertaStock) - Precio: $$precio ($alertaPrecio)")
    }
}
