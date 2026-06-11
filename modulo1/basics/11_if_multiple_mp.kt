fun main() {
    println("Controles de flujo en Motos")
    println("condicional if - multiples condiciones")
    println("Cilindrada de la moto (cc)")
    val cilindrada = readLine()?.toIntOrNull() ?: 0

    val categoria = if (cilindrada <= 50) {
        "Ciclomotor"
    } else if (cilindrada <= 125) {
        "Urbana baja cilindrada"
    } else if (cilindrada <= 250) {
        "Urbana media cilindrada"
    } else if (cilindrada <= 500) {
        "Media cilindrada"
    } else if (cilindrada <= 1000) {
        "Alta cilindrada"
    } else {
        "Superbike o Touring pesada"
    }
    println("Categoria: $categoria")
    println("Categoria: ${categoria.uppercase()}")
}
