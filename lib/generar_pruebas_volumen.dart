import 'dart:math';

import 'package:tp1/calcular_orden.dart';

int generarNumero() => Random().nextInt(100) + 1;

Iterable<Rival> generarPruebasDeVolumen([int longitud = 1000000]) sync* {
  for (int i = 0; i < longitud; i++) {
    final scaloni = generarNumero();
    final ayudante = generarNumero();

    yield (scaloni: scaloni, ayudante: ayudante);
  }
}
