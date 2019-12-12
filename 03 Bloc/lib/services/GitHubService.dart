import 'dart:convert';
import 'dart:io';

import 'package:github_search/models/SearchResult.dart';
import 'package:http/http.dart';

class GitHubService {
  final url = "https://api.github.com/search/repositories?q=";
  final http = new Client();

  Future<SearchResult> search(String query) async {
    try {
      Response response = await http.get('$url$query');

      return SearchResult.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw SocketException(e);
    }
  }
}
