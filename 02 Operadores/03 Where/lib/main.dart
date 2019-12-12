import 'dart:async';

main(List<String> args) {
  final lista = [1, 2, 3, 4];
  final listaFiltrada = lista.where((e) => e > 2);
  print(listaFiltrada);

  final streamController = StreamController.broadcast();

  streamController.stream.listen((e) => print("STREAM COMUM: $e"));

  streamController.stream
      .where((e) => e > 2)
      .listen((e) => print("STREAM WHERE: $e"));

  streamController.add(1);
  streamController.add(2);
  streamController.add(3);
  streamController.add(4);
}
