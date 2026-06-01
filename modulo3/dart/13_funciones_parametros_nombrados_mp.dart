// required - el parámetro es obligatorio
// sin required - es opcional (necesita valor por defecto o ser nullable)
void configurarEntregaMoto({
  required String modelo,
  required String sucursal,
  bool   conLlenadoTanque = true,
  int    diasEspera = 3,
}) {
  final gasolina = conLlenadoTanque ? 'Tanque lleno' : 'Tanque de reserva';
  print('Preparando $modelo para entrega en $sucursal ($gasolina, en $diasEspera días)');
}

void main() {
  // Los nombrados pueden pasarse en cualquier orden
  configurarEntregaMoto(
    modelo:       'Yamaha R1',
    sucursal:     'Norte',
    conLlenadoTanque: false,
    diasEspera: 1,
  );

  // Solo los obligatorios - los opcionales toman su valor por defecto
  configurarEntregaMoto(
    modelo:   'Honda Navi',
    sucursal: 'Sur',
  );
}
