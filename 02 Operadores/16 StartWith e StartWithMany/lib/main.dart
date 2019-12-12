import 'package:rxdart/rxdart.dart';

main(List<String> args) {
  BehaviorSubject<String> b = new BehaviorSubject();

  b.stream
      .startWith("startValue")
      .listen(print);
  b.sink.add("event1");
  b.sink.add("event2");
  b.sink.add("event3");

  b.stream
      .startWithMany(["startValue1", "startValue2", "startValue3"])
      .listen(print);
  b.sink.add("event1");
  b.sink.add("event2");
  b.sink.add("event3");
}
