void main() {
  // for con índice - cuando necesitas el número de iteración
  for (int i = 0; i < 5; i++) {
    print('Moto en exhibición número $i');
  }

  // for con paso distinto (ej. revisiones de mantenimiento por km)
  for (int km = 0; km <= 10000; km += 2500) {
    print('Mantenimiento programado a los: $km km');
  }

  // for decreciente (cuenta regresiva para entregar moto nueva)
  for (int i = 5; i >= 1; i--) {
    print('Días para entregar su moto nueva: $i');
  }
}
