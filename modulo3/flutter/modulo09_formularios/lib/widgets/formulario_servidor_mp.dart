// lib/widgets/formulario_servidor_mp.dart
import 'package:flutter/material.dart';

class FormularioServidor extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const FormularioServidor({super.key, required this.onGuardar});

  @override
  State<FormularioServidor> createState() => _FormularioServidorState();
}

class _FormularioServidorState extends State<FormularioServidor> {
  final _formKey = GlobalKey<FormState>();

  // Controladores
  final _ctrlModelo     = TextEditingController();
  final _ctrlMarca      = TextEditingController(text: 'Yamaha');
  final _ctrlCilindrada = TextEditingController(text: '250');
  final _ctrlColor      = TextEditingController(text: 'Azul');
  final _ctrlVin        = TextEditingController(); 

  // FocusNodes para navegación de teclado
  final _focusCilindrada = FocusNode();
  final _focusColor      = FocusNode();
  final _focusVin        = FocusNode();

  // Variables de Estado
  String _tipo      = 'Deportiva';
  String _anio      = '2026'; 
  bool   _disponible = true;

  @override
  void dispose() {
    _ctrlModelo.dispose();
    _ctrlMarca.dispose();
    _ctrlCilindrada.dispose();
    _ctrlColor.dispose();
    _ctrlVin.dispose();
    _focusCilindrada.dispose();
    _focusColor.dispose();
    _focusVin.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'nombre':   _ctrlModelo.text.trim(),
      'ip':       _ctrlMarca.text.trim(),
      'puerto':   _ctrlCilindrada.text.trim(),
      'usuario':  _ctrlColor.text.trim(),
      'mac':      _ctrlVin.text.trim(),
      'so':       _tipo,
      'servicio': _anio,
      'ssl':      _disponible.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView( 
        padding: const EdgeInsets.all(16.0),
        children: [
          // ── Modelo ───────────────────────────────────
          TextFormField(
            controller: _ctrlModelo,
            decoration: const InputDecoration(
              labelText:  'Modelo de la moto',
              hintText:   'YZF-R3',
              prefixIcon: Icon(Icons.motorcycle),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusCilindrada.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El modelo es obligatorio';
              if (v.length < 2)                  return 'Mínimo 2 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Marca ──────────────────────────────────────────
          TextFormField(
            controller:   _ctrlMarca,
            decoration: const InputDecoration(
              labelText:  'Marca de la moto',
              hintText:   'Yamaha',
              prefixIcon: Icon(Icons.branding_watermark),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusCilindrada.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'La marca es obligatoria';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Cilindrada ────────────────────────────────────────────
          TextFormField(
            controller:   _ctrlCilindrada,
            focusNode:    _focusCilindrada,
            decoration: const InputDecoration(
              labelText:  'Cilindrada (cc)',
              hintText:   '321',
              prefixIcon: Icon(Icons.speed),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusColor.requestFocus(),
            validator: (v) {
              final cc = int.tryParse(v ?? '');
              if (cc == null) return 'Cilindrada debe ser un número entero';
              if (cc < 50 || cc > 2500) return 'Cilindrada debe estar entre 50 y 2500 cc';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Color ───────────────────────────────────────────────
          TextFormField(
            controller:      _ctrlColor,
            focusNode:       _focusColor,
            decoration: const InputDecoration(
              labelText:  'Color de la moto',
              hintText:   'Azul Racing',
              prefixIcon: Icon(Icons.color_lens),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusVin.requestFocus(),
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'El color es obligatorio' : null,
          ),
          const SizedBox(height: 12),

          // ── Código VIN ──────────────────────────────────────────
          TextFormField(
            controller: _ctrlVin,
            focusNode:  _focusVin,
            decoration: const InputDecoration(
              labelText:  'Código VIN de Chasis',
              hintText:   'VIN17CARACTERES123',
              prefixIcon: Icon(Icons.fingerprint),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.done,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El código VIN es obligatorio';
              if (v.trim().length < 10) return 'El VIN debe tener al menos 10 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Tipo de Moto ──────────────────────────────────────
          DropdownButtonFormField<String>(
            value:      _tipo,
            decoration: const InputDecoration(
              labelText:  'Tipo de Motocicleta',
              prefixIcon: Icon(Icons.category),
              border:     OutlineInputBorder(),
            ),
            items: [
              'Deportiva', 'Naked', 'Scooter',
              'Adventure', 'Custom', 'Eléctrica',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _tipo = v!),
          ),
          const SizedBox(height: 12),

          // ── Año ──────────────────────────────────────────────
          DropdownButtonFormField<String>(
            value:      _anio,
            decoration: const InputDecoration(
              labelText:  'Año de Fabricación',
              prefixIcon: Icon(Icons.calendar_today), 
              border:     OutlineInputBorder(),
            ),
            items: [
              '2024', '2025', '2026', '2027',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _anio = v!), 
          ),
          const SizedBox(height: 8),

          // ── Disponible — SwitchListTile ──────────────────────────────────
          SwitchListTile(
            title:     const Text('Disponible para Entrega Inmediata'),
            subtitle:  const Text('Disponible en stock físico'),
            value:     _disponible,
            onChanged: (v) => setState(() => _disponible = v),
            secondary: const Icon(Icons.check_circle),
          ),
          const SizedBox(height: 16),

          // ── Botones ───────────────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    _formKey.currentState?.reset();
                    _ctrlModelo.clear();
                    _ctrlMarca.clear();
                    _ctrlVin.clear();
                    _ctrlCilindrada.text = '250';
                    _ctrlColor.text = 'Azul';
                  },
                  child: const Text('Limpiar'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: FilledButton.icon(
                  onPressed: _guardar,
                  icon:  const Icon(Icons.save),
                  label: const Text('Guardar Moto'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}