import 'package:tp1/calcular_orden.dart';
import 'package:tp1/leer_archivo.dart';

void main(List<String> arguments) async {
  final archivo = arguments.isNotEmpty ? arguments[0] : null;

  if (archivo == null) {
    print("No se leyó ningún archivo");
    return;
  }

  final videos = await leerDatosVideosDesdeArchivo(archivo);

  final resultado = analisisDeRivales(videos);

  print("Orden");

  for (final video in resultado.orden) {
    print("${video.scaloni}, ${video.ayudante}");
  }

  print("Tiempo total: ${resultado.tiempo}");
}
