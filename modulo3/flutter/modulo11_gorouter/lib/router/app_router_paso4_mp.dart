// lib/router/app_router_paso4.dart
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter/.dart';
import 'package:modulo11_gorouter/.dart';
import '.dart';
import '.dart';
import '.dart';
import '.dart';
import '.dart';

final appRouterPaso4 = GoRouter(
  initialLocation: '/servidores',
  debugLogDiagnostics: true,
  routes: [
    // ShellRoute — mantiene ScaffoldConNav vivo entre rutas hijas
    ShellRoute(
      builder: (context, state, child) => ScaffoldConNav(child: child),
      routes: [
        GoRoute(
          path:    '/servidores',
          builder: (_, __) => const PantallaServidores(),
          routes: [
            GoRoute(
              path:    ':id',
              builder: (context, state) {
                final id       = state.pathParameters['id']!;
                final servidor = state.extra as ServidorSSH?;
                return PantallaDetalle(id: id, servidor: servidor);
              },
            ),
          ],
        ),
        GoRoute(
          path:    '/metricas',
          builder: (_, __) => const PantallaMetricas(),
        ),
        GoRoute(
          path:    '/ajustes',
          builder: (_, __) => const PantallaAjustes(),
        ),
        GoRoute(
          path:    '/dashboard',
          builder: (_, __) => const PantallaDashboard(),
        ),
      ],
    ),
  ],
);
