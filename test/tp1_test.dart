import 'package:tp1/calcular_orden.dart';
import 'package:test/test.dart';
import 'package:tp1/generar_pruebas_volumen.dart';
import 'package:tp1/leer_archivo.dart';

void main() {
  test('1 rival', () {
    final List<Rival> datos = [(scaloni: 5, ayudante: 5)];

    final resultado = analisisDeRivales(datos);

    expect(resultado.tiempo, 10);
  });

  test('2 rivales (orden irrelevante)', () {
    final List<Rival> datos = [
      (scaloni: 2, ayudante: 5),
      (scaloni: 2, ayudante: 5),
    ];

    final resultado = analisisDeRivales(datos);

    expect(resultado.tiempo, 9);
  });

  test('2 rivales (orden relevante)', () {
    final List<Rival> datos = [
      (scaloni: 3, ayudante: 5),
      (scaloni: 2, ayudante: 10),
    ];

    final resultado = analisisDeRivales(datos);

    expect(resultado.tiempo, 12);
  });

  test('3 rivales', () {
    final List<Rival> datos = [
      (scaloni: 10, ayudante: 5),
      (scaloni: 20, ayudante: 100),
      (scaloni: 15, ayudante: 50),
    ];

    final resultado = analisisDeRivales(datos);

    expect(resultado.tiempo, 120);
  });

  test('Provistos (3 elem)', () async {
    final rivales = await leerDatosVideosDesdeArchivo('test/3 elem.txt');
    final resultado = analisisDeRivales(rivales);
    expect(resultado.tiempo, 10);
  });

  test('Provistos (10 elem)', () async {
    final rivales = await leerDatosVideosDesdeArchivo('test/10 elem.txt');
    final resultado = analisisDeRivales(rivales);
    expect(resultado.tiempo, 29);
  });

  test('Provistos (100 elem)', () async {
    final rivales = await leerDatosVideosDesdeArchivo('test/100 elem.txt');
    final resultado = analisisDeRivales(rivales);
    expect(resultado.tiempo, 5223);
  });

  test('Provistos (10000 elem)', () async {
    final rivales = await leerDatosVideosDesdeArchivo('test/10000 elem.txt');
    final resultado = analisisDeRivales(rivales);
    expect(resultado.tiempo, 497886735);
  });

  test('Tiempos', () {
    final cantidades = <int>[];

    for (int i = 0; i < 20; i++) {
      cantidades.add((i + 1) * 100000);
    }

    for (final cantidad in cantidades) {
      int total = 0;
      final pruebas = 20;

      for (var i = 0; i < pruebas; i++) {
        final tiempo = pruebaMedirTiempoCantidad(cantidad);
        total += tiempo;
      }

      final promedio = total / pruebas;

      print('$cantidad, $promedio');
    }
  });
}

int pruebaMedirTiempoCantidad(int cantidad) {
  final rivales = generarPruebasDeVolumen(cantidad).toList();

  final stopwatch = Stopwatch();

  stopwatch.start();
  ordenarRivales(rivales);
  stopwatch.stop();

  return stopwatch.elapsedMicroseconds;
}
