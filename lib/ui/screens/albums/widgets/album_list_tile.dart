import 'package:flutter/material.dart';

import '../../../../models/album.dart';

class AlbumListTile extends StatelessWidget {
  final Album _album;

  AlbumListTile(this._album);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_album.title),
      subtitle: Text('Artist: ${_album.userId}'),
      leading: CircleAvatar(
        child: Text(_album.id.toString()),
      ),
    );
  }
}
