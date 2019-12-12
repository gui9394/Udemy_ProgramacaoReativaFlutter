import 'dart:async';

main(List<String> args) {
  final lista = [1, 2, 3, 4];
  final listaFiltrada = lista.take(2);
  print(listaFiltrada);

  final streamController = StreamController.broadcast();

  streamController.stream.listen((e) => print("STREAM COMUM: $e"));

  streamController.stream
      .take(1)
      .listen((e) => print("STREAM TAKE:  $e"));


  streamController.stream
      .skip(3)
      .listen((e) => print("STREAM SKIP:  $e"));

  streamController.add(1);
  streamController.add(2);
  streamController.add(3);
  streamController.add(4);
}
