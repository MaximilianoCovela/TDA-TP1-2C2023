import 'dart:io';

import 'package:tp1/calcular_orden.dart';

Future<List<Rival>> leerDatosVideosDesdeArchivo(String nombre) async {
  final contenido = await File(nombre).readAsString();

  final lineas = contenido.split('\n');

  lineas.removeAt(0);

  final videos = <Rival>[];

  for (final linea in lineas) {
    final separado = linea.split(',');

    final sStr = separado[0].trim();
    if (sStr == '') continue;

    final aStr = separado[1].trim();
    if (aStr == '') continue;

    final s = int.parse(sStr);
    final a = int.parse(aStr);

    videos.add((scaloni: s, ayudante: a));
  }

  return videos;
}
