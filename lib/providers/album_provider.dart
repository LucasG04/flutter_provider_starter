import 'package:flutter/foundation.dart';

import '../models/album.dart';
import '../repositories/album_repository.dart';
import '../utils/http_client.dart';

class AlbumProvider with ChangeNotifier {
  AlbumRepository _albumRepository;
  HttpResponse<List<Album>> _albums;

  HttpResponse<List<Album>> get albums => _albums;

  AlbumProvider() {
    _albumRepository = AlbumRepository();
    fetchAlbums();
  }

  fetchAlbums() async {
    _albums = HttpResponse.loading('');
    notifyListeners();
    try {
      List<Album> albums = await _albumRepository.fetchAlbums();
      _albums = HttpResponse.completed(albums);
      notifyListeners();
    } catch (e) {
      _albums = HttpResponse.error(e.toString());
      notifyListeners();
    }
  }

}