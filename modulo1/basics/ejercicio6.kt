//crear un programa en kotlin que:
//Muestre un meni en consola con opciones (saludar,sumar,tabla,salir)
//Use while para repetur el menu hasta que el usuario elija salir
//Use when para ejecutar cada opcion
//Solicite datos al usuario cuando sea necesario (numeros)
//Finalice cuando se sleccione salir

fun main() {
    var input: String
    while (true) {
        println("Escribe '4' para terminar el programa:")
        var input = readLine() ?: ""
        if (input == "4") break
            val Opciones = when(input){
            "1"->"Saludar"
            "2"->"Sumar"
            "3"->"tabla"
            "4"->"salir"
            else -> "No existe esa opcion"
            }
            println("usted ingreso: $input $Opciones")
    }
}