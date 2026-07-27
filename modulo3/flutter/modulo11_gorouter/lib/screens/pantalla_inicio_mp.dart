import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('MotoVentas Premium'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.motorcycle, size: 80, color: cs.primary),
            const SizedBox(height: 16),
            const Text('Catálogo de Motocicletas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Las mejores marcas de alta cilindrada en un solo lugar',
                style: TextStyle(color: cs.onSurfaceVariant, fontSize: 14)),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.go('/servidores'), // Mantiene la ruta configurada en el router
              icon:  const Icon(Icons.two_wheeler),
              label: const Text('Ver Catálogo'),
            ),
          ],
        ),
      ),
    );
  }
}
