// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Photo {
  int id;
  int albumId;
  String title;
  String url;
  String thumbnailUrl;
  Photo({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  Photo copyWith({
    int? id,
    int? albumId,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    return Photo(
      id: id ?? this.id,
      albumId: albumId ?? this.albumId,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'albumId': albumId,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id'] as int,
      albumId: map['albumId'] as int,
      title: map['title'] as String,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) =>
      Photo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Photo(id: $id, albumId: $albumId, title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(covariant Photo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.albumId == albumId &&
        other.title == title &&
        other.url == url &&
        other.thumbnailUrl == thumbnailUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        albumId.hashCode ^
        title.hashCode ^
        url.hashCode ^
        thumbnailUrl.hashCode;
  }
}



/**ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(360),
                          image: DecorationImage(
                              image: NetworkImage(data[index].thumbnailUrl))),
                    ),
                    title: Text(data[index].title),
                    titleTextStyle: TextStyle(color: Colors.blueGrey),
                    subtitle: Text(data[index].albumId.toString()),
                    tileColor: Colors.blueGrey.shade100,
                  ); */