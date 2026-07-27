class FacturaMoto(val montoBase: Double, val impuestos: Double) {
    val total:      Double get() = montoBase + impuestos
    val totalConSeguro: Double get() = total + 500.0 // Seguro fijo

    // Siempre llaman al constructor primario con this(...)
    constructor(montoFijo: Double) : this(montoFijo, montoFijo * 0.15)
    constructor(montoInt: Int, impuestosInt: Int) : this(montoInt.toDouble(), impuestosInt.toDouble())

    override fun toString() = "FacturaMoto(Base: $$montoBase, Impuestos: $$impuestos) | Total: $$total"
}

fun main() {
    val f1 = FacturaMoto(5000.0, 750.0)
    val f2 = FacturaMoto(4000.0)        // calcula impuestos automáticamente
    val f3 = FacturaMoto(6000, 900)       // con Int

    println(f1)  
    println(f2)  
    println(f3)  
}
