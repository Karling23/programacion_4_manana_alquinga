import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/servidor_ssh_mp.dart';

class PantallaServidoresFiltro extends StatelessWidget {
  final bool soloSSL; // Actúa como filtro de Disponibles
  const PantallaServidoresFiltro({super.key, this.soloSSL = false});

  @override
  Widget build(BuildContext context) {
    final filtrados = soloSSL
        ? servidoresSimulados.where((s) => s.ssl).toList()
        : servidoresSimulados;

    return Scaffold(
      appBar: AppBar(
        title:   Text('Catálogo${soloSSL ? ' (Disponibles)' : ''}'),
        actions: [
          IconButton(
            icon:    Icon(soloSSL ? Icons.check_circle : Icons.all_inclusive),
            tooltip: soloSSL ? 'Ver todas' : 'Solo Disponibles',
            onPressed: () => soloSSL
                ? context.go('/servidores')
                : context.go('/servidores?soloSSL=true'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount:   filtrados.length,
        itemBuilder: (context, i) {
          final s = filtrados[i];
          return ListTile(
            leading: Icon(Icons.motorcycle, color: s.ssl ? Colors.orange : Colors.grey),
            title:   Text('${s.ip} ${s.nombre}'),
            subtitle: Text('${s.puerto} cc · ${s.ssl ? "Disponible" : "Agotada"}'),
            onTap: () => context.push(
              '/servidores/${s.id}',
              extra: s,   
            ),
          );
        },
      ),
    );
  }
}
