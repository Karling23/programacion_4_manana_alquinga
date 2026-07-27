class PresionNeumatico(psi: Double) {

    // ENCAPSULAMIENTO: el setter valida antes de asignar la presión
    var psi: Double = psi
        set(value) {
            require(value >= 0.0) { "La presión del neumático no puede ser negativa" }
            require(value <= 50.0) { "Peligro de estallido del neumático de moto" }
            field = value  // 'field' es el backing field
        }

    // ABSTRACCIÓN: el usuario consulta otras unidades sin saber la fórmula
    val bar: Double
        get() = psi * 0.0689476

    val kpa: Double
        get() = psi * 6.89476

    val estadoNeumatico: String
        get() = when {
            psi < 25.0 -> "Peligrosamente baja para moto"
            psi < 30.0 -> "Un poco baja, revisar antes de rodar"
            psi <= 36.0 -> "Presión óptima"
            psi <= 42.0 -> "Ideal con pasajero o carga"
            else -> "Presión muy alta, reducirla"
        }
}

fun main() {
    val presion = PresionNeumatico(32.0)
    println("${presion.psi} PSI = ${"%.2f".format(presion.bar)} BAR = ${"%.2f".format(presion.kpa)} kPa")
    println(presion.estadoNeumatico)  // Presión óptima

    presion.psi = 22.0
    println("${presion.psi} PSI -> ${presion.estadoNeumatico}")  

    // presion.psi = -5.0  // IllegalArgumentException
    // presion.psi = 60.0  // IllegalArgumentException
}
