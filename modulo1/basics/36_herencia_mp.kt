// Sin open — no se puede heredar (protección por defecto)
//class Vehiculo(val marca: String)
// class MotoDeportiva : Vehiculo("Yamaha")  // ERROR — Vehiculo es final

// Con open — la jerarquía está diseñada para ello
open class VehiculoMoto(val marca: String, val tipoMotor: String) {
    // open — la subclase PUEDE sobreescribir
    open fun arrancar() = println("$marca arranca con motor $tipoMotor")
    open fun descripcion() = "Moto marca $marca"

    // Sin open — la subclase NO puede sobreescribir
    fun frenar() = println("$marca está frenando")
}

// HERENCIA: MotoDeportiva reutiliza todo de VehiculoMoto y especializa arrancar
class MotoDeportiva(marca: String) : VehiculoMoto(marca, "Tetracilíndrico") {
    override fun arrancar() {
        super.arrancar()          // reutiliza la implementación del padre
        println("(Suena el escape deportivo)")   // añade comportamiento propio
    }
    override fun descripcion() = "${super.descripcion()}, modelo deportivo de alta velocidad"
}

class Scooter(marca: String, val electrica: Boolean) : VehiculoMoto(marca, if (electrica) "Eléctrico" else "Monocilíndrico") {
    override fun descripcion() =
        "${super.descripcion()}, un scooter ${if (electrica) "eléctrico y silencioso" else "urbano a combustión"}"
}

fun main() {
    val deportiva = MotoDeportiva("Yamaha")
    deportiva.arrancar()
    // Yamaha arranca con motor Tetracilíndrico
    // (Suena el escape deportivo)

    val miScooter = Scooter("Honda", true)
    println(miScooter.descripcion())  // Moto marca Honda, un scooter eléctrico y silencioso

    // Herencia — MotoDeportiva y Scooter tienen todo lo de VehiculoMoto más lo propio
    deportiva.frenar()  // Yamaha está frenando — heredado de VehiculoMoto
}
