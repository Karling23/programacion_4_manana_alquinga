// lib/models/metrica_servidor_mp.dart
class MetricaMoto {
  final String moto;
  final int    stock;
  final double calificacion;
  final int    interesados;
  final double precio;

  const MetricaMoto({
    required this.moto,
    required this.stock,
    required this.calificacion,
    required this.interesados,
    required this.precio,
  });
}