import 'package:flutter/material.dart';
import '../models/servidor_ssh_mp.dart';

class TarjetaServidorGrid extends StatelessWidget {
  final Moto         servidor; // Representa una Moto
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const TarjetaServidorGrid({
    super.key,
    required this.servidor,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fila superior: icono + favorito
            Row(children: [
              Icon(
                Icons.motorcycle,
                color: servidor.disponible ? cs.primary : cs.outline,
                size: 18,
              ),
              const Spacer(),
              GestureDetector(
                onTap: onFavorito,
                child: Icon(
                  servidor.favorito ? Icons.star : Icons.star_border,
                  color: servidor.favorito ? Colors.amber : cs.outline,
                  size: 18,
                ),
              ),
            ]),
            const SizedBox(height: 6),

            // Modelo y Marca
            Text(
              servidor.modelo,
              style: text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${servidor.marca} · ${servidor.cilindrada} cc',
              style: text.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),

            const Spacer(),

            // Fila inferior: disponibilidad + tipo + eliminar
            Row(children: [
              if (servidor.disponible)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(Icons.check_circle, size: 12, color: cs.primary),
                ),
              Expanded(
                child: Text(
                  '${servidor.tipo} · ${servidor.color}',
                  style: text.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: onEliminar,
                child: Icon(Icons.delete_outline, size: 16, color: cs.error),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}