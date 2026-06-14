void main() {
  // var - tipo inferido (como val en Kotlin)
  var marca = 'Yamaha';          // String
  var cilindraje = 150;          // int
  var precio = 2899.99;          // double
  var disponible = true;         // bool

  // Tipo explicito
  String modelo = 'FZ-S';
  int    stock  = 12;
  double iva    = 0.15;
  bool   nueva  = true;

  // final - no se puede reasignar (como val en Kotlin)
  final sucursal = 'Quito Norte';
  // sucursal = 'Guayaquil Centro';  // ERROR - final no se puede reasignar

  // const - constante en tiempo de compilacion (como const en Kotlin)
  const descuentoMaximo = 0.10;
  const matriculaBase   = 75.00;

  // Diferencia clave: final vs const
  final fechaVenta = DateTime.now();   // OK - se evalua en runtime
  // const fechaVenta = DateTime.now(); // ERROR - DateTime.now() no es constante de compilacion

  print('Moto $marca $modelo de $cilindraje cc cuesta \$$precio en $sucursal');
}
