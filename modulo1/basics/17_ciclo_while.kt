fun main() {
    println("Controles de flujo interaciones, ciclos repetitivos - ciclo while")
    println("While basico")
    var contador = 1
    while (contador <= 5) {
        println("Valor de contador: $contador")
        contador++
    }

    println("Do while")
    contador = 1
    do {
        println(contador)
        contador++
    } while (contador <= 5)

    println("Break y continue")
    contador = 1
    while (contador <= 10) {
        contador++
        if (contador == 3) continue
        if (contador == 8) break
        println(contador)
    }

    var input: String
    while (true) {
        println("Escribe 'salir' para terminar el programa:")
        input = readLine() ?: ""
        if (input == "") break
            println("usted ingreso: $input")
    }
}