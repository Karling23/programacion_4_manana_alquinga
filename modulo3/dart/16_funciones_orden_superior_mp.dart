void main() {
  final preciosBase = [2900.0, 4950.0, 1500.0, 9990.0];

  // map devuelve un Iterable con cada elemento transformado
  final preciosConMatricula = preciosBase.map((p) => p + 250.0);
  print(preciosConMatricula.toList());
  // [3150.0, 5200.0, 1750.0, 10240.0]

  // map sobre Strings
  final marcas = ['yamaha', 'honda', 'suzuki'];
  final links = marcas.map((m) => 'https://motostore.com/$m');
  print(links.toList());

  //Where
  final cilindradas = [125, 250, 300, 600, 1000, 150];

  final motosAltas = cilindradas.where((cc) => cc > 400);
  print('Motos de alta cilindrada: ${motosAltas.toList()}');  // [600, 1000]

  final urbanas = cilindradas.where((cc) => cc >= 125 && cc <= 250);
  print('Motos urbanas: ${urbanas.toList()}');   // [125, 250, 150]

  //reduce y fold 
  final ventasDia = [1500.0, 2300.0, 980.0, 3100.0, 750.0];

  // reduce - combina todos los elementos en uno
  final totalVentas = ventasDia.reduce((acum, venta) => acum + venta);
  print('Total de ventas: \$${totalVentas.toStringAsFixed(2)}');  

  // fold - como reduce pero con valor inicial (más seguro con listas vacías)
  final metaSemanal = ventasDia.fold(1000.0, (acum, venta) => acum + venta); // 1000 de base inicial
  print('Total acumulado (fold): \$${metaSemanal.toStringAsFixed(2)}');

  // Encontrar el máximo
  final mayorVenta = ventasDia.reduce((a, b) => a > b ? a : b);
  print('Venta de mayor valor: \$$mayorVenta');  
}
