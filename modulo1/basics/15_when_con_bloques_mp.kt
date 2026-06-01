fun main() {
    println("Controles de flujo when - con bloque de codigos en Taller de Motos")

    println("Nombre del cliente:")
    val nombreCliente = readLine()?.trim()?.lowercase() ?: "Sin identificacion"
    println("Prioridad del servicio (urgente/mantenimiento/revision)")
    val prioridad = readLine()?.trim()?.lowercase() ?:""

    when (prioridad) {
        "urgente" -> {
            println("PRIORIDAD URGENTE: Cliente $nombreCliente (Moto varada)")
            println("Asignar mecánico disponible inmediatamente")
            println("Generar orden de ingreso express")
        }
        "mantenimiento" -> {
            println("MANTENIMIENTO PROGRAMADO: Cliente $nombreCliente")
            println("Asignar a la cola de servicios del día")
            println("Revisar repuestos necesarios en bodega")
        }
        "revision" -> println("REVISIÓN GENERAL: Cliente: $nombreCliente")
        else -> println("Tipo de prioridad no reconocido")
    }
}
