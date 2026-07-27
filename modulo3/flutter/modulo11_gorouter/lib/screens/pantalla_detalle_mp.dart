import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/servidor_ssh_mp.dart';

class PantallaDetalle extends StatelessWidget {
  final String      id;
  final ServidorSSH? servidor; 

  const PantallaDetalle({super.key, required this.id, this.servidor});

  @override
  Widget build(BuildContext context) {
    final srv = servidor ??
        servidoresSimulados.where((s) => s.id == id).firstOrNull;

    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Ficha Técnica: ${srv?.ip ?? ""} ${srv?.nombre ?? id}'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: srv == null
          ? Center(child: Text('Motocicleta $id no encontrada'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Fila('Código ID', srv.id),
                  _Fila('Modelo',    srv.nombre),
                  _Fila('Marca',     srv.ip),
                  _Fila('Cilindrada', '${srv.puerto} cc'),
                  _Fila('Stock',     srv.ssl ? 'Disponible para entrega' : 'Agotada / Sobre pedido'),
                  const SizedBox(height: 24),
                  Row(children: [
                    OutlinedButton.icon(
                      onPressed: () => context.pop(),
                      icon:  const Icon(Icons.arrow_back),
                      label: const Text('Volver'),
                    ),
                    const SizedBox(width: 12),
                    FilledButton.icon(
                      onPressed: () => context.push('/servidores/${srv.id}/logs'), // mantiene logs
                      icon:  const Icon(Icons.description),
                      label: const Text('Garantía y Manual'),
                    ),
                  ]),
                ],
              ),
            ),
    );
  }
}

class _Fila extends StatelessWidget {
  final String label;
  final String valor;
  const _Fila(this.label, this.valor);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        SizedBox(
          width: 90,
          child: Text(label,
              style: TextStyle(color: cs.onSurfaceVariant,
                  fontWeight: FontWeight.w600, fontSize: 12)),
        ),
        Text(valor, style: const TextStyle(fontSize: 15)),
      ]),
    );
  }
}
