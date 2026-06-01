fun main() {
    println("Controles de Flujo When en Motos")
    println("Escriba codigo de marca de moto (1-6)")
    val codigo = readLine()?.toIntOrNull()?:0
    val marca = when(codigo){
        1->"Yamaha"
        2->"Honda"
        3->"Suzuki"
        4->"Kawasaki"
        5->"Ducati"
        6->"BMW"
        else -> "Marca no registrada en el sistema de ventas"
    }
    println("Marca seleccionada: $marca ")
}
