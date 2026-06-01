void main() {
  // while - comprueba la condición ANTES de ejecutar
  int accesorios = 0;
  double presupuesto = 500.0;  // Presupuesto para extras

  while (presupuesto > 0) {
    final costoAccesorio = presupuesto > 150.0 ? 150.0 : presupuesto;
    accesorios++;
    presupuesto -= costoAccesorio;
    print('Accesorio $accesorios comprado: \$$costoAccesorio (Presupuesto restante: \$$presupuesto)');
  }

  // do-while - ejecuta AL MENOS UNA VEZ antes de comprobar
  int intentosArranque = 0;
  bool motorEncendido = false;

  do {
    intentosArranque++;
    print('Intento de encendido de moto #$intentosArranque...');
    // Simular que enciende en el 3er intento
    if (intentosArranque == 3) motorEncendido = true;
  } while (!motorEncendido && intentosArranque < 5);

  print(motorEncendido
      ? 'Motor encendido exitosamente tras $intentosArranque intentos'
      : 'Batería descargada o fallo de motor');
}
