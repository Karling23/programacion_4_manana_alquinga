fun main() {
    //no mutable
    val marca = "Yamaha"
    val anio: Int = 2023
    val precio = 5500.50
    
    //mutable
    var stock = 10
    stock = stock + 1
    println(stock)
    stock = stock - 1
    println(stock)
    
    println("La moto $marca del año $anio cuesta $precio")
}
