import 'package:favoritos_bloc/blocs/PostBloc.dart';
import 'package:favoritos_bloc/components/PostCard.dart';
import 'package:favoritos_bloc/models/Post.dart';
import 'package:favoritos_bloc/views/FavoritesPage.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  PostBloc _postBloc;

  @override
  void initState() {
    _postBloc = PostBloc();
    super.initState();
  }

  @override
  void dispose() {
    _postBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Postagens'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => FavoritesPage())),
          ),
        ],
      ),
      body: Container(
          child: StreamBuilder(
              stream: _postBloc.postListFlux,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
                if (snapshot.hasData && snapshot.data.isNotEmpty) {
                  return ListView.builder(
                    padding: EdgeInsets.all(5),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Post post = snapshot.data[index];

                      return PostCard(post);
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}
