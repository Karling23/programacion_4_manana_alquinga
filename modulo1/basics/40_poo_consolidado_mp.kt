// ABSTRACCIÓN: sealed class define los estados posibles de un pedido de moto
sealed class EstadoPedidoMoto(val titulo: String, val detalle: String) {
    abstract fun mostrarEstado(): String  // cada tipo formatea de forma distinta

    data class PreparacionConcesionario(
        val mecanico: String,
        val tareas:   String
    ) : EstadoPedidoMoto("En Preparación", tareas) {
        override fun mostrarEstado() =
            "🔧 Taller → A cargo de: $mecanico\n   Estado: $titulo\n   Tareas: $detalle"
    }

    data class TramitePlacas(val gestor: String, val diasEstimados: Int = 3)
        : EstadoPedidoMoto("Trámite de Placas", "En institución de tránsito") {
        override fun mostrarEstado() = "📝 Placas → Gestor: $gestor (Aprox. $diasEstimados días)"
    }

    data class ListaParaEntrega(val nombreCliente: String)
        : EstadoPedidoMoto("Lista para Entrega", "La moto está lavada y lista") {
        override fun mostrarEstado() = "🎉 Lista! → Contactar a: $nombreCliente"
    }

    object EnEsperaRepuestos : EstadoPedidoMoto("Retraso", "Esperando accesorios adicionales") {
        override fun mostrarEstado() = "⏳ Notificación: Esperando partes adicionales"
    }
}

// ABSTRACCIÓN + POLIMORFISMO: interfaz con contrato genérico
interface SistemaSeguimientoMoto {
    val departamento: String
    fun actualizarEstado(estado: EstadoPedidoMoto): Boolean
}

// HERENCIA: implementaciones concretas del mismo contrato
class SeguimientoTaller : SistemaSeguimientoMoto {
    override val departamento = "Taller"
    override fun actualizarEstado(e: EstadoPedidoMoto): Boolean {
        if (e !is EstadoPedidoMoto.PreparacionConcesionario && e !is EstadoPedidoMoto.EnEsperaRepuestos) return false
        println("  [TALLER] → ${e.titulo}")
        return true
    }
}

class SeguimientoVentas : SistemaSeguimientoMoto {
    override val departamento = "Ventas"
    override fun actualizarEstado(e: EstadoPedidoMoto): Boolean {
        if (e !is EstadoPedidoMoto.ListaParaEntrega && e !is EstadoPedidoMoto.TramitePlacas) return false
        println("  [VENTAS] → ${e.titulo}")
        return true
    }
}

// ENCAPSULAMIENTO: la lista de sistemas es privada
class CoordinadorEntregas(private val sistemas: List<SistemaSeguimientoMoto>) {

    fun procesarEstado(estado: EstadoPedidoMoto) {
        println(estado.mostrarEstado())  // POLIMORFISMO: cada tipo formatea distinto
        val exito = sistemas.any { it.actualizarEstado(estado) }
        if (!exito) println("  ⚠️ Sin departamento asignado para este estado")
        println()
    }
}

fun main() {
    val coordinador = CoordinadorEntregas(listOf(SeguimientoTaller(), SeguimientoVentas()))

    listOf(
        EstadoPedidoMoto.PreparacionConcesionario("Pedro", "Instalación de sliders y revisión de líquidos"),
        EstadoPedidoMoto.TramitePlacas("Gestoría Express"),
        EstadoPedidoMoto.ListaParaEntrega("Ana Pérez"),
        EstadoPedidoMoto.EnEsperaRepuestos
    ).forEach { coordinador.procesarEstado(it) }
}
