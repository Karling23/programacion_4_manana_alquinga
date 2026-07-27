// lib/models/servidor_ssh_mp.dart
class Moto {
  final String id;
  final String modelo;
  final String marca;
  final int    cilindrada;
  final bool   disponible;
  bool         favorito;

  Moto({
    required this.id,
    required this.modelo,
    required this.marca,
    required this.cilindrada,
    required this.disponible,
    this.favorito = false,
  });
}