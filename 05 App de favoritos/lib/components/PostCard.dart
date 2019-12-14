import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favoritos_bloc/blocs/FavoriteBloc.dart';
import 'package:favoritos_bloc/blocs/FavoriteCardBloc.dart';
import 'package:favoritos_bloc/models/Post.dart';
import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';

class PostCard extends StatefulWidget {
  final Post post;

  PostCard(this.post);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  FavoriteCardBloc _favoriteCardBloc;
  FavoriteBloc _favoriteBloc;

  @override
  void initState() {
    _favoriteCardBloc = FavoriteCardBloc(widget.post);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _favoriteBloc = BlocProvider.getBloc<FavoriteBloc>();

      _favoriteBloc.favoritesListFlux
          .listen(_favoriteCardBloc.favoriteListEvent.add);
    });

    super.initState();
  }

  @override
  void dispose() {
    _favoriteCardBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white54,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.only(top: 5, left: 10, right: 10),
            title: Text(
              StringUtils.capitalize(widget.post.title),
            ),
            subtitle: Text(
              StringUtils.capitalize(widget.post.body),
              // style: TextStyle(color: Colors.grey),
            ),
          ),
          StreamBuilder(
              stream: _favoriteCardBloc.isFavoriteFlux,
              initialData: false,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    snapshot.data
                        ? IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              _favoriteBloc.favoritesListDeleteEvent
                                  .add(widget.post);
                            },
                          )
                        : IconButton(
                            icon:
                                Icon(Icons.favorite_border, color: Colors.grey),
                            onPressed: () {
                              _favoriteBloc.favoritesListAddEvent
                                  .add(widget.post);
                            },
                          )
                  ],
                );
              })
        ],
      ),
    );
  }
}
