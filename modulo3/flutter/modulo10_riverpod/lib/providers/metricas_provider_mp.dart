// lib/providers/metricas_provider_mp.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/metrica_servidor_mp.dart';

class MetricasMotosNotifier extends AsyncNotifier<List<MetricaMoto>> {
  @override
  Future<List<MetricaMoto>> build() => _fetch();

  Future<List<MetricaMoto>> _fetch() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      MetricaMoto(moto:'Yamaha YZF-R1', stock:5, calificacion:4.9, interesados:180, precio: 18500),
      MetricaMoto(moto:'Kawasaki Ninja H2', stock:2, calificacion:5.0, interesados:320, precio: 32500),
      MetricaMoto(moto:'Honda CBR1000RR', stock:4, calificacion:4.8, interesados:120, precio: 17800),
      MetricaMoto(moto:'Ducati Panigale V4', stock:3, calificacion:4.9, interesados:240, precio: 28500),
    ];
  }

  Future<void> recargar() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}

final metricasMotosProvider =
    AsyncNotifierProvider<MetricasMotosNotifier, List<MetricaMoto>>(
  MetricasMotosNotifier.new,
);