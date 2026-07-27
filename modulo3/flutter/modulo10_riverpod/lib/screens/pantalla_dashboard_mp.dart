// lib/screens/pantalla_dashboard_mp.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'pantalla_servidores_mp.dart';
import 'pantalla_metricas_mp.dart';

final indiceTabProvider = StateProvider<int>((ref) => 0);

class PantallaDashboard extends ConsumerWidget {
  const PantallaDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indice = ref.watch(indiceTabProvider);

    return Scaffold(
      body: switch (indice) {
        0 => const PantallaServidores(),
        1 => const PantallaMetricas(),
        _ => const PantallaServidores(),
      },
      bottomNavigationBar: NavigationBar(
        selectedIndex:         indice,
        onDestinationSelected: (i) =>
            ref.read(indiceTabProvider.notifier).state = i,
        destinations: const [
          NavigationDestination(
            icon:         Icon(Icons.motorcycle_outlined),
            selectedIcon: Icon(Icons.motorcycle),
            label:        'Motos',
          ),
          NavigationDestination(
            icon:         Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label:        'Métricas',
          ),
        ],
      ),
    );
  }
}