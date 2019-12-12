import 'package:rxdart/rxdart.dart';

main(List<String> args) {
  Observable
      .range(1, 4)
      .switchMap((item) => Observable.timer(item, Duration(seconds: 1)))
      .listen(print);
}
