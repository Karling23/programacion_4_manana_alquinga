import 'package:flutter/material.dart';
import 'package:modulo09_formularios/widgets/tarjetaservidorgrid_mp.dart';
import '../models/servidor_ssh_mp.dart';
import '../widgets/fila_servidor_mp.dart';

class PantallaServidores extends StatefulWidget {
  const PantallaServidores({super.key});
  @override
  State<PantallaServidores> createState() => _PantallaServidoresState();
}

class _PantallaServidoresState extends State<PantallaServidores> {
  final _servidores = [
    Moto(id:'1', modelo:'YZF-R1',  marca:'Yamaha',   cilindrada:998,   tipo:'Deportiva',   color:'Azul Racing', disponible:true,  favorito:true),
    Moto(id:'2', modelo:'Ninja H2', marca:'Kawasaki', cilindrada:998,   tipo:'Deportiva',   color:'Verde KRT',   disponible:true),
    Moto(id:'3', modelo:'CBR1000RR',marca:'Honda',    cilindrada:1000,  tipo:'Deportiva',   color:'Rojo HRC',    disponible:false),
    Moto(id:'4', modelo:'Panigale V4', marca:'Ducati', cilindrada:1103,  tipo:'Deportiva',   color:'Rojo Ducati', disponible:true),
  ];

  bool _modoGrid = false;   

  void _toggleFavorito(int i) =>
      setState(() => _servidores[i].favorito = !_servidores[i].favorito);

  void _eliminar(int i) => setState(() => _servidores.removeAt(i));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Motos Registradas (${_servidores.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon:    Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:   2,
                childAspectRatio: 1.15,
                crossAxisSpacing: 8,
                mainAxisSpacing:  8,
              ),
              itemCount:   _servidores.length,
              itemBuilder: (ctx, i) => TarjetaServidorGrid(
                servidor:   _servidores[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount:        _servidores.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaServidor(
                servidor:   _servidores[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            ),
    );
  }
}