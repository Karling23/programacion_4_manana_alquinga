//Una consulta puede estar en estado "agendada", "en curso" o "finalizada". 
//si esta en curso, comprueba ademas si lleva mas de 30 minutos (el usuario ingreso los minutos transcurridos).
//Si supera ese tiempo, imprime "Consulta extendida"

fun main() {
    println("Estado de la consulta (agendada / en curso / finalizada):")
    val estadoConsulta = readLine()?.trim()?.lowercase()

    println("Minutos transcurridos: ")
    val minutosTranscurridos = readLine()?.toIntOrNull() ?: 0

    if (estadoConsulta == "en curso") {
        if (minutosTranscurridos > 30) {
            println("Consulta extendida")
        } else {
            println("Consulta dentro del tiempo estimado")
        }
    } else if (estadoConsulta == "agendada") {
        println("La consulta está agendada, aún no ha comenzado.")
    } else if (estadoConsulta == "finalizada") {
        println("La consulta ha finalizado.")
    } else {
        println("Estado de consulta no válido.")
    }

}