import 'dart:async';

main(List<String> args) {
  final streamController = StreamController.broadcast();

  streamController.stream
      .listen((e) => print("STREAM COMUM:    $e"));

  streamController.stream
      .asyncMap((e) => fakeRequest(e))
      .listen((e) => print("STREAM DISTINCT: $e"));

  streamController.add('o');
}

Future<List<String>> fakeRequest(String query) async {
  await Future.delayed(Duration(microseconds: 500));

  return ['Joao', 'Carlos', 'Daniel', 'Romario'].where((e) => e.contains(query)).toList();
}
