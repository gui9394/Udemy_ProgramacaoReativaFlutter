import 'package:rxdart/rxdart.dart';

main(List<String> args) {
  BehaviorSubject<String> b = new BehaviorSubject();
  BehaviorSubject<String> b1 = new BehaviorSubject();

  b.stream.listen(b1.sink.add);

  b.sink.add('Ola');

  b.stream.listen(print);
  b1.stream.listen(print);
}
