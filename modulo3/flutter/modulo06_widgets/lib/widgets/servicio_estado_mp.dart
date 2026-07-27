import 'package:flutter/material.dart';

class ServicioEstado extends StatefulWidget {
  final String nombre;
  const ServicioEstado({super.key, required this.nombre});

  @override
  State<ServicioEstado> createState() => _ServicioEstadoState();
}

class _ServicioEstadoState extends State<ServicioEstado> {
  bool _activo    = true; // Representa si la moto está disponible o en taller
  int  _reinicios = 0;    // Representa el historial de mantenimientos

  static const int _maxReinicios = 3;

  String nivel = 'normal';

  void _actualizarNivel() {
    if (_reinicios >= 2) {
      nivel = 'critico';
    } else if (_reinicios >= 1) {
      nivel = 'warning';
    } else {
      nivel = 'normal';
    }
  }

  Color _obtenerColorIcono() {
    if (!_activo) return Colors.orange; // En mantenimiento / Taller
    if (nivel == 'critico') return Colors.red; // Requiere revisión urgente
    if (nivel == 'warning') return Colors.blue; 
    return Colors.green; // Totalmente lista y disponible
  }

  void _toggle() {
    setState(() {
      _activo = !_activo;
      if (!_activo) _reinicios++; // Al enviarla al taller cuenta como mantenimiento
      _actualizarNivel();
    });
  }

  @override
  Widget build(BuildContext context) {
    final enLimite = _reinicios >= _maxReinicios;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _activo ? Icons.motorcycle : Icons.build_circle,
            size:  72,
            color: _obtenerColorIcono(),
          ),
          const SizedBox(height: 8),

          Text(widget.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

          Text(
            _activo ? 'Disponible para Entrega' : 'En Taller / Mantenimiento',
            style: TextStyle(
              fontSize:   15,
              fontWeight: FontWeight.w600,
              fontStyle:  _activo ? FontStyle.normal : FontStyle.italic,
              color:      _activo ? Colors.green.shade700 : Colors.orange.shade700,
            ),
          ),
          const SizedBox(height: 16),

          if (!_activo)
            Container(
              margin:     const EdgeInsets.only(bottom: 16),
              padding:    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color:        Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border:       Border.all(color: Colors.orange.shade300),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning_amber, color: Colors.orange, size: 16),
                  SizedBox(width: 6),
                  Text('Moto en proceso de puesta a punto',
                      style: TextStyle(color: Colors.orange, fontSize: 13)),
                ],
              ),
            ),

          ElevatedButton.icon(
            onPressed: enLimite ? null : _toggle,
            icon: Icon(_activo ? Icons.build : Icons.check_circle),
            label: Text(_activo ? 'Enviar a Taller' : 'Aprobar Salida de Taller'),
            style: ElevatedButton.styleFrom(
              backgroundColor: _activo ? Colors.orange.shade600 : Colors.green.shade600,
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 12),

          Opacity(
            opacity: enLimite ? 0.2 : 1.0,
            child: Text(
              'Servicios técnicos: $_reinicios / $_maxReinicios ($nivel)',
              style: TextStyle(
                fontSize: 13,
                color:    enLimite ? Colors.red : Colors.grey.shade600,
              ),
            ),
          ),

          if (enLimite)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Límite de servicios técnicos alcanzado',
                style: TextStyle(
                    fontSize: 12, color: Colors.red.shade700, fontWeight: FontWeight.bold),
              ),
            ),
          
          const SizedBox(height: 16),

          TextButton(
            onPressed: () {
              setState(() {
                _activo = true;
                _reinicios = 0;
                nivel = 'normal';
              });
            },
            child: const Text('Reiniciar Historial Técnico'),
          ),
        ],
      ),
    );
  }
}