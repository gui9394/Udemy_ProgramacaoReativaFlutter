import 'dart:async';

main(List<String> args) {
  final streamController = StreamController<Homem>.broadcast();

  streamController.stream
      .listen((e) => print("STREAM COMUM:    ${e.nome}"));

  streamController.stream
      .distinct((before, current) => 
         before.nome.endsWith('o') && current.nome.endsWith('o')
      )
      .listen((e) => print("STREAM DISTINCT: ${e.nome}"));

  streamController.add(Homem('Joao'));
  streamController.add(Homem('Joao'));

  streamController.add(Homem('Carlos'));
  streamController.add(Homem('Carlos'));

  streamController.add(Homem('Mario'));
  streamController.add(Homem('Romario'));
}

class Homem {
  String nome;

  Homem(this.nome);
}
