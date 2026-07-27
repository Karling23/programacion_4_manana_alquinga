import 'package:flutter/material.dart';

class PantallaContexto extends StatelessWidget {
  const PantallaContexto({super.key});

  @override
  Widget build(BuildContext context) {
    // ── Tema ──────────────────────────────────────────────────────
    final tema    = Theme.of(context);
    final colores = tema.colorScheme;

    // ── Pantalla ──────────────────────────────────────────────────
    final tamanio   = MediaQuery.sizeOf(context);
    final esMovil   = tamanio.width < 600;
    final esRetrato = MediaQuery.orientationOf(context) == Orientation.portrait;

    return Scaffold(
      backgroundColor: colores.surface,
      appBar: AppBar(
        backgroundColor: colores.primaryContainer,
        foregroundColor: colores.onPrimaryContainer,
        title: Text(
          'Cotizador de Motos (${esMovil ? "Móvil" : "Tablet"}) · ${esRetrato ? "Retrato" : "Horizontal"}',
          style: tema.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Información de pantalla ──
          _Seccion(
            titulo: 'Resolución de visualización de motocicletas',
            items: [
              'Ancho del catálogo:  ${tamanio.width.toStringAsFixed(0)} px',
              'Alto del catálogo:   ${tamanio.height.toStringAsFixed(0)} px',
              'Relación de píxeles:  ${MediaQuery.devicePixelRatioOf(context).toStringAsFixed(3)}',
              'Padding superior (Safe Area):  ${MediaQuery.paddingOf(context).top.toStringAsFixed(0)} px',
            ],
          ),
          const SizedBox(height: 16),

          // ── Colores del tema de motos ──
          _Seccion(titulo: 'Colores de marca (concesionario)', items: const []),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              _ChipColor(nombre: 'Principal (Naranja)',   color: colores.primary),
              _ChipColor(nombre: 'Fondo de Carga',        color: colores.primaryContainer),
              _ChipColor(nombre: 'Detalles (Gris)',       color: colores.secondary),
              _ChipColor(nombre: 'Fondo Base',            color: colores.surface),
              _ChipColor(nombre: 'Alerta / Agotado',      color: colores.error),
            ],
          ),
          const SizedBox(height: 16),

          // ── Tipografía del tema ──
          _Seccion(titulo: 'Tipografías del catálogo de motos', items: const []),
          const SizedBox(height: 8),
          Text('Yamaha R1 (displaySmall)',  style: tema.textTheme.displaySmall),
          const SizedBox(height: 4),
          Text('Superdeportiva 1000cc (headlineMedium)', style: tema.textTheme.headlineMedium),
          const SizedBox(height: 4),
          Text('Ducati Panigale V4S (titleLarge)',    style: tema.textTheme.titleLarge),
          const SizedBox(height: 4),
          Text('Motor Desmosedici Stradale V4 de 1.103 cc, que rinde una potencia de 210 hp a 13.000 rpm y un torque de 124 Nm. (bodyLarge)',     style: tema.textTheme.bodyLarge),
          const SizedBox(height: 4),
          Text('Precio base: $28,500 USD (bodyMedium)',    style: tema.textTheme.bodyMedium),
          const SizedBox(height: 4),
          Text('IVA no incluido en el precio estimado de aduana (labelSmall)',    style: tema.textTheme.labelSmall),
        ],
      ),
    );
  }
}

// ── Widgets auxiliares privados ──

class _Seccion extends StatelessWidget {
  final String       titulo;
  final List<String> items;
  const _Seccion({required this.titulo, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold)),
        const Divider(),
        for (final item in items)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(item, style: Theme.of(context).textTheme.bodyMedium),
          ),
      ],
    );
  }
}

class _ChipColor extends StatelessWidget {
  final String nombre;
  final Color  color;
  const _ChipColor({required this.nombre, required this.color});

  @override
  Widget build(BuildContext context) {
    final luminancia = color.computeLuminance();
    final textoColor = luminancia > 0.4 ? Colors.black87 : Colors.white;
    return Container(
      padding:    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: Text(nombre, style: TextStyle(color: textoColor, fontSize: 11, fontWeight: FontWeight.w600)),
    );
  }
}