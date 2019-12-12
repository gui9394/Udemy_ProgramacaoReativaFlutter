import 'package:rxdart/rxdart.dart';

main(List<String> args) {
  BehaviorSubject<String> b = new BehaviorSubject();
  BehaviorSubject<String> b1 = new BehaviorSubject();

  Observable o = Observable.merge([b.stream, b1.stream]);


  o.listen(print);

  b.sink.add("event3");
  b1.sink.add("event2");
  b.sink.add("event1");

}
