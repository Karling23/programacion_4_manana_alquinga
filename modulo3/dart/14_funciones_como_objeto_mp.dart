int aplicarBono(int precio)  => precio - 500;
int aplicarImpuestoLujo(int precio) => precio + (precio * 0.15).toInt();

void main() {
  // La variable 'operacionVenta' tiene tipo: int Function(int)
  int Function(int) operacionVenta;

  operacionVenta = aplicarBono;
  print(operacionVenta(5000));     // 4500

  operacionVenta = aplicarImpuestoLujo;
  print(operacionVenta(5000));     // 5750

  // Lista de funciones
  final ajustesPrecio = <int Function(int)>[aplicarBono, aplicarImpuestoLujo];
  for (final fn in ajustesPrecio) {
    print(fn(6000));         
  }
}
