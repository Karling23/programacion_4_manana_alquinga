void main() {
  // List - lista ordenada
  List<String> marcasMotos = ['Yamaha', 'Honda', 'Suzuki'];
  var          cilindradas = [125, 250, 600, 1000];       // tipo inferido: List<int>

  print(marcasMotos[0]);         // Yamaha
  print(marcasMotos.length);     // 3
  marcasMotos.add('Kawasaki');
  marcasMotos.remove('Honda');

  // Map - clave - valor
  Map<String, double> precios = {
    'Yamaha MT-03': 5500.0,
    'Honda Navi':   1500.0,
    'Suzuki Gixxer':3000.0,
  };

  print(precios['Yamaha MT-03']);     // 5500.0
  print(precios['Ducati Panigale']);  // null - clave no existe
  precios['BMW G310'] = 6500.0;       // añadir

  // Set - sin duplicados
  Set<String> tiposMoto = {'Naked', 'Deportiva', 'Custom'};
  tiposMoto.add('Naked');      // ignorado - ya existe
  print(tiposMoto.length);       // 3

  // Spread operator - para combinar colecciones
  var motosNuevas = ['MT-07', 'R15'];
  var motosUsadas = ['CBR250', 'Ninja 300'];
  var inventarioTotal = [...motosNuevas, ...motosUsadas];
  print(inventarioTotal);

  // Collection if - elementos condicionales
  bool mostrarPremium = true;
  var catalogo = [
    'Scooter 125',
    'Naked 250',
    if (mostrarPremium) 'Superbike 1000',  // solo si la condición es true
  ];
  print(catalogo);

  // Collection for - generar elementos
  var cuotasMensuales = [for (var i = 1; i <= 6; i++) i * 500]; // 6 cuotas de 500
  print(cuotasMensuales);
}
