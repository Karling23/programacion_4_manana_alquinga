import 'package:flutter/material.dart';

class CatalogoBasicos extends StatelessWidget {
  const CatalogoBasicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Motos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Text básico ───────────────────────────────────────────────────────
          const Text(
            'Yamaha YZF-R1: Disponible',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold, 
              color: Colors.green,
              letterSpacing: 0.5,
              shadows: [Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(2,2))]
            ),
          ),
          const SizedBox(height: 8),

          // ── Alineación y desbordamiento ───────────────────────────────────────
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Kawasaki Ninja H2R: Solo para circuito → 326 hp de pura potencia supercargada con alerones de fibra de carbono.',
              textAlign: TextAlign.justify, 
              maxLines: 2,
              overflow: TextOverflow.ellipsis, 
            ),
          ),
          const SizedBox(height: 8),

          // ── Text.rich — estilos distintos en un solo widget ───────────────────
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Oferta: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: '15% DE DESCUENTO',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' — en el primer mantenimiento de tu Ducati',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // ── SelectableText — el usuario puede seleccionar y copiar ───────────
          const SelectableText(
            'VIN: MLHNC4700K8765432',
            style: TextStyle(fontFamily: 'monospace', fontSize: 14),
          ),
          const Divider(height: 32),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.motorcycle, size: 40, color: Theme.of(context).colorScheme.primary),
              const Icon(Icons.speed, size: 40, color: Colors.red),
              const Icon(Icons.local_gas_station, size: 40, color: Colors.orange),
              const Icon(Icons.verified, size: 40, color: Colors.indigo),
              const Icon(Icons.two_wheeler, size: 40, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 8),
          const Icon(
            Icons.shopping_cart,
            size: 24,
            color: Colors.blueGrey,
            semanticLabel: 'Carrito de compras',
          ),
          const Divider(height: 32),

          // ── Botones ──────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Cotizar'),
              ),
              FilledButton(onPressed: () {}, child: const Text('Comprar')),
              OutlinedButton(onPressed: () {}, child: const Text('Ficha Técnica')),
              TextButton(onPressed: () {}, child: const Text('Ayuda')),
              const ElevatedButton(onPressed: null, child: Text('No Disponible')),
            ],
          ),
          const SizedBox(height: 12),

          // ── Variantes .icon ───────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.compare_arrows, size: 18),
                label: const Text('Comparar Modelos'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.test_ride_outlined ?? Icons.motorcycle, size: 18),
                label: const Text('Solicitar Prueba'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
                color: Colors.red,
                iconSize: 28,
                tooltip: 'Guardar en Favoritos'
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Botón con estilo personalizado ────────────────────────────────────
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange.shade800,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: const StadiumBorder(),
              elevation: 0,
            ),
            child: const Text(
              '¡Comprar ahora con Crédito Directo!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 32),

          // Tarjetas
          Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.orange.shade50,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              leading: const Icon(Icons.motorcycle, color: Colors.orange),
              title: const Text('Honda CBR1000RR-R Fireblade SP'),
              subtitle: const Text('Motor tetracilíndrico de 1000 cc, 217 hp. La joya de Honda inspirada en MotoGP.'),
              trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
              isThreeLine: true,
              onTap: () {},
            ),
          ),
          Card(
            elevation: 12,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade100,
                child: const Icon(Icons.motorcycle, color: Colors.red, size: 20),
              ),
              title: const Text('Ducati Panigale V4'),
              subtitle: const Text('210 hp de pura elegancia italiana · Motor de 1103 cc'),
              trailing: TextButton(onPressed: () {}, child: const Text('Detalles')),
            ),
          ),
          const Divider(height: 32),
          Card(
            child: SwitchListTile(
              value: true,
              onChanged: (_) {},
              title: const Text('Mostrar solo motos eléctricas (ECO)'),
            ),
          ),
          const Divider(height: 32),

          // Chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const Chip(label: Text('Yamaha')),
              const Chip(label: Text('Honda')),
              const Chip(label: Text('Kawasaki')),
              const Chip(label: Text('Suzuki')),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('Frenos ABS'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              FilterChip(
                onDeleted: () {},
                deleteIcon: const Icon(Icons.close, size: 16),
                label: const Text('Sport'),
                selected: true,
                onSelected: (_) {},
                padding: const EdgeInsets.all(8),
              ),
              ActionChip(
                label: const Text('Ficha técnica PDF'),
                avatar: const Icon(Icons.download, size: 16),
                onPressed: () {},
              ),
            ],
          ),
          const Divider(height: 32),

          // Indicadores de Progreso
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 48, height: 48,
                child: CircularProgressIndicator()),           
              SizedBox(width: 48, height: 48,
                child: CircularProgressIndicator(
                  value:       null,           
                  color:       Colors.orange,
                  strokeWidth: 6,
                  backgroundColor: Colors.grey.shade200, 
                )),
              SizedBox(width: 48, height: 48,
                child: CircularProgressIndicator(
                  value:       0.8, // 80% completado
                  color:       Colors.green,
                  strokeWidth: 3,
                  strokeCap:   StrokeCap.round,   
                  backgroundColor: Colors.grey.shade200, 
                )),
            ],
          ),
          const SizedBox(height: 16),

          const Text('Progreso de entrega de tu moto:', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: 0.75, color: Colors.green), // 75%
          const SizedBox(height: 8),
          const Divider(height: 32),
        ],
      ),
    );
  }
}