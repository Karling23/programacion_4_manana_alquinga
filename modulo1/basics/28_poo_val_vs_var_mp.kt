class ChasisMotoInmutable(val numeroSerie: String, val material: String)   // solo lectura, el chasis no cambia

class InventarioSucursal(var cantidadMotos: Int = 0) {                  // lectura y escritura
    fun agregarMoto() { cantidadMotos++ }
    fun venderMoto()  { cantidadMotos-- }
}

// Sin val/var - parámetro del constructor, NO propiedad
// Solo accesible dentro del bloque init
class PromocionTemporal(codigoDescuento: String) {
    val codigoUpper = codigoDescuento.uppercase()
    // codigoDescuento no existe fuera de aquí
}
