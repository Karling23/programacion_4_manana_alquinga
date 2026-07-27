fun main() {
    println("Utilidades List en Motos")
    val ventasSemana = listOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) // Motos vendidas por día
    println(ventasSemana)
    val gananciasEstimadas = ventasSemana.map{it * 500} // Ganancia de 500 por moto
    println(gananciasEstimadas)
    val reporteDias = ventasSemana.map{"Día con $it ventas"}
    println(reporteDias)
    
    println("filter")
    val diasAltasVentas = ventasSemana.filter{it > 5 }
    println(diasAltasVentas)
    val diasPares = ventasSemana.filter{it % 2 == 0 }
    println(diasPares)
    val altasYpares = ventasSemana.filter{it % 2 == 0 && it > 5 }
    println(altasYpares)
    val diasBajasVentas = ventasSemana.filterNot{it > 5}
    println(diasBajasVentas)
    
    val inventarioMixto = listOf(1, "Yamaha", 2, "Honda", true, 42)
    val soloNombresMarcas = inventarioMixto.filterIsInstance<String>()
    println(soloNombresMarcas)
    
    println("reduce")
    val ventasMes = listOf(10, 20, 30, 40, 50)
    val totalVentas = ventasMes.reduce {acc, n -> acc + n}
    println("Total mes: $totalVentas")
    val multiplicador = ventasMes.reduce {acc ,n -> acc * n}
    println(multiplicador)
    
    println("fold")
    val metaVentas = ventasMes.fold(100) {acc, n -> acc + n} // Empieza en 100 de meta base
    println(metaVentas)
    
    println("Ordenar")
    println("Ascendente: ${ventasSemana.sorted()}")
    println("Descendente: ${ventasSemana.sortedDescending()}")
    println("Sorter by: ${ventasSemana.sortedBy{-it}} ")
    
    println("Agregacion")
    println("sumar ventas: ${ventasSemana.sum()}")
    println("promedio ventas: ${ventasSemana.average()}")
    println("minimo ventas: ${ventasSemana.min()} ")
    println("maximo ventas: ${ventasSemana.max()} ")
    println("contar días exitosos: ${ventasSemana.count{it > 4}} ")
    
    println("Busqueda")
    println("Buscar primer día alto: ${ventasSemana.find{it > 4}}")
    println("Buscar último día alto: ${ventasSemana.findLast {it > 4}}")
    println("Buscar any (algún día más de 4): ${ventasSemana.any {it > 4}}")
    println("Buscar all (todos más de 0): ${ventasSemana.all {it > 0}}")
    println("Buscar none (ninguno más de 10): ${ventasSemana.none {it > 10}}")
}
