class CajaRegistradora {
  final String sucursal;
  double _fondos;  // privado - nadie lo modifica directamente

  CajaRegistradora(this.sucursal, double fondoInicial)
      : _fondos = fondoInicial;

  // Getter - lectura permitida, escritura no
  double get fondosDisponibles => _fondos;

  // Los únicos caminos para modificar _fondos
  void registrarVenta(double monto) {
    if (monto <= 0) throw ArgumentError('El monto de venta debe ser positivo');
    _fondos += monto;
    print('Venta de \$$monto. Nuevos fondos en $sucursal: \$$_fondos');
  }

  void pagarProveedor(double monto) {
    if (monto <= 0)      throw ArgumentError('El monto de pago debe ser positivo');
    if (monto > _fondos) throw StateError('Fondos insuficientes en caja');
    _fondos -= monto;
    print('Pago de \$$monto. Nuevos fondos en $sucursal: \$$_fondos');
  }
}

void main() {
  final caja = CajaRegistradora('Sucursal Centro', 1000.0);

  caja.registrarVenta(5000.0);  // Venta de moto
  caja.pagarProveedor(1500.0);  // Pago de repuestos
  print(caja.fondosDisponibles);      // 4500.0

  // caja._fondos = 999999;  // ERROR - privado, Dart no lo permite
}
