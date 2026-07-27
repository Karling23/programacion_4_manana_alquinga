import 'dart:async';
import 'package:flutter/material.dart';

class Reloj extends StatefulWidget {
  const Reloj({super.key});

  @override
  State<Reloj> createState() => _RelojState();
}

class _RelojState extends State<Reloj> {
  Timer ? _timer;    
  int  _segundos = 600; // Cuenta regresiva de 10 minutos (600 segundos) para oferta
  bool _pausado  = false;
  List<int> _tiemposVuelta = [];

  @override
  void initState() {
    super.initState();    
    _iniciarTimer();
  }

  void _iniciarTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;   
      setState(() {
        if (_segundos > 0) {
          _segundos--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void _togglePausa() {
    setState(() {
      _pausado = !_pausado;
      if (_pausado) {
        _timer?.cancel();      
      } else {
        _iniciarTimer();      
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();          
    super.dispose();          
  }

  String _formatearTiempo(int totalSegundos) {
    final m = totalSegundos ~/ 60;
    final s = totalSegundos % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  String get _formato {
    return _formatearTiempo(_segundos);
  }

  Color get _colorTiempo {
    if (_segundos < 60) return Colors.red; // Último minuto
    if (_segundos < 180) return Colors.orange; // Menos de 3 minutos
    return Colors.green; // Más de 3 minutos
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'TIEMPO RESTANTE PARA CONFIRMAR RESERVA:',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        Text(
          _formato,
          style: TextStyle(
            fontSize:   48,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            color:      _colorTiempo,         
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton.icon(
              onPressed: _segundos == 0 ? null : _togglePausa,
              icon:  Icon(_pausado ? Icons.play_arrow : Icons.pause),
              label: Text(_pausado ? 'Reanudar' : 'Pausar'),
              style: FilledButton.styleFrom(backgroundColor: _colorTiempo),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () => setState(() {
                _timer?.cancel();
                _segundos = 600;
                _pausado  = false;
                _tiemposVuelta.clear();
                _iniciarTimer();
              }),
              child: const Text('Reiniciar Tiempo'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          _pausado ? 'Temporizador pausado' : 'Cotización activa',
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}