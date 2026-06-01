data class FichaTecnicaMoto(
    val id:        Int,
    val modelo:    String,
    val precio:    Double,
    val estilo:    String,
    val enVenta:   Boolean = true
)

fun main() {
    val m1 = FichaTecnicaMoto(1, "Yamaha MT-03", 5500.00, "Naked")
    val m2 = FichaTecnicaMoto(1, "Yamaha MT-03", 5500.00, "Naked")
    val m3 = FichaTecnicaMoto(2, "Honda CBR500R", 7000.00, "Deportiva")

    // toString() automático
    println(m1)  // FichaTecnicaMoto(id=1, modelo=Yamaha MT-03, ...)

    // equals() por valor
    println(m1 == m2)   // true
    println(m1 == m3)   // false

    // copy() - nuevo objeto con cambios puntuales
    val liquidacion = m1.copy(precio = 4500.00)
    val agotada     = m1.copy(enVenta = false)

    // Desestructuración
    val (id, modelo, precio) = m1
    println("Moto $id: $modelo - $$precio")

    // En bucles
    listOf(m1, m3).forEach { (id2, modelo2, precio2) ->
        println("[$id2] $modelo2: $$precio2")
    }
}
