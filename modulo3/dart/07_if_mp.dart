void main() {
  // Forma básica
  int kilometraje = 5000;

  if (kilometraje > 50000) {
    print('Moto de alto kilometraje, sugerir revisión completa');
  } else if (kilometraje > 10000) {
    print('Moto en uso regular, sugerir mantenimiento básico');
  } else {
    print('Moto seminueva');
  }

  // Operador ternario - para decisiones de una línea
  // condición ? valorSiVerdadero : valorSiFalso
  String estadoGarantia = kilometraje > 20000 ? 'Sin garantía de fábrica' : 'Con garantía activa';
  print(estadoGarantia);

  // null-aware con ternario
  String? clienteVIP;
  String descuento = clienteVIP != null ? 'Descuento aplicado a ${clienteVIP.toUpperCase()}' : 'Cliente regular';

  // Forma más concisa con ??
  String descuento2 = clienteVIP?.toUpperCase() ?? 'Cliente regular (sin descuento)';
  print(descuento2);  // Cliente regular

  String? nombreGarante;

  // Forma 2 - operador ?.
  print(nombreGarante?.length);  // null, sin excepción

  // Forma 3 - valor por defecto
  int caracteres = nombreGarante?.length ?? 0;
  print(caracteres);  // 0
}
