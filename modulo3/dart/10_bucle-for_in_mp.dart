void main() {
  final marcasMotos = ['Yamaha', 'Honda', 'Suzuki', 'Kawasaki', 'Ducati'];

  // for-in - la forma idiomática para recorrer listas
  for (final marca in marcasMotos) {
    print(marca);
  }

  // forEach con lambda - alternativa funcional
  marcasMotos.forEach((m) => print(m.toLowerCase()));

  // for-in sobre un Map (Inventario de sucursales)
  final inventario = {'Naked': 15, 'Deportiva': 5, 'Scooter': 22, 'Custom': 3};
  for (final entrada in inventario.entries) {
    print('Categoría ${entrada.key} -> Stock: ${entrada.value}');
  }

  // for-in sobre caracteres de un String (código VIN)
  for (final caracter in 'VIN987') {
    print('Revisando dígito VIN: $caracter');
  }
}
