import 'package:flutter/material.dart';

class PantallaMetricas extends StatelessWidget {
  const PantallaMetricas({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: const Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.bar_chart, size: 56, color: Colors.orange),
        SizedBox(height: 8),
        Text('Métricas de Venta de Motos', style: TextStyle(fontSize: 18)),
      ],
    )),
  );
}
