import '../constants.dart';
import '../models/album.dart';
import '../utils/http_client.dart';

class AlbumRepository {
  String url = kApiUrl + '/albums';


  Future<List<Album>> fetchAlbums() async {
    final response = await HttpClient.instance.fetchData(url);
    return response.map<Album>((albumData) => Album.fromJson(albumData)).toList();
  }
}