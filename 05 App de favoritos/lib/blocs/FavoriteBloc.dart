import 'dart:async';

import 'package:favoritos_bloc/models/Favorites.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favoritos_bloc/models/Post.dart';

class FavoriteBloc extends BlocBase {
  final _favorites = Favorites();

  final _favoritesListController = BehaviorSubject<List<Post>>();
  Stream<List<Post>> get favoritesListFlux => _favoritesListController.stream;
  Sink<List<Post>> get favoritesListEvent => _favoritesListController.sink;

  final _favoritesListAddController =  BehaviorSubject<Post>();
  Stream<Post> get favoritesListAddFlux => _favoritesListAddController.stream;
  Sink<Post> get favoritesListAddEvent => _favoritesListAddController.sink;

  final _favoritesListDeleteController =  BehaviorSubject<Post>();
  Stream<Post> get favoritesListDeleteFlux => _favoritesListDeleteController.stream;
  Sink<Post> get favoritesListDeleteEvent => _favoritesListDeleteController.sink;

  FavoriteBloc() {
    favoritesListAddFlux.listen(_handleAdd);
    favoritesListDeleteFlux.listen(_handleDelete);
  }

  void _handleAdd(Post post) {
    _favorites.posts.add(post);
    updateList();
  }

  void updateList() {
    favoritesListEvent.add(_favorites.posts.toList());
  }

  void _handleDelete(Post post) {
    _favorites.posts.remove(post);
    updateList();
  }

  @override
  void dispose() {
    _favoritesListController.close();
    _favoritesListAddController.close();
    _favoritesListDeleteController.close();
  }
}
