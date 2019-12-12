import 'package:rxdart/rxdart.dart';

main(List<String> args) {
  PublishSubject p = new PublishSubject();

  p.stream.listen((data) => {print('PublishSubject  print $data')});

  p.sink.add(1);
  p.sink.add(2);
  p.sink.add(3);

  BehaviorSubject b = new BehaviorSubject();

  b.sink.add(15);

  b.stream.listen((data) => {print('BehaviorSubject print $data')});
  print('BehaviorSubject values ${b.value}');

  ReplaySubject r = new ReplaySubject();

  r.sink.add(10);
  r.sink.add(15);
  r.sink.add(20);

  r.stream.listen((data) => {print('ReplaySubject   print $data')});
  print('ReplaySubject   values ${r.values}');
}
