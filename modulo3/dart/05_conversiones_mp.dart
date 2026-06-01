void main() {
  // Conversiones numéricas en ventas
  int    precioBase  = 5000;
  double precioDouble = precioBase.toDouble();   // 5000.0
  String textoPrecio   = precioBase.toString();   // "5000"

  // String -> número (Desde un input de formulario de venta)
  int    cilindrada = int.parse('250');       // 250
  double interes = double.parse('1.15');   // 1.15

  // Conversión segura (no lanza excepción al leer datos)
  int?    anioFabricacion = int.tryParse('2023a');   // null
  double? presupuesto = double.tryParse('8500.50'); // 8500.50

  // Verificar tipo con is
  Object cil = 'Seiscientos';
  if (cil is String) {
    print('Descripción cilindrada: ${cil.length} caracteres');  // smart cast - ya es String
  }

  // Cast explícito con as
  Object marcaObj = 'Honda';
  String marcaStr = marcaObj as String;

  // Comprobar nulabilidad
  String? colorMoto = null;
  int letrasColor = colorMoto?.length ?? 0;
  print('Letras del color: $letrasColor');  // 0

  // Números especiales en cálculos
  print(double.infinity);     // Infinity (Velocidad de una superbike teórica)
  print(double.nan);          // NaN
  print(double.maxFinite);    // 1.7976931348623157e+308
}
