import 'dart:async';

main(List<String> args) {
  final streamController = StreamController.broadcast();

  streamController.stream.listen((e) => print("STREAM COMUM: $e"));
  streamController.stream.map((e) => e.toUpperCase()).listen((e) => print("STREAM MAP:   $e"));

  streamController.add('a');
  streamController.add('b');
  streamController.add('c');
  streamController.add('d');
}
