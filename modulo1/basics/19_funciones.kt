fun main() {
    Println("Funciones")
    
    val saludo = saludo()
    println(saludo)
    val suma: Int = sumar(5, 10)
    println(suma)
    println("${restarTipoExpresion(10, 5)}")
    println(restarTipoExpresion(20, 8))
    println(restarTipoInferido(15, 7))
    saludar("Juan") 
}

fun saludo(): String {
    return "Hola, bienvenido a Kotlin!"
}

fun sumar(a: Int, b: Int): Int {
    return a + b
}

//Tipo expresion
fun restarTipoExpresion(a: Int, b: Int): Int = a - b
//Tipo inferido
fun restarTipoInferido(a: Int, b: Int) = a - b

fun saludar(nombre: String) {
    println("Hola, $nombre! Bienvenido a Kotlin!")
}