fun main() {
    val nombre = "ana"
    val apellito = "perez"
    val edad = 28

    //variable simple
    println("Hola $nombre")

    //Expresion
    println("Nombre completo: ${nombre.uppercase()} ${apellito.uppercase()}")
    val nombreCompleto = "Nombre completo: ${nombre.uppercase()} ${apellito.uppercase()}"
    println(nombreCompleto)
    println("Edad: ${edad + 1}")

    //String multilinea
    val tarjeta = """
        |Nombre: $nombre ${apellito}
        |Edad: $edad
        |Acceso: ${if (edad >= 18) "Permitido" else "Denegado"}
    """.trimIndent()
    println(tarjeta)
}