import 'dart:io';

void main(){
  print('Ingrese su nombre para la cotización de la moto: ');
  String? nombre = stdin.readLineSync();
  print('Hola, $nombre, bienvenido a MotoStore');
  
  print('Ingrese la cilindrada deseada (ej. 250):');
  int cilindrada = int.parse(stdin.readLineSync()!);
  print('Buscando motos de: ${cilindrada}cc');

  print('Ingrese su presupuesto:');
  double presupuesto = double.parse(stdin.readLineSync()!);
  print('Presupuesto registrado: \$$presupuesto'); 

  print('Ingrese el costo de la moto:');
  int costoMoto = int.parse(stdin.readLineSync()!);
  print('Ingrese el costo de matrícula y seguro:');
  int costoExtras = int.parse(stdin.readLineSync()!);
  int total = costoMoto + costoExtras;
  print('El precio total a pagar es: \$$total');
}
