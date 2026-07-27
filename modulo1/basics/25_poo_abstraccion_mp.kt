// El usuario de esta clase solo sabe QUÉ puede hacer con una Motocicleta
// No necesita saber cómo se calcula precioConIva ni cómo funciona disponible
class Motocicleta(
    val id:       Int,
    val modelo:   String,
    val precio:   Double,
    private val stock: Int      // privado - el usuario no manipula el stock directamente
) {
    val precioConIva: Double    // interfaz pública - qué puede consultar
        get() = precio * 1.15   // Ejemplo: 15% de IVA en vehículos

    val disponible: Boolean
        get() = stock > 0

    override fun toString() = "$modelo ($${"%.2f".format(precio)})"
}

fun main() {
    val moto = Motocicleta(1, "Yamaha MT-03", 5500.00, 5)

    // El código externo usa la interfaz pública - no sabe el detalle interno
    println("Disponible: ${moto.disponible}")   // true
    println("Precio con IVA: ${moto.precioConIva}") 
    // moto.stock = 0           // ERROR - privado, protegido por diseño
}
