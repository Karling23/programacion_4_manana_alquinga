import 'package:flutter/material.dart';
import '../models/servidor_ssh_mp.dart';

class FilaServidor extends StatelessWidget {
  final dynamic servidor; // Puede ser Moto o MotoAccesorio
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const FilaServidor({
    super.key,
    required this.servidor,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final bool estaDisponible = _verificarDisponibilidad(servidor);
    final bool esFavorito = servidor.favorito ?? false;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: estaDisponible
            ? cs.primaryContainer
            : cs.errorContainer,
        child: Icon(
          (servidor is Moto) ? Icons.motorcycle : Icons.build,
          color: estaDisponible ? cs.onPrimaryContainer : cs.onErrorContainer,
        ),
      ),
      title: Text(
        (servidor is Moto) ? '${servidor.marca} ${servidor.modelo}' : servidor.nombre,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        (servidor is Moto)
            ? '${servidor.tipo} · ${servidor.cilindrada} cc · ${servidor.color}'
            : 'Compatible con: ${servidor.marcaCompatibilidad} · \$${servidor.precio} USD',
        style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              esFavorito ? Icons.star : Icons.star_border,
              color: esFavorito ? Colors.amber : cs.outline,
            ),
            onPressed:     onFavorito,
            visualDensity: VisualDensity.compact,
            tooltip:       esFavorito ? 'Quitar de favoritos' : 'Agregar a favoritos',
          ),
          IconButton(
            icon:          Icon(Icons.delete_outline, color: cs.error),
            onPressed:     onEliminar,
            visualDensity: VisualDensity.compact,
            tooltip:       'Eliminar',
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }

  bool _verificarDisponibilidad(dynamic objeto) {
    try {
      if (objeto is Moto) {
        return objeto.disponible;
      }
      return true; // Accesorios por defecto disponibles
    } catch (_) {
      return false;
    }
  }
}