import 'package:rxdart/rxdart.dart';

main(List<String> args) {
  Observable.range(1, 10).listen(print);
}
