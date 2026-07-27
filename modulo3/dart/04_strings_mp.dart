void main() {
  final marca = 'Yamaha';
  final modelo = 'MT-03';
  final precio = 5500;

  // Interpolación con $ (igual que en Kotlin)
  print('Moto disponible: $marca');                    // Moto disponible: Yamaha

  // Expresión con ${ }
  print('${marca.toUpperCase()} ${modelo.toUpperCase()} en oferta por \$${precio - 500}');

  // String multilinea con triple comillas
  final fichaTecnica = '''
Marca:   $marca
Modelo:  $modelo
Precio:  \$$precio
Premium: ${precio >= 5000 ? 'Sí' : 'No'}
  ''';
  print(fichaTecnica);

  // Raw string - ignora el escape y la interpolación
  final rutaManual = r'C:\Manuales\Motos\MT03.pdf';  // el \ no se interpreta
  print(rutaManual);

  // Concatenación (menos idiomático - preferir interpolación)
  final anuncio = 'Gran oferta: ' + marca + ' ' + modelo + '!';
  print(anuncio);

  // Métodos útiles de String
  print('suzuki'.toUpperCase());            // SUZUKI
  print('  Honda CBR  '.trim());            // Honda CBR
  print('Kawasaki Ninja'.contains('Ninja'));// true
  print('Yamaha R1'.replaceAll('1', '6'));  // Yamaha R6
  print('Casco,Guantes,Botas'.split(','));  // [Casco, Guantes, Botas]
  print('Deportiva'.substring(0, 3));       // Dep
  print('Custom'.startsWith('Cus'));        // true
  print('125'.padLeft(4, '0'));             // 0125
}
