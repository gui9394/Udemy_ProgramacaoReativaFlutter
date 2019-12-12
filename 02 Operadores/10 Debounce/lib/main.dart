import 'package:rxdart/rxdart.dart';

main(List<String> args) {
  BehaviorSubject<String> b = new BehaviorSubject();

  b.stream.debounceTime(Duration(milliseconds: 1)).listen(print);

  b.sink.add('10');
  b.sink.add('50');
  b.sink.add('900');
}
