import 'package:basic_utils/basic_utils.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favoritos_bloc/blocs/FavoriteBloc.dart';
import 'package:favoritos_bloc/models/Post.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    FavoriteBloc favoriteBloc = BlocProvider.getBloc<FavoriteBloc>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Postagens favoritas'),
      ),
      body: Container(
          child: StreamBuilder(
        stream: favoriteBloc.favoritesListFlux,
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData && snapshot.data.isNotEmpty) {
            return ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Post post = snapshot.data[index];

                return Dismissible(
                  key: Key('${post.id}'),
                  child: Card(
                    color: Colors.white54,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          title: Text(
                            StringUtils.capitalize(post.title),
                          ),
                          subtitle: Text(
                            StringUtils.capitalize(post.body),
                            // style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onDismissed: (direction) {
                    favoriteBloc.favoritesListDeleteEvent.add(post);
                  },
                );
              },
            );
          } else {
            return Center(
              child: Text('Você ainda não possui favoritos'),
            );
          }
        },
      )),
    );
  }
}
