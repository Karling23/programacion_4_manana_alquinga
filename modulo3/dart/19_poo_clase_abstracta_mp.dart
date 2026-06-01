// abstract class define el contrato - QUÉ puede hacer cualquier Moto
abstract class MotoVehiculo {
  String get modelo;
  double calcularPrecioFinal();     // cada moto lo implementa a su manera
  double obtenerConsumo();

  // Método concreto construido sobre la abstracción
  void describir() {
    print('Moto: $modelo - Precio Final: \$${calcularPrecioFinal().toStringAsFixed(2)}, '
          'Consumo: ${obtenerConsumo().toStringAsFixed(1)} L/100km');
  }
}

// Implementaciones concretas - el CÓMO es específico de cada clase
class MotoUrbana extends MotoVehiculo {
  final String nombreModelo;
  final double precioBase;
  MotoUrbana(this.nombreModelo, this.precioBase);

  @override String get modelo => nombreModelo;
  @override double calcularPrecioFinal() => precioBase + 100.0; // Gastos de placa bajos
  @override double obtenerConsumo() => 2.5;
}

class MotoSuperbike extends MotoVehiculo {
  final String nombreModelo;
  final double precioBase;
  MotoSuperbike(this.nombreModelo, this.precioBase);

  @override String get modelo => '$nombreModelo (Premium)';
  @override double calcularPrecioFinal() => precioBase * 1.15; // 15% de impuestos de lujo
  @override double obtenerConsumo() => 7.5;
}

void main() {
  final catalogo = <MotoVehiculo>[MotoUrbana('Honda Navi', 1500.0), MotoSuperbike('Yamaha R1', 18000.0)];
  for (final moto in catalogo) {
    moto.describir();  // no importa qué tipo de MotoVehiculo es
  }
}
