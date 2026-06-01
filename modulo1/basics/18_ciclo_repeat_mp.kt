fun main() {
    println("Controles de Flujo Iteraciones, Ciclos repetitivos - Ciclo Repeat en Motos")
    println("¿Cuántas motos deseas registrar en el inventario?")
    
    val cantidad = readLine()?.toIntOrNull() ?: 3
    var totalValor = 0
    
    repeat(cantidad) { i ->
        println("Registro ${i + 1} (Precio de la moto en $)")
        val precio = readLine()?.toIntOrNull() ?: 0
        totalValor += precio
    }
    val promedio = if (cantidad > 0) totalValor / cantidad else 0
    println("Valor promedio del inventario ingresado : $$promedio")
    println("Clasificacion de gama: ${
        when {
            promedio < 3000 -> "Gama Baja"
            promedio <= 8000 -> "Gama Media"
            else -> "Gama Alta"
        }
    }")
}
