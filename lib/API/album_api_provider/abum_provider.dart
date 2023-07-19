import 'package:api/API/API_provider.dart';
import 'package:api/API/album_api_provider/album.dart';

class AlbumApiProvider extends APIProvider {
  @override
  String get apiUrl => 'albums';

  Future<List<Album>> fetchAlbums() async {
    List<Map<String, dynamic>> mapList = await fetch();
    return mapList.map((map) => Album.fromMap(map)).toList();
  }

  Future<Album> fetchAlbum({required String endPoint}) async {
    var map = await fetch(endPoint: endPoint);
    return Album.fromMap(map);
  }
}
