import 'dart:io';

void main() {
  int totalCajas = 0;
  int totalEmpleados = 0;
  bool continuar = true;

  while (continuar) {
    stdout.write('Ingrese la cantidad de cajas empacadas por empleado (0 para salir): ');
    String? input = stdin.readLineSync();
    
    if (input == null) continue;
    int? cajas = int.tryParse(input);

    if (cajas == null) {
      continue;
    }

    if (cajas == 0) {
      continuar = false;
    } else if (cajas > 0) {
      if (cajas < 20) {
        print('Rendimiento bajo');
      } else if (cajas >= 20 && cajas <= 50) {
        print('Rendimiento normal');
      } else {
        print('Rendimiento excelente');
      }

      totalCajas += cajas;
      totalEmpleados++;
    }
  }

  print('\n--- Resultados Finales ---');
  print('Total de cajas empacadas: $totalCajas');
  print('Cantidad de empleados registrados: $totalEmpleados');
  
  if (totalEmpleados > 0) {
    double promedio = totalCajas / totalEmpleados;
    print('Promedio de cajas por empleado: ${promedio.toStringAsFixed(2)}');
  } else {
    print('Promedio de cajas por empleado: 0.00');
  }
}