abstract class CategoriaMoto(val nombreCategoria: String) {
    // abstract — las subclases DEBEN implementar esto (herencia forzada)
    abstract val velocidadMaxima: Double
    abstract val consumoPor100km: Double
    abstract fun descripcionUso(): String

    // concreto — disponible en todas las subclases (reutilización)
    fun compararConsumo(otra: CategoriaMoto): String = when {
        consumoPor100km > otra.consumoPor100km -> "$nombreCategoria consume más que ${otra.nombreCategoria}"
        consumoPor100km < otra.consumoPor100km -> "$nombreCategoria consume menos que ${otra.nombreCategoria}"
        else             -> "$nombreCategoria y ${otra.nombreCategoria} tienen el mismo consumo"
    }

    // Polimorfismo: toString usa propiedades polimórficas
    override fun toString() = "${descripcionUso()} | Vel. Max: ${velocidadMaxima} km/h | Consumo: ${consumoPor100km} L/100km"
}

class CategoriaDeportiva(val cc: Int) : CategoriaMoto("Deportiva") {
    override val velocidadMaxima: Double get() = if (cc > 500) 250.0 else 180.0
    override val consumoPor100km: Double get() = if (cc > 500) 6.5 else 4.5
    override fun descripcionUso() = "Moto Deportiva de ${cc}cc, ideal para circuito y velocidad"
}

class CategoriaScooter(val cc: Int) : CategoriaMoto("Scooter") {
    override val velocidadMaxima: Double get() = 100.0
    override val consumoPor100km: Double get() = 2.5
    override fun descripcionUso() = "Scooter de ${cc}cc, ideal para movilidad urbana"
}

class CategoriaAdventure(val cc: Int) : CategoriaMoto("Adventure") {
    override val velocidadMaxima: Double get() = 200.0
    override val consumoPor100km: Double get() = 5.5
    override fun descripcionUso() = "Moto Adventure de ${cc}cc, diseñada para viajes largos y todoterreno"
}

fun main() {
    // POLIMORFISMO: la lista acepta cualquier CategoriaMoto
    val categorias: List<CategoriaMoto> = listOf(
        CategoriaDeportiva(600),
        CategoriaScooter(150),
        CategoriaAdventure(800)
    )

    categorias.forEach { println(it) }  // toString polimórfico

    val masRapida = categorias.maxByOrNull { it.velocidadMaxima }
    println("\nCategoría más rápida: ${masRapida?.nombreCategoria}")

    println(categorias[0].compararConsumo(categorias[1]))
}
