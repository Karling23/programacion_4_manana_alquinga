fun main() {
    println("Controles de flujo when - con bloque de codigos")

    println("Nombre del paciente:")
    val nombrePaciente = readLine()?.trim().lowercase() ?: "Sin identidicacion"
    println("Tiene nivel alerta (critico/urgente/leve)")
    val nivel = readLine()?.trim()?.lowercase() ?:""

    when (nivel) {
        "critico" -> {
            println("ALERTA CRITICA: Paciente $nombrePaciente")
            println("Llamar al medico de guardia")
            println("Activar protocolo de urgencia critica")
        }
        "urgente" -> {
            println("URGENTE: Paciente $nombrePaciente")
            println("Priorizar en la zala de espera")
            println("Revaluar en 15 minutos")
        }
        "moderado" -> println("Moderado: paciente: $nombrePaciente")
        "leve" -> println("Leve: paciente: $nombrePaciente continuar esperando")
        else -> println("Nivel no reconocido")
    }
}