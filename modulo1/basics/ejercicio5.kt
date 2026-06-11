//El sistema registra el tipo de muestra de labatorio con un codigo: 1. sangre venosa, 2. orina, 3. Heces
//4. Hisopado nasofaringeo, 5. Biopsia. Usa when para imprimir el tipo de muestra y el tiempo estimado de procesamiento:
// sangre (4h), orina (2h), heces (24h), hisopado (6h), biopsia (72h)

fun main() {
    println("Ingrese el codigo del tipo de muestra de laboratorio (1-5):")
    val codigoMuestra = readLine()?.toIntOrNull()?:0

    val tipoMuestra = when (codigoMuestra) {
        1 -> "Tipo de muestra: Sangre venosa - Tiempo estimado de procesamiento: 4 horas."
        2 -> "Tipo de muestra: Orina - Tiempo estimado de procesamiento: 2 horas."
        3 -> "Tipo de muestra: Heces - Tiempo estimado de procesamiento: 24 horas."
        4 -> "Tipo de muestra: Hisopado nasofaringeo - Tiempo estimado de procesamiento: 6 horas."
        5 -> "Tipo de muestra: Biopsia - Tiempo estimado de procesamiento: 72 horas."
        else -> "Código de muestra no válido."
    }

    println("Tipo de muestra: $tipoMuestra")
}
