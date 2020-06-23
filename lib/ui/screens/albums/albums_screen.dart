import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/album_list_tile.dart';
import '../../../constants.dart';
import '../../../providers/album_provider.dart';
import '../../../utils/http_client.dart';
import '../../widgets/no_data_placeholder.dart';

class AlbumsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final albums = context.watch<AlbumProvider>().albums;

    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: albums.status == Status.COMPLETED
          ? ListView.builder(
              itemCount: albums.data.length,
              itemBuilder: (BuildContext ctx, int i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding / 8,
                  ),
                  child: AlbumListTile(albums.data[i]),
                );
              },
            )
          : albums.status == Status.ERROR
              ? NoDataPlaceholder('No albums were found.')
              : Center(
                  child: CircularProgressIndicator(),
                ),
    );
  }
}
