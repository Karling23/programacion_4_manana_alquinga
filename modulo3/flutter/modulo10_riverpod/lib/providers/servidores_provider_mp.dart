// lib/providers/servidores_provider_mp.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart' show StateProvider;
import '../models/servidor_ssh_mp.dart';

class MotosNotifier extends Notifier<List<Moto>> {
  @override
  List<Moto> build() => [
    Moto(id:'1', modelo:'YZF-R1',  marca:'Yamaha',   cilindrada:998,   disponible:true,  favorito:true),
    Moto(id:'2', modelo:'Ninja H2', marca:'Kawasaki', cilindrada:998,   disponible:true),
    Moto(id:'3', modelo:'CBR1000RR',marca:'Honda',    cilindrada:1000,  disponible:false),
    Moto(id:'4', modelo:'Panigale V4', marca:'Ducati', cilindrada:1103,  disponible:true),
  ];

  void toggleFavorito(String id) {
    state = state.map((s) =>
        s.id == id
          ? Moto(id:s.id, modelo:s.modelo, marca:s.marca,
                 cilindrada:s.cilindrada, disponible:s.disponible,
                 favorito:!s.favorito)
          : s
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((s) => s.id != id).toList();
  }

  void agregar(Moto moto) {
    state = [...state, moto];
  }
}

final motosProvider = NotifierProvider<MotosNotifier, List<Moto>>(
  MotosNotifier.new,
);

final busquedaMotosProvider = StateProvider<String>((ref) => '');

final motosFiltradosProvider = Provider<List<Moto>>((ref) {
  final todos    = ref.watch(motosProvider);
  final busqueda = ref.watch(busquedaMotosProvider);

  if (busqueda.isEmpty) return todos;

  final q = busqueda.toLowerCase();
  return todos.where((s) =>
      s.modelo.toLowerCase().contains(q) || s.marca.toLowerCase().contains(q)
  ).toList();
});