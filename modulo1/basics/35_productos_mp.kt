data class MarcaMoto(val id: Int, val nombre: String)

data class MotocicletaInventario(
    val id:        Int,
    val modelo:    String,
    val precio:    Double,
    val stock:     Int,
    val marca:     MarcaMoto,
    val activa:    Boolean = true
) {
    val disponible: Boolean get() = activa && stock > 0
    val precioConMatricula: Double get() = precio + 200.0 // 200 fijos de matrícula

    fun aplicarDescuentoEspecial(porcentaje: Double): MotocicletaInventario {
        require(porcentaje in 0.0..100.0) { "Descuento debe ser entre 0 y 100" }
        return copy(precio = precio * (1 - porcentaje / 100))
    }
}

object Concesionario {
    private val marcas = mutableListOf(
        MarcaMoto(1, "Yamaha"),
        MarcaMoto(2, "Honda"),
        MarcaMoto(3, "Suzuki")
    )
    private val motosInventario   = mutableListOf<MotocicletaInventario>()
    private var siguienteId = 1

    fun registrarMoto(modelo: String, precio: Double, stock: Int, marcaId: Int): MotocicletaInventario? {
        val marca = marcas.find { it.id == marcaId } ?: return null
        val moto  = MotocicletaInventario(siguienteId++, modelo, precio, stock, marca)
        motosInventario.add(moto)
        return moto
    }

    fun listar(): List<MotocicletaInventario>              = motosInventario.toList()
    fun disponibles(): List<MotocicletaInventario>         = motosInventario.filter { it.disponible }
    fun porMarca(id: Int): List<MotocicletaInventario> = motosInventario.filter { it.marca.id == id }
    fun buscar(query: String): List<MotocicletaInventario> =
        motosInventario.filter { it.modelo.contains(query, ignoreCase = true) }
}

fun main() {
    Concesionario.registrarMoto("Yamaha MT-03",   5500.0, 5, 1)
    Concesionario.registrarMoto("Yamaha R15",     4500.0, 0, 1)
    Concesionario.registrarMoto("Honda CBR500R",  7000.0, 2, 2)
    Concesionario.registrarMoto("Suzuki Gixxer",  3000.0, 8, 3)
    Concesionario.registrarMoto("Honda Navi",     1500.0, 0, 2)
    Concesionario.registrarMoto("Suzuki V-Strom", 9000.0, 3, 3)

    println("=== Todas las motos en Concesionario ===")
   
    for(moto in Concesionario.listar()) {
        println("${moto.modelo} - $${"%.2f".format(moto.precio)} (Stock: ${moto.stock})")
    }

    println("\n=== Motos Disponibles ===")
    Concesionario.disponibles().forEach { m ->
        val estado = if (m.disponible) "[✓]" else "[X]"
        println("$estado ${m.modelo} - $${"%.2f".format(m.precioConMatricula)} (con matrícula)")
    }
}
