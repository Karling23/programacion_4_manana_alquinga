// lib/models/servidor_ssh_mp.dart
class Moto {
  final String id;
  final String modelo;
  final String marca;
  final int    cilindrada;
  final String tipo;
  final String color;
  final bool   disponible;
  bool         favorito; 

  Moto({
    required this.id,
    required this.modelo,
    required this.marca,
    required this.cilindrada,
    required this.tipo,
    required this.color,
    required this.disponible,
    this.favorito = false,
  });
}

class MotoAccesorio {
  final String id;
  final String nombre;
  final String marcaCompatibilidad;
  final int    precio;
  final String descripcion;
  bool         favorito; 

  MotoAccesorio({
    required this.id,
    required this.nombre,
    required this.marcaCompatibilidad,
    required this.precio,
    required this.descripcion,
    this.favorito = false,
  });
}