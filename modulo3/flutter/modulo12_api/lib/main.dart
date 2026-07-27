import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:modulo12_api/pantalla_paso1_mp.dart';
import 'package:modulo12_api/pantalla_paso1_users_mp.dart';
import 'package:modulo12_api/pantalla_paso2_mp.dart';
import 'package:modulo12_api/pantalla_paso2_users_mp.dart';
import 'package:modulo12_api/pantalla_paso3_mp.dart';

class PantallaTemporal extends StatelessWidget {
  final String titulo;
  const PantallaTemporal({required this.titulo, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(titulo)),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.hourglass_empty, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            '$titulo\nPróximamente…',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_back),
            label: const Text('Volver al menú'),
            onPressed: () => context.go('/'),
          ),
        ],
      ),
    ),
  );
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const PantallaMenu()),

    GoRoute(path: '/paso1', builder: (_, __) => const PantallaPaso1()),
    GoRoute(path: '/paso1users', builder: (_, __) => const PantallaPaso1User()),

    GoRoute(path: '/paso2', builder: (_, __) => const PantallaPaso2()),
    GoRoute(path: '/paso2users', builder: (_, __) => const PantallaPaso2Users()),

    GoRoute(path: '/paso3', builder: (_, __) => const PantallaPaso3()),

    GoRoute(path: '/paso4', builder: (_, __) => const PantallaTemporal(titulo: 'Paso 4 · Errores tipados de compra')),
    GoRoute(path: '/paso5', builder: (_, __) => const PantallaTemporal(titulo: 'Paso 5 · Repositorio completo de motos')),
  ],
);

void main() => runApp(const ProviderScope(child: AppHttp()));

class AppHttp extends StatelessWidget {
  const AppHttp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: _router,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange), // Naranja Concesionario
      useMaterial3: true,
    ),
  );
}

class PantallaMenu extends StatelessWidget {
  const PantallaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    const pasos = [
      _PasoInfo(
        ruta: '/paso1',
        titulo: 'Paso 1',
        subtitulo: 'FutureBuilder simple',
        detalle: 'http.get() + FutureBuilder · Consulta de Moto',
        icono: Icons.motorcycle,
        color: Colors.blue,
      ),
       _PasoInfo(
        ruta: '/paso1users',
        titulo: 'Paso 1 Asesor',
        subtitulo: 'Consultar Asesor',
        detalle: 'http.get() + FutureBuilder · Detalles de Asesor',
        icono: Icons.person,
        color: Color.fromARGB(255, 255, 143, 158),
      ),
      _PasoInfo(
        ruta: '/paso2',
        titulo: 'Paso 2',
        subtitulo: 'DTO de Entregas',
        detalle: 'TodoDto.fromJson · checklist de entrega de motos',
        icono: Icons.checklist,
        color: Colors.green,
      ),
      _PasoInfo(
        ruta: '/paso2users',
        titulo: 'Paso 2 Asesores',
        subtitulo: 'Listar Asesores',
        detalle: 'UserDto.fromJson · lista de asesores de ventas',
        icono: Icons.people,
        color: Color.fromARGB(255, 241, 204, 134),
      ),
      _PasoInfo(
        ruta: '/paso3',
        titulo: 'Paso 3',
        subtitulo: 'Catálogo de Accesorios',
        detalle: 'ProductoDto · toDomain() · API Platzi Catálogo',
        icono: Icons.shopping_bag,
        color: Colors.orange,
      ),
      _PasoInfo(
        ruta: '/paso4',
        titulo: 'Paso 4',
        subtitulo: 'Errores tipados',
        detalle: 'ApiError · Manejo de fallos de stock',
        icono: Icons.error_outline,
        color: Colors.red,
      ),
      _PasoInfo(
        ruta: '/paso5',
        titulo: 'Paso 5',
        subtitulo: 'Repositorio Completo',
        detalle: 'HttpClient · Repositorio · Ventas Notifier',
        icono: Icons.architecture,
        color: Colors.purple,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('MotoVentas Premium — Módulo REST API'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: pasos.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final p = pasos[i];
          return Card(
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                backgroundColor: p.color,
                radius: 24,
                child: Icon(p.icono, color: Colors.white),
              ),
              title: Text(
                '${p.titulo} · ${p.subtitulo}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  p.detalle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go(p.ruta),
            ),
          );
        },
      ),
    );
  }
}

class _PasoInfo {
  final String ruta;
  final String titulo;
  final String subtitulo;
  final String detalle;
  final IconData icono;
  final Color color;
  const _PasoInfo({
    required this.ruta,
    required this.titulo,
    required this.subtitulo,
    required this.detalle,
    required this.icono,
    required this.color,
  });
}