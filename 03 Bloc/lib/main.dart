import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_search/blocs/SearchBloc.dart';
import 'package:github_search/details/DetailsWidget.dart';
import 'package:github_search/models/SearchItem.dart';
import 'package:github_search/models/SearchResult.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'GitHub Search'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SearchBloc _searchBloc;

  @override
  void initState() {
    _searchBloc = new SearchBloc();
    super.initState();
  }

  @override
  void dispose() {
    _searchBloc.dispose();
    super.dispose();
  }

  Widget _textField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: _searchBloc.searchSink.add,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Digite o nome do repositório",
            labelText: "Pesquisa"),
      ),
    );
  }

  Widget _resultItems() {
    return StreamBuilder<SearchResult>(
        stream: _searchBloc.apiResultStream,
        builder: (BuildContext context, AsyncSnapshot<SearchResult> snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: snapshot.data.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    SearchItem item = snapshot.data.items[index];
                    return _items(item);
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }

  Widget _items(SearchItem item) {
    return ListTile(
      leading: Hero(
        tag: item.url,
        child: CircleAvatar(
          backgroundImage: NetworkImage(item.avatarUrl ??
              "https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/VCHXZQKsxil3lhgr4/animation-loading-circle-icon-on-white-background-with-alpha-channel-4k-video_sjujffkcde_thumbnail-full01.png"),
        ),
      ),
      title: Text(item.fullName ?? "title"),
      subtitle: Text(item.url ?? "url"),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsWidget(
                    item: item,
                  ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Search"),
      ),
      body: ListView(
        children: <Widget>[
          _textField(),
          _resultItems()
        ],
      ),
    );
  }
}
