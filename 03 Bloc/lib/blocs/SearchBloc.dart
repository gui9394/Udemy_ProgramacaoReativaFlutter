import 'package:github_search/models/SearchResult.dart';
import 'package:github_search/services/GitHubService.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class SearchBloc {
  final _searchController = new BehaviorSubject<String>();
  final _gitHubService = new GitHubService();

  Observable<SearchResult> apiResultStream;

  SearchBloc() {
    apiResultStream = searchStream
        .distinct()
        .where((value) => value.length > 3)
        .debounceTime(Duration(milliseconds: 500))
        .asyncMap(_gitHubService.search)
        .switchMap((value) => Observable.just(value));
  }

  void dispose() {
    _searchController.close();
  }

  Observable<String> get searchStream {
    return _searchController.stream;
  }

  Sink<String> get searchSink {
    return _searchController.sink;
  }
}
