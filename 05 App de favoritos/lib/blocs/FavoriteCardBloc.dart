import 'package:favoritos_bloc/models/Post.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class FavoriteCardBloc extends BlocBase {
  final _favoriteListController = BehaviorSubject<List<Post>>();
  Stream<List<Post>> get favoriteListFlux => _favoriteListController.stream;
  Sink<List<Post>> get favoriteListEvent => _favoriteListController.sink;

  final _isFavoriteController = BehaviorSubject<bool>();
  Stream<bool> get isFavoriteFlux => _isFavoriteController.stream;
  Sink<bool> get isFavoriteEvent => _isFavoriteController.sink;

  FavoriteCardBloc(Post post) {
    favoriteListFlux
        .map((dados) => dados.contains(post))
        .listen(isFavoriteEvent.add);
  }

  @override
  void dispose() {
    _favoriteListController.close();
    _isFavoriteController.close();
  }
}
