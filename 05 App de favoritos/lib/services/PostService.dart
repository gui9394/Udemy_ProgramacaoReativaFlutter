import 'package:dio/dio.dart';
import 'package:favoritos_bloc/models/Post.dart';

class PostService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  final Dio dio = new Dio();

  Future<List<Post>> getPost() async {
    try {
      Response response = await dio.get(baseUrl);

      List<Post> postList = (response.data as List)
          .map<Post>((json) => Post.fromJson(json))
          .toList();

      return postList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
