class ServidorSSH {
  final String id;
  final String nombre; // Usado para Modelo
  final String ip;     // Usado para Marca
  final int    puerto; // Usado para Cilindrada (cc)
  final bool   ssl;    // Usado para Disponibilidad

  const ServidorSSH({
    required this.id,
    required this.nombre,
    required this.ip,
    required this.puerto,
    required this.ssl,
  });
}

// Lista de motos simulada para navegación
const servidoresSimulados = [
  ServidorSSH(id: '1', nombre: 'YZF-R1', ip: 'Yamaha',   puerto: 998,   ssl: true),
  ServidorSSH(id: '2', nombre: 'Ninja H2',  ip: 'Kawasaki',   puerto: 998,   ssl: true),
  ServidorSSH(id: '3', nombre: 'CBR1000RR', ip: 'Honda',   puerto: 1000, ssl: false),
];
