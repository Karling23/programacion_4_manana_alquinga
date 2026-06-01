void main() {
  // Tipo no-nullable - NUNCA puede ser null
  String marca = 'Yamaha';
  // marca = null;       // ERROR de compilación

  // Tipo nullable - puede ser null (añadir ?)
  String? colorPersonalizado = null;   // OK
  colorPersonalizado = 'Negro Mate';   // OK

  // Operadores de null safety
  String? accesoriosOpcionales;

  // ?. - safe call
  print(accesoriosOpcionales?.length);      // null - no lanza excepción

  // ?? - operador Elvis
  String extras = accesoriosOpcionales ?? 'Sin accesorios extra';
  print(extras);           // Sin accesorios extra

  // ! - non-null assertion - úsalo con precaución
  // String extrasSeguro = accesoriosOpcionales!;  // lanza error si es null

  // Null check con if
  if (colorPersonalizado != null) {
    print('Color a pintar: $colorPersonalizado de longitud ${colorPersonalizado.length}');   // smart cast
  }

  // late - inicialización diferida
  late String chasisValidado;
  chasisValidado = 'VIN-9876543210';           // debe asignarse antes de usar
  print('Chasis: $chasisValidado');
}
