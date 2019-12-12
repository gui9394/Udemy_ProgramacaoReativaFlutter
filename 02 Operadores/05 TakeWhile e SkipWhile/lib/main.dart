import 'dart:async';

main(List<String> args) {
  final lista = [1, 2, 3, 4];
  final listaFiltrada = lista.skipWhile((e) => e < 3);
  print(listaFiltrada);

  final streamController = StreamController.broadcast();

  streamController.stream.listen((e) => print("STREAM COMUM:      $e"));

  streamController.stream
      .takeWhile((e) => e < 3)
      .listen((e) => print("STREAM TAKEWHILE:  $e"));


  streamController.stream
      .skipWhile((e) => e < 3)
      .listen((e) => print("STREAM SKIPWHILE:  $e"));

  streamController.add(1);
  streamController.add(2);
  streamController.add(3);
  streamController.add(4);
}
