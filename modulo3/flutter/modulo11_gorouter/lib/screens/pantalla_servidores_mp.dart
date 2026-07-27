import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/servidor_ssh_mp.dart';

class PantallaServidores extends StatelessWidget {
  const PantallaServidores({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final servidores = servidoresSimulados;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Motos en Exhibición'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
        ),
      ),
      body: ListView.builder(
        itemCount:   servidores.length,
        itemBuilder: (context, i) => ListTile(
          leading: const Icon(Icons.motorcycle, color: Colors.orange),
          title:   Text('${servidores[i].ip} ${servidores[i].nombre}'),
          subtitle: Text('${servidores[i].puerto} cc · ${servidores[i].ssl ? "Disponible" : "Agotada"}'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            context.push('/servidores/${servidores[i].id}', extra: servidores[i]);
          },
        ),
      ),
    );
  }
}
