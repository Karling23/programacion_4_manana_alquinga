// lib/screens/pantalla_busqueda_mp.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/servidores_provider_mp.dart';

class PantallaBusqueda extends ConsumerWidget {
  const PantallaBusqueda({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servidores = ref.watch(motosFiltradosProvider);
    final busqueda   = ref.watch(busquedaMotosProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Buscar Motocicletas')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: SearchBar(
            hintText: 'Buscar por modelo o marca...',
            leading:  const Icon(Icons.search),
            trailing: busqueda.isNotEmpty
                ? [IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () =>
                        ref.read(busquedaMotosProvider.notifier).state = '',
                  )]
                : null,
            onChanged: (v) =>
                ref.read(busquedaMotosProvider.notifier).state = v,
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
        Expanded(
          child: servidores.isEmpty
              ? const Center(child: Text('Sin resultados'))
              : ListView.builder(
                  itemCount:   servidores.length,
                  itemBuilder: (_, i) => ListTile(
                    leading: const Icon(Icons.motorcycle, color: Colors.orange),
                    title:    Text('${servidores[i].marca} ${servidores[i].modelo}'),
                    subtitle: Text('${servidores[i].cilindrada} cc'),
                  ),
                ),
        ),
      ]),
    );
  }
}