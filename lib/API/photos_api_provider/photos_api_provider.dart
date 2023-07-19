import 'dart:convert';

import 'package:api/API/API_provider.dart';
import 'package:api/API/photos_api_provider/photo.dart';

class PhotosApiProvider extends APIProvider {
  @override
  String get apiUrl => 'photos';
  Future<List<Photo>> fetchPhotos() async {
    List photos = await fetch();
    return photos.map((photo) => Photo.fromMap(photo)).toList();
  }

  Future<Photo> fetchPhoto(String endPoint) async {
    Map map = await fetch(endPoint: endPoint);
    return Photo.fromMap(map as Map<String, dynamic>);
  }
}
