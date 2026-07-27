import 'dart:io';

void main() {
    int totalhoras = 0
    int totalpacientes = 0 
    int doctores = 0

    while (horas > 0) {
        print("Ingrese la cantidad de horas (0 para salir): ");
        String? input = stdin.readLineSync();

        if (horas == 0) {
        continuar = false;
        } else if (horas > 0) {
        if (horas < 20) {
            print('Atencion lenta');
        } else if (horas >= 20 && horas <= 50) {
            print('Atencion normal');
        } else {
            print('atencion rapida');
        }

        totalhoras += horas;
        totalpacientes++;
        }
    }

    print('\n--- Resultados Finales ---');  
    print('Total de cajas empacadas: $totalhoras');   
    print('Cantidad de empleados registrados: $totalpacientes');  

    if (totalpacientes > 0) {
        double promedio = totalhoras / totalpacientes;
        print('Promedio de pacientes por doctor: ${promedio.toStringAsFixed(2)}');
    } else {
        print('Promedio de pacientes por doctor: 0.00');
    }
}