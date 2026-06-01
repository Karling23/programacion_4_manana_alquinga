class VentaMoto {
  final String cliente;
  final String modelo;
  final double precio;
  final bool   requiereEnvio;

  // Constructor principal
  VentaMoto({
    required this.cliente,
    required this.modelo,
    required this.precio,
    this.requiereEnvio = false,
  });

  // Constructor nombrado - alternativa de creación con configuración predefinida
  VentaMoto.enTienda(String nombreCliente, String modeloMoto)
      : cliente = nombreCliente,
        modelo  = modeloMoto,
        precio  = 5000.0,
        requiereEnvio = false;

  VentaMoto.conEnvioVIP({required this.cliente, required this.modelo, required this.precio})
      : requiereEnvio = true;

  // Constructor factory - lógica de creación más compleja
  factory VentaMoto.desdeDatos(String datosBrutos) {
    // Analiza una cadena y extrae sus partes: "Cliente|Modelo|Precio"
    final partes = datosBrutos.split('|');
    return VentaMoto(
      cliente: partes[0],
      modelo:  partes[1],        
      precio:  double.parse(partes[2]),
      requiereEnvio: false,
    );
  }

  @override
  String toString() =>
      'Venta: $modelo a $cliente por \$$precio ${requiereEnvio ? "(Con Envío)" : "(Retiro Local)"}';
}

void main() {
  final v1 = VentaMoto(cliente: 'Ana', modelo: 'R15', precio: 4500.0);
  final v2 = VentaMoto.enTienda('Luis', 'Navi');
  final v3 = VentaMoto.conEnvioVIP(cliente: 'Carlos', modelo: 'Ducati', precio: 15000.0);
  final v4 = VentaMoto.desdeDatos('Marta|CBR500|7000.0');

  print(v1);  
  print(v2);  
  print(v3);  
  print(v4);  
}
