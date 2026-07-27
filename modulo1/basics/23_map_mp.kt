fun main() {
    println("Map inmutable en Motos")

    val preciosMarcas = mapOf(
        "Yamaha" to 5500,
        "Honda" to 5000,
        "Suzuki" to 4800,
        "BMW" to 15000
    )

    println("Precio Yamaha: ${preciosMarcas["Yamaha"]}")
    println("Precio Ducati: ${preciosMarcas["Ducati"]}")
    println(preciosMarcas.getOrDefault("Yamaha", "Desconocido"))
    println(preciosMarcas.getOrDefault("Ducati", "Desconocido"))

    println(preciosMarcas)
    println(preciosMarcas.keys)
    println(preciosMarcas.values)
    println(preciosMarcas.entries)

    for ((marca, precio) in preciosMarcas) {
        println("$marca - $$precio")
    }

    println("Map Mutable (Inventario Sucursal)")

    val stockMotos = mutableMapOf(
        "Naked" to 10,
        "Deportiva" to 4,
        "Scooter" to 12,
        "Custom" to 8
    )

    stockMotos["Adventure"] = 5
    println(stockMotos)

    stockMotos["Naked"] = 20
    println(stockMotos)

    stockMotos.remove("Custom")
    println(stockMotos)

    stockMotos.getOrPut("Touring") { 15 }
    println(stockMotos)

    stockMotos.getOrPut("Scooter") { 15 }
    println(stockMotos)
}
