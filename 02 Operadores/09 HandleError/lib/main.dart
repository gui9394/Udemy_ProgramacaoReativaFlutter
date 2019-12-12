import 'dart:async';

main(List<String> args) {
  final streamController = StreamController.broadcast();

  streamController.stream
      .listen((e) => print("STREAM COMUM:    $e"));

  streamController.stream
      .asyncMap((e) => fakeRequest(e))
      .handleError(handle, test: myTest)
      .listen((e) => print("STREAM DISTINCT: $e"));

  streamController.add('o');
}

void handle(error, stack) {
  print('Erro: $error');
}

bool myTest(error) {
  if(error.contains('r')) {
    return true;
  } 
  
  return false;
}

Future<List<String>> fakeRequest(String query) async {
  await Future.delayed(Duration(microseconds: 500));

  throw 'error';
  // throw 1;
}
