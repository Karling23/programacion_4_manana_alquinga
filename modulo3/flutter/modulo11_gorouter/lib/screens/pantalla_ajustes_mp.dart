import 'package:flutter/material.dart';

class PantallaAjustes extends StatelessWidget {
  const PantallaAjustes({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: const Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.settings, size: 56, color: Colors.orange),
        SizedBox(height: 8),
        Text('Configuración de la Tienda', style: TextStyle(fontSize: 18)),
      ],
    )),
  );
}
