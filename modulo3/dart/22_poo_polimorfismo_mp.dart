// Reusamos la jerarquía de Moto del ejercicio anterior
abstract class PromocionMoto {
  String get nombrePromocion;
  double calcularDescuento();
}

class BonoNavideno extends PromocionMoto {
  final double precioBase;
  BonoNavideno(this.precioBase);
  @override String get nombrePromocion => 'Bono Navideño';
  @override double calcularDescuento() => precioBase * 0.10; // 10%
}

class DescuentoFijo extends PromocionMoto {
  final double montoFijo;
  DescuentoFijo(this.montoFijo);
  @override String get nombrePromocion => 'Descuento Fijo de Tienda';
  @override double calcularDescuento() => montoFijo;
}

class CuponFabricante extends PromocionMoto {
  final double precioBase;
  CuponFabricante(this.precioBase);
  @override String get nombrePromocion => 'Cupón Directo del Fabricante';
  @override double calcularDescuento() => precioBase * 0.05 + 100; // 5% + 100 fijos
}

// POLIMORFISMO: una sola función trabaja con cualquier PromocionMoto
void imprimirBeneficio(PromocionMoto promo) {
  print('${promo.nombrePromocion}: ahorro de \$${promo.calcularDescuento().toStringAsFixed(2)}');
}

void main() {
  double precioMoto = 5000.0;
  final promos = <PromocionMoto>[
    BonoNavideno(precioMoto),
    DescuentoFijo(600),
    CuponFabricante(precioMoto),
  ];

  // Misma llamada - comportamiento diferente según el tipo real
  for (final p in promos) {
    imprimirBeneficio(p);
  }

  // Promoción con mayor descuento - POLIMORFISMO con reduce
  final mejor = promos.reduce((a, b) => a.calcularDescuento() > b.calcularDescuento() ? a : b);
  print('\nPromoción que más conviene al cliente: ${mejor.nombrePromocion}');
}
