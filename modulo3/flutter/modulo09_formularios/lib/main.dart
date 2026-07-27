// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo09_formularios/models/servidor_ssh_mp.dart';
import 'package:modulo09_formularios/screens/pantalla_busqueda_mp.dart';
import 'package:modulo09_formularios/screens/pantalla_servidores_mp.dart';
import 'package:modulo09_formularios/widgets/fila_servidor_mp.dart';
import 'package:modulo09_formularios/widgets/formulario_servidor_mp.dart';

const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFF6F00), // Naranja para el concesionario de motos
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const _Paso1(),
    2 => const _Paso2(),
    3 => const _Paso3(),
    4 => const PantallaServidores(),
    5 => const PantallaBusqueda(),
    _ => Scaffold(
        body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

// ─── Paso 1 ────────────────────────────────────────
class _Paso1 extends StatefulWidget {
  const _Paso1();
  @override
  State<_Paso1> createState() => _Paso1State();
}

class _Paso1State extends State<_Paso1> {
  final _ctrlModelo     = TextEditingController();
  final _ctrlMarca      = TextEditingController();
  final _ctrlCilindrada = TextEditingController(text: '250');
  final _focusMarca     = FocusNode();
  final _focusCilindrada = FocusNode();

  @override
  void dispose() {
    _ctrlModelo.dispose();
    _ctrlMarca.dispose();
    _ctrlCilindrada.dispose();
    _focusMarca.dispose();
    _focusCilindrada.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title:           const Text('Registro Rápido de Moto'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller:      _ctrlModelo,
              decoration:      const InputDecoration(
                labelText:  'Modelo de la Moto',
                hintText:   'Ninja 400',
                prefixIcon: Icon(Icons.motorcycle),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusMarca.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:      _ctrlMarca,
              focusNode:       _focusMarca,
              decoration:      const InputDecoration(
                labelText:  'Marca',
                hintText:   'Kawasaki',
                prefixIcon: Icon(Icons.branding_watermark),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusCilindrada.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:  _ctrlCilindrada,
              focusNode:   _focusCilindrada,
              decoration:  const InputDecoration(
                labelText:  'Cilindrada (cc)',
                prefixIcon: Icon(Icons.speed),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.done,
              onSubmitted:     (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Registrando ${_ctrlMarca.text} ${_ctrlModelo.text} '
                      '(${_ctrlCilindrada.text} cc)',
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon:  const Icon(Icons.save),
              label: const Text('Registrar'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                _ctrlModelo.clear();
                _ctrlMarca.clear();
                _ctrlCilindrada.text = '250';
              },
              child: const Text('Limpiar campos'),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Paso 2 ────────────────────────────────────────
class _Paso2 extends StatelessWidget {
  const _Paso2();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title:           const Text('Nueva Motocicleta'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FormularioServidor(
          onGuardar: (datos) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Moto Guardada: ${datos['ip']} ${datos['nombre']} — ${datos['puerto']} cc (${datos['so']})'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      ),
    );
  }
}

// ─── Paso 3 ────────────────────────────────────────
class _Paso3 extends StatefulWidget {
  const _Paso3();
  @override
  State<_Paso3> createState() => _Paso3State();
}

class _Paso3State extends State<_Paso3> {
  final List<dynamic> _servidores = [
    Moto(id:'1', modelo:'YZF-R1',  marca:'Yamaha',   cilindrada:998,   tipo:'Deportiva',   color:'Azul Racing', disponible:true,  favorito:true),
    Moto(id:'2', modelo:'Ninja H2', marca:'Kawasaki', cilindrada:998,   tipo:'Deportiva',   color:'Verde KRT',   disponible:true),
    Moto(id:'3', modelo:'CBR1000RR',marca:'Honda',    cilindrada:1000,  tipo:'Deportiva',   color:'Rojo HRC',    disponible:false),
    Moto(id:'4', modelo:'Panigale V4', marca:'Ducati', cilindrada:1103,  tipo:'Deportiva',   color:'Rojo Ducati', disponible:true),
    MotoAccesorio(id:'5', nombre:'Escape Akrapovič', marcaCompatibilidad:'Yamaha R1', precio:1200, descripcion:'Escape deportivo de titanio', favorito: false),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Motos y Accesorios (${_servidores.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: _servidores.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.two_wheeler, size: 56, color: cs.onSurfaceVariant),
                  const SizedBox(height: 12),
                  Text('Sin productos en stock', style: TextStyle(color: cs.onSurfaceVariant)),
                ],
              ),
            )
          : ListView.separated(
              itemCount:        _servidores.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) {
                final item = _servidores[i];
                return FilaServidor(
                  servidor: item,
                  onFavorito: () {
                    setState(() {
                      item.favorito = !item.favorito;
                    });
                  },
                  onEliminar: () {
                    setState(() {
                      _servidores.removeAt(i);
                    });
                  },
                );
              },
            ),
    );
  }
}
