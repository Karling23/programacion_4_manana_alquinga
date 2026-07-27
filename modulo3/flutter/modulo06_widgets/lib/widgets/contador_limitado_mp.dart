import 'package:flutter/material.dart';

class ContadorLimitado extends StatefulWidget {
  final String       etiqueta;
  final int          limite;
  final Color        color;          
  final VoidCallback? onLimite;      
  final String       textoBoton;
  final int          pasoIncremento;

  const ContadorLimitado({
    super.key,
    required this.etiqueta,
    this.limite  = 5, // Límite de reservaciones por persona
    this.color   = Colors.orange,
    this.onLimite,
    this.textoBoton = 'Reservar Unidad',
    this.pasoIncremento = 1,
  });

  @override
  State<ContadorLimitado> createState() => _ContadorLimitadoState();
}

class _ContadorLimitadoState extends State<ContadorLimitado> {
  int _valor = 0;

  void _incrementar() {
    if (_valor >= widget.limite) return;    
    setState(() => _valor += widget.pasoIncremento);
    if (_valor >= widget.limite) {
      widget.onLimite?.call();              
    }
  }

  @override
  Widget build(BuildContext context) {
    final enLimite  = _valor >= widget.limite;
    final progreso  = _valor / widget.limite;   

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.etiqueta,                               
            style: TextStyle(color: widget.color, fontWeight: FontWeight.w600, fontSize: 16)),

        const SizedBox(height: 6),

        // Barra que refleja la disponibilidad de reserva
        SizedBox(
          width: 250,
          child: LinearProgressIndicator(
            value:           progreso,
            color:           widget.color,   
            backgroundColor: widget.color.withOpacity(0.15),
          ),
        ),

        const SizedBox(height: 6),

        Text(
          '$_valor / ${widget.limite} Reservadas',                      
          style: TextStyle(
            fontSize:   24,
            fontWeight: FontWeight.bold,
            color:      widget.color,
          ),
        ),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: widget.color),
              onPressed: enLimite ? null : _incrementar,    
              child: Text(widget.textoBoton),
            ),
            const SizedBox(width: 8),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: widget.color),
              onPressed: () => setState(() => _valor = 0),  
              child: const Text('Resetear Reservas'),
            ),
          ],
        ),

        if (enLimite)
          Text('¡Límite de unidades reservadas alcanzado para esta sesión!',
              style: TextStyle(fontSize: 12, color: widget.color, fontWeight: FontWeight.w500)),
      ],
    );
  }
}