import 'dart:async';

main(List<String> args) {
  final lista = [
    [1, 2, 3],
    [4, 5, 6]
  ].expand((e) => e);
  print(lista);

  final streamController = StreamController.broadcast();

  streamController.stream
      .listen((e) => print("STREAM COMUM:   $e"));

  streamController.stream
      .expand((e) => e)
      .listen((e) => print("STREAM EXPAND:  $e"));

  streamController.add([1, 2, 3]);
  streamController.add([4, 5, 6]);
}
