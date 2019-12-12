import 'dart:async';
import 'package:rxdart/rxdart.dart';

main(List<String> args) {
  // Observables
  Observable observable = Observable.just('a');
  observable.listen(print, onDone: () => {print('fim')});

  // Tipagem de Observables
  Observable<String> observable1 = Observable.just('a');
  observable1.listen(print, onDone: () => {print('fim')});

  // Controladores de fluxo
  BehaviorSubject b = new BehaviorSubject();
  StreamSubscription subscription = b.stream.listen(print);

  b.sink.add(10);
  b.sink.add(15);
  b.sink.add(20);

  subscription.onData((data) => print('DATA $data'));
  subscription.onError((data) => print('ERROR $data'));

  // Typagem de controladores de fluxo
  BehaviorSubject<int> b1 = new BehaviorSubject();
  b1.stream.listen(print);
  b1.sink.add(15);

  BehaviorSubject<String> b2 = new BehaviorSubject();
  b2.stream.listen(print);
  b2.sink.add("15");
}
