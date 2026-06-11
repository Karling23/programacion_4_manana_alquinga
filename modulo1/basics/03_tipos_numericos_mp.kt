fun main() {
    val cilindrada: Short = 250
    println("Cilindrada en cc $cilindrada")
    val stockDisponible: Byte = 15 
    println("Stock disponible $stockDisponible")
    val numeroChasis: Long = 12_122_122_122 
    println("Numero de chasis $numeroChasis")
    val numeroImportacion: Long = 12_122_122_122_123_123L 
    println("Numero importación grande $numeroImportacion")
	
    println("Valores con decimales")
    val precioLista: Float = 4500.50f 
    println("Precio de lista Float $precioLista")
    val precioFinal: Double = 4500.50999999
    println("Precio final Double $precioFinal")
    
    //Inferido
    val modelo = "MT-03" 
    val caballosFuerza = 42 
    
    println("Modelo $modelo")
    val modeloTipo = modelo::class.simpleName
    println("Tipo inferido modelo: ${modeloTipo}")
    
    println("HP: $caballosFuerza")
    val hpTipo = caballosFuerza::class.simpleName
    println("Tipo inferido HP: ${hpTipo}")
}
