import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/metrica_servidor_mp.dart';
import '../providers/metricas_provider_mp.dart';

class PantallaMetricas extends ConsumerWidget {
  const PantallaMetricas({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metricasAsync = ref.watch(metricasMotosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Métricas de Venta y Stock'),
        actions: [
          IconButton(
            icon:    const Icon(Icons.refresh),
            tooltip: 'Recargar',
            onPressed: () =>
                ref.read(metricasMotosProvider.notifier).recargar(),
          ),
        ],
      ),
      body: metricasAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 8),
              Text('Error: $e'),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: () =>
                    ref.read(metricasMotosProvider.notifier).recargar(),
                icon:  const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        data: (metricas) => ListView.builder(
          padding:     const EdgeInsets.all(12),
          itemCount:   metricas.length,
          itemBuilder: (_, i) => _TarjetaMetrica(metrica: metricas[i]),
        ),
      ),
    );
  }
}

class _TarjetaMetrica extends StatelessWidget {
  final MetricaMoto metrica;
  const _TarjetaMetrica({required this.metrica});

  @override
  Widget build(BuildContext context) {
    final cs          = Theme.of(context).colorScheme;
    final stockCritico = metrica.stock <= 2; // Crítico si quedan pocas unidades
    final ratingCritico = metrica.calificacion < 4.2; 
    final esCritico   = stockCritico;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color:  esCritico ? cs.errorContainer : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.motorcycle, color: esCritico ? cs.error : cs.primary, size: 18),
                const SizedBox(width: 8),
                Text(
                  metrica.moto,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '\$${metrica.precio.toStringAsFixed(0)} USD',
                  style: TextStyle(fontSize: 14, color: cs.primary, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Interesados en cotizar: ${metrica.interesados} clientes',
              style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 10),
            _Barra('Stock', metrica.stock / 10 * 100, stockCritico, labelValor: '${metrica.stock} u.'),
            const SizedBox(height: 6),
            _Barra('Rating', metrica.calificacion / 5 * 100, ratingCritico, labelValor: '${metrica.calificacion} ★'),
            const SizedBox(height: 6),
            _Barra('Visitas', metrica.interesados / 500 * 100, false, labelValor: '${metrica.interesados}'),
          ],
        ),
      ),
    );
  }
}

class _Barra extends StatelessWidget {
  final String label;
  final double valor; // 0 a 100
  final bool   critica;
  final String labelValor;
  const _Barra(this.label, this.valor, this.critica, {required this.labelValor});

  @override
  Widget build(BuildContext context) {
    final color = critica ? Colors.red : Colors.green;
    return Row(children: [
      SizedBox(width: 48, child: Text(label,
          style: const TextStyle(fontSize: 12))),
      Expanded(
        child: LinearProgressIndicator(
          value:           valor / 100,
          backgroundColor: Colors.grey.shade200,
          valueColor:      AlwaysStoppedAnimation(color),
        ),
      ),
      const SizedBox(width: 8),
      Text(labelValor,
          style: TextStyle(fontSize: 12, color: color,
              fontWeight: FontWeight.w600)),
    ]);
  }
}