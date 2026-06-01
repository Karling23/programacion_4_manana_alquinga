void main() {
  String tipoMoto = 'Naked';

  switch (tipoMoto) {
    case 'Deportiva':
      print('Ideal para pista');
    case 'Naked':
      print('Estilo urbano, sin carenado');
    case 'Scooter':
      print('Económica y para ciudad');
    case 'Custom':
      print('Para viajes largos con estilo');
    case 'Adventure':
      print('Para asfalto y tierra');
    default:
      print('Categoría de moto desconocida');
  }

  String descripcion = switch (tipoMoto) {
    'Deportiva' => 'Aerodinámica y veloz',
    'Naked'     => 'Ágil y agresiva',
    'Scooter'   => 'Automática y práctica',
    'Custom'    => 'Cómoda y clásica',
    'Adventure' => 'Alta y todoterreno',
    _           => 'Categoría no definida',  // _ es el caso por defecto
  };
  print(descripcion);

  int cilindrada = 250;

  // Múltiples valores en una rama con ||
  String categoriaCC = switch (cilindrada) {
    110 || 125 || 150       => 'Baja Cilindrada (Urbana)',
    200 || 250 || 300       => 'Media-Baja Cilindrada',
    400 || 500 || 600 || 650 => 'Media Cilindrada',
    800 || 900 || 1000      => 'Alta Cilindrada',
    _                       => 'Superbike o desconocida',
  };

  print(categoriaCC);  // Media-Baja Cilindrada

  // Guards - condición adicional con 'when'
  double precio = 12000.0;

  String presupuesto = switch (precio) {
    double p when p >= 15000.0 => '💵 PREMIUM - Ofrecer financiamiento VIP',
    double p when p >= 8000.0  => '💰 GAMA ALTA - Mostrar catálogo exclusive',
    double p when p >= 4000.0  => '🪙 GAMA MEDIA - Opciones calidad-precio',
    double p when p >= 1500.0  => '🛒 ECONÓMICA - Ideal primer moto',
    _                          => '🏷️ USADA/BÁSICA - Consultar inventario outlet',
  };

  print(presupuesto);
}
