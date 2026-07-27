fun main() {
    println("Tipo de examen (laboratorio / imagen):")
    val tipoExamen = readLine()?.trim()?.lowercase()

    if (tipoExamen == "laboratorio") {
        println("Debe estar en ayunas mínimo 8 horas antes del examen.")
    } else if (tipoExamen == "imagen") {
        println("No necesita ayuno, pero debe retirar objetos metálicos.")
    } else {
        println("Tipo de examen no válido.")
    }
}