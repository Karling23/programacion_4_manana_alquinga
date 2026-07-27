void main() {
  // Lambda asignada a una variable
  final cotizarSeguroBasico = (int valorMoto) => (valorMoto * 0.05).toInt();
  print(cotizarSeguroBasico(5000));  // 250

  // Lambda de cuerpo completo
  final calcularPrecioFinal = (double precio, double impuestoAdicional) {
    final extra = precio * (impuestoAdicional / 100);
    return precio + extra;
  };
  print(calcularPrecioFinal(6000.0, 10.0));  // 6600.0

  // Lambda en línea - pasada directamente como argumento
  final inventarioPrecios = [3500, 1500, 4200, 8000, 5500, 9000, 2000, 6500];
  inventarioPrecios.sort((a, b) => b.compareTo(a));  // orden descendente de precios
  print(inventarioPrecios);  
}
