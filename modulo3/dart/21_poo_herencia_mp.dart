// Clase base - comportamiento y datos comunes
class MotoVehiculo {
  final String marca;
  final int    anioFabricacion;

  MotoVehiculo(this.marca, this.anioFabricacion);

  // Método que cada subclase debe especializar
  String arrancar() => '...';

  // Método común - reutilizado sin cambios por todas las subclases
  void mostrarFicha() {
    print('Moto marca $marca del año $anioFabricacion, sonido: ${arrancar()}');
  }
}

// HERENCIA: Deportiva y Scooter reutilizan MotoVehiculo y lo especializan
class Deportiva extends MotoVehiculo {
  Deportiva(super.marca, super.anioFabricacion);

  @override
  String arrancar() => '¡Brrrumm! (Escape Racing)';

  void activarModoPista() => print('$marca en Modo Pista 🔥');
}

class ScooterUrbana extends MotoVehiculo {
  ScooterUrbana(super.marca, super.anioFabricacion);

  @override
  String arrancar() => 'Sshhh... (Motor silencioso)';

  void guardarCasco() => print('Guardando casco en el compartimento de $marca 🪖');
}

void main() {
  final deportiva = Deportiva('Yamaha', 2023);
  final scooter  = ScooterUrbana('Honda', 2024);

  deportiva.mostrarFicha();  // Moto marca Yamaha del año 2023, sonido: ¡Brrrumm! (Escape Racing)
  scooter.mostrarFicha();   // Moto marca Honda del año 2024, sonido: Sshhh... (Motor silencioso)

  deportiva.activarModoPista();
  scooter.guardarCasco();
}
