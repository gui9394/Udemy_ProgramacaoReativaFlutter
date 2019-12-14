import 'package:favoritos_bloc/models/Post.dart';
import 'package:favoritos_bloc/services/PostService.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class PostBloc extends BlocBase {
  final _postService = PostService();

  final _postListController = BehaviorSubject<List<Post>>();
  Stream<List<Post>> get postListFlux => _postListController.stream;
  Sink<List<Post>> get postListEvent => _postListController.sink;

  PostBloc() {
    _postService.getPost().then(postListEvent.add);
  }

  @override
  void dispose() {
    _postListController.close();
  }
}
