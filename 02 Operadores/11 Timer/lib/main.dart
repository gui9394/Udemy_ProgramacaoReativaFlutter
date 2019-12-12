import 'package:rxdart/rxdart.dart';

main(List<String> args) {
  Observable.timer(10, Duration(seconds: 1)).listen(print);
}
