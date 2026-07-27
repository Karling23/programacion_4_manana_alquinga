fun main() {
    val marca = "honda"
    val modelo = "cbr500r"
    val precio = 7000

    //variable simple
    println("Moto: $marca")

    //Expresion
    println("Moto completa: ${marca.uppercase()} ${modelo.uppercase()}")
    val nombreCompleto = "Moto completa: ${marca.uppercase()} ${modelo.uppercase()}"
    println(nombreCompleto)
    println("Precio con descuento: ${precio - 500}")

    //String multilinea
    val fichaTecnica = """
        |Marca: $marca ${modelo}
        |Precio: $precio
        |Estado: ${if (precio > 6000) "Premium" else "Estándar"}
    """.trimIndent()
    println(fichaTecnica)
}
