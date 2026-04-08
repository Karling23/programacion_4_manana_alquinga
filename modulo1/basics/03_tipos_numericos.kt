fun main() {
    val numero1: Byte = 127
    println("Numero Byte $numero1")
    val numero2: Short = 32_765 
    println("Numero Short $numero2")
    val numero3: Long = 12_122_122_122 
    println("Numero Long (antes Int) $numero3")
    val numero4: Long = 12_122_122_122_123_123L 
    println("Numero Long grande $numero4")
	
    println("Numero decimales")
    val numero5: Float = 3.14f 
    println("Numero Float $numero5")
    val numero6: Double = 3.1415926535
    println("Numero Double $numero6")
    
    //Inferido
    val nombre = "Juana" 
    val edad = 56 
    
    println("Nombre $nombre")
    val nombreTipo = nombre::class.simpleName
    println("Tipo inferido nombre: ${nombreTipo}")
    println("Tipo inferido nombre: ${nombre::class.simpleName}")
    
    println("Edad: $edad")
    val edadTipo = edad::class.simpleName
    println("Tipo inferido edad: ${edadTipo}")
    println("Tipo inferido edad: ${edad::class.simpleName}")
}