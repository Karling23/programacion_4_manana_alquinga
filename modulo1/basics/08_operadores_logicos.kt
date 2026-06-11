fun main () {

    printeln("Operadores logicos")
    val esMayor = true
    val tienePermiso = false
    val estaActivo = true

    println("&& - And logico")
    println("$esMayor && $tienePermiso = ${esMayor && tienePermiso}")
    println("$estaActivo && $tienePermiso = ${estaActivo && tienePermiso}")

    println("|| - Or logico")
    println("$esMayor || $tienePermiso = ${esMayor || tienePermiso}")
    println("$estaActivo || $tienePermiso = ${estaActivo || tienePermiso}")

    println("! - Not logico")
    println("!$esMayor = ${!esMayor}")
    println("!$estaActivo = ${!estaActivo}")
}