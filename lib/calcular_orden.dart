typedef Rival = ({int scaloni, int ayudante});

typedef OrdenResultado = ({int tiempo, List<Rival> orden});

List<Rival> ordenarRivales(List<Rival> rivales) {
  // Ordenar de mas tiempo a menos (del ayudante)
  // Complejidad O(N * Log(N)), dart utiliza quicksort
  rivales.sort((a, b) {
    return b.ayudante.compareTo(a.ayudante);
  });

  return rivales;
}

int calcularTiempoTotal(List<Rival> rivales) {
  // Va acumulando el tiempo que se toma Scaloni en total en ver los rivales
  // El tiempo total no depende del orden en que ve los rivales
  int tiempoScaloni = 0;

  // Guarda el tiempo máximo en el que un ayudante va a terminar un rival,
  // cada vez que un ayudante empieza a ver un rival, si este va a ser el
  // último en terminar se modifica la variable con el valor que va tardar
  // tomando en cuenta el tiempo que pasó antes de empezar a ver el rival
  int tiempoMaxAyudante = 0;

  for (final rival in rivales) {
    tiempoScaloni += rival.scaloni;

    final nuevoTiempoMaxAyudate = tiempoScaloni + rival.ayudante;

    if (nuevoTiempoMaxAyudate > tiempoMaxAyudante) {
      tiempoMaxAyudante = nuevoTiempoMaxAyudate;
    }
  }

  return tiempoMaxAyudante;
}

OrdenResultado analisisDeRivales(List<Rival> rivales) {
  ordenarRivales(rivales);
  final tiempo = calcularTiempoTotal(rivales);

  return (tiempo: tiempo, orden: rivales);
}
