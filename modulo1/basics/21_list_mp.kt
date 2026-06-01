fun main() {
    println("Listas en Motos")

    val accesorios = listOf("casco", "guantes", "chaqueta", "casco", "botas")

    println("Size: ${accesorios.size}")
    println("Mostrar el elemento indice 0: ${accesorios[0]}")
    println("Mostrar el primer elemento: ${accesorios.first()}")
    println("Mostrar el ultimo elemento: ${accesorios.last()}")

    println("Mostrar el elemento indice 2: ${accesorios.get(2)}")
    println("Mostrar indice contenido elemento: ${accesorios.indexOf("guantes")}")

    println("Verificar existencia de elemento: ${accesorios.contains("chaqueta")}")
    println("Verificar existencia de un elemento: ${"casco" in accesorios}")

    //sublistas
    println("Sublista: ${accesorios.subList(1, 3)}")
    println("Tomar primeros 2 elementos: ${accesorios.take(2)}")
    println("Suprimir tres primeros elementos: ${accesorios.drop(3)}")
    println("Tomar los ultimos dos elementos: ${accesorios.takeLast(2)}")

    for (accesorio in accesorios) {
        println(accesorio)
    }

    println("lista mutable")

    val marcas = mutableListOf("Yamaha", "Honda", "Suzuki", "Kawasaki")

    marcas.add("BMW")
    println(marcas)
    marcas.add(0, "Ducati")
    println(marcas)
    marcas.remove("BMW")
    println(marcas)
    marcas[1] = "KTM"
    println(marcas)

    println("Array deque (Fila de servicio)")
    val filaServicio = ArrayDeque<String>()
    println(filaServicio)
    filaServicio.addFirst("Moto1")
    println(filaServicio)
    filaServicio.addLast("Moto2")
    println(filaServicio)
    filaServicio.addLast("Moto3")
    println(filaServicio)
    filaServicio.removeFirst()
    println(filaServicio)
    filaServicio.removeLast()
    println(filaServicio)
}
