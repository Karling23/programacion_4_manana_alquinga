fun main(){
    println ("Funciones - Parametros por defecto en Motos")
    println(crearCotizacion("Yamaha MT-03", 5500, "Contado", true))
    println(crearCotizacion("Honda Navi"))
    println(crearCotizacion("Suzuki Gixxer", 3000))
    println(crearCotizacion("Kawasaki Ninja", 9000, "Financiado"))
    
    //Argumentos nombrados
    println(crearCotizacion(precio=7500, modelo="BMW G310", incluyeSeguro=false))
}

fun crearCotizacion(
    modelo: String,
    precio: Int = 2000,
    metodoPago: String = "Contado",
    incluyeSeguro: Boolean = true 
): String{
    return "Cotizacion[modelo=$modelo, precio=$$precio, pago=$metodoPago, seguro=$incluyeSeguro]"
}
