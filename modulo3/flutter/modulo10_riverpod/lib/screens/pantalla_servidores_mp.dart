// lib/screens/pantalla_servidores_mp.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/servidor_ssh_mp.dart';
import '../providers/servidores_provider_mp.dart';

class PantallaServidores extends ConsumerWidget {
  const PantallaServidores({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servidores = ref.watch(motosProvider);
    final cs         = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Motos en Stock (${servidores.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: servidores.isEmpty
          ? const Center(child: Text('Sin motos disponibles'))
          : ListView.separated(
              itemCount:        servidores.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (context, i) {
                final s = servidores[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: s.disponible
                        ? Colors.orange.shade50
                        : Colors.grey.shade100,
                    child: Icon(Icons.motorcycle,
                        color: s.disponible ? Colors.orange : Colors.grey),
                  ),
                  title:    Text('${s.marca} ${s.modelo}',
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('${s.cilindrada} cc · ${s.disponible ? "Disponible" : "Agotada"}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          s.favorito ? Icons.star : Icons.star_border,
                          color: s.favorito ? Colors.amber : null,
                        ),
                        onPressed: () => ref
                            .read(motosProvider.notifier)
                            .toggleFavorito(s.id),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.red),
                        onPressed: () => ref
                            .read(motosProvider.notifier)
                            .eliminar(s.id),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString().substring(8);
          ref.read(motosProvider.notifier).agregar(
            Moto(
              id:     id,
              modelo: 'F $id',
              marca:  'BMW',
              cilindrada: 850,
              disponible: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}