// Saludar Función sin parámetro
void saludarTienda() {
    print('¡Bienvenido a MotoStore!');
}

// Sumar sin parámetro
int obtenerCostoMatriculaFija() {
    return 150 + 50; // Trámites + Placas
}


// Sintaxis completa - preferida para funciones públicas
int calcularTotalConDescuento(int precioBase, int descuento) {
  return precioBase - descuento;
}

// Sintaxis de flecha - cuando el cuerpo es una sola expresión
int calcularValorCuotas(int total, int meses) => total ~/ meses;

// void - cuando no se devuelve nada
void imprimirSeparadorVenta(String titulo) {
  print('🏍️🏁 $titulo 🏍️🏁');
}

// Dart puede inferir el tipo de retorno, pero es buena práctica declararlo
// explícitamente en funciones públicas para mejorar la legibilidad.

// Con tipo explícito - recomendado
String formatearPrecioMoto(double precio) => '\$${precio.toStringAsFixed(2)}';

// Sin tipo - Dart infiere que retorna String
formatearPrecioMotoSinTipo(double precio) => '\$${precio.toStringAsFixed(2)}';

// El tercer parámetro es opcional - puede omitirse al llamar
String generarLinkCotizacion(String modelo, String plan, [int? plazoMeses]) {
  if (plazoMeses != null) {
    return 'https://motos.com/cotizar/$modelo?plan=$plan&meses=$plazoMeses';
  }
  return 'https://motos.com/cotizar/$modelo?plan=$plan';
}

// Con valor por defecto - evita el chequeo de null
String generarLinkCotizacionV2(String modelo, String plan, [int plazoMeses = 12]) {
  return 'https://motos.com/cotizar/$modelo?plan=$plan&meses=$plazoMeses';
}

void main() {
  saludarTienda();
  print('Costo matrícula: \$${obtenerCostoMatriculaFija()}');  
  print('Precio final: \$${calcularTotalConDescuento(5500, 300)}');          
  print('Mensualidad: \$${calcularValorCuotas(5200, 24)}');    
  imprimirSeparadorVenta('Resumen de Venta'); 

  print(formatearPrecioMoto(5200.5));  //$5200.50
  print(formatearPrecioMotoSinTipo(5200.5)); //5200.50

  print(generarLinkCotizacion('MT-03', 'premium'));          
  print(generarLinkCotizacion('CBR500R', 'estandar', 36));   
  print(generarLinkCotizacionV2('Gixxer', 'basico'));       
}
