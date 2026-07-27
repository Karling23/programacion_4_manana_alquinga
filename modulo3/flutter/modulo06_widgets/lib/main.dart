import 'package:flutter/material.dart';
import 'package:modulo06_widgets/widgets/catalogo_basicos_mp.dart';
import 'package:modulo06_widgets/widgets/contador_limitado_mp.dart';
import 'package:modulo06_widgets/widgets/etiqueta_mp.dart';
import 'package:modulo06_widgets/widgets/pantalla_contexto_mp.dart';
import 'package:modulo06_widgets/widgets/reloj_mp.dart';
import 'package:modulo06_widgets/widgets/servicio_estado_mp.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda para navegar entre pasos.           │
// │  1  Paso 1   Saludo / Bienvenidos                               │
// │  2  Paso 1b  Catálogo de motos                                  │
// │  3  Paso 2   Etiquetas de disponibilidad                        │
// │  4  Paso 3   Estado de la moto (Taller / Disponible)             │
// │  5  Paso 3b  Reservación de unidades limitadas                  │
// │  6  Paso 4   Tiempo restante de reserva                         │
// │  7  Paso 5   Especificaciones de pantalla y colores             │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 2;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.orange,       
      brightness: Brightness.dark,    
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const Scaffold(body: Center(child: Saludo())),
    2 => const CatalogoBasicos(),
    3 => const Scaffold(
      body: Center(
        child: Wrap(
          spacing:    12,
          runSpacing: 8,
          children: [
            Etiqueta(texto: 'Disponible', color: Colors.green),
            Etiqueta(texto: 'Agotado',    color: Colors.red,    relleno: true),
            Etiqueta(texto: 'Preventa',   color: Colors.orange),
            Etiqueta(texto: 'Oferta',     color: Colors.blue,   fontSize: 16, relleno: true),
            Etiqueta(texto: 'Prueba',     color: Colors.indigo, fontSize: 11),
          ],
        ),
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: ServicioEstado(nombre: 'Yamaha YZF-R1'),
      ),
    ),
    5 => Scaffold(                               
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContadorLimitado(
              etiqueta: 'Reservar Ducati Panigale V4 (Límite 3)',
              limite:   3,
              color:    Colors.red,
              textoBoton: 'Reservar',
              onLimite: () => debugPrint('¡Límite de reserva alcanzado para la Ducati Panigale!'),
            ),
            const SizedBox(height: 40),
            ContadorLimitado(
              etiqueta: 'Solicitar Test Drive Kawasaki Ninja H2R (Límite 5)',
              limite:   5,
              color:    Colors.green, 
              textoBoton: 'Solicitar',
            ),
          ],
        ),
      ),
    ),
    6 => Scaffold(                              
      appBar: AppBar(title: const Text('Temporizador de Cotización')),
      body: const Center(child: Reloj()),
    ),
    7 => const PantallaContexto(),    
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

class Saludo extends StatelessWidget {
  const Saludo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectableText(
      'Bienvenidos a MotoVentas Premium: La mejor selección de motocicletas de alta cilindrada. Vive la adrenalina sobre dos ruedas.',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        color: Colors.orange,
        shadows: [
          Shadow(color: Colors.black54, blurRadius: 4, offset: Offset(4, 4)),
        ]
      ),
      textAlign: TextAlign.center,
      maxLines: 4,
    );
  }
}