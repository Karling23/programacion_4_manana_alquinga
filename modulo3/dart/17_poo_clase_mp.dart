class MotoInventario {
  // 1. Propiedades
  final String vin;
  final String modelo;
  String       color;
  bool         _vendida = false;  // _ indica uso interno

  // 2. Constructor nombrado con parámetros nombrados
  MotoInventario({
    required this.vin,
    required this.modelo,
    required this.color,
  });

  // 3. Getter - propiedad derivada, solo lectura
  bool   get estaVendida => _vendida;
  String get estado      => _vendida ? 'Vendida' : 'Disponible en piso';

  // 4. Setter - escritura controlada
  set confirmarVenta(bool valor) {
    _vendida = valor;
    print('$modelo: ${valor ? "Se ha marcado como vendida" : "Se ha devuelto al inventario"}');
  }

  // 5. Métodos
  void reservar() {
    _vendida = true;
    print('$modelo reservada con VIN $vin');
  }

  void cancelarReserva() {
    _vendida = false;
    print('$modelo nuevamente disponible');
  }

  String resumen() => 'VIN: $vin | Modelo: $modelo | Color: $color | Estado: $estado';

  // 6. toString
  @override
  String toString() => 'MotoInventario($modelo, $color, $estado)';
}

void main() {
  // Crear una instancia
  final moto1 = MotoInventario(
    vin:     'VIN-999888',
    modelo:  'Yamaha MT-03',
    color:   'Negro Mate',
  );

  // Usar sus métodos y propiedades
  moto1.reservar();
  print(moto1.estado);       // Vendida
  print(moto1.resumen());
  print(moto1);              // llama toString() automáticamente

  moto1.confirmarVenta = false;  // usa el setter
  print(moto1.estaVendida);   // false
}
