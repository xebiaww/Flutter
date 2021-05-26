import 'package:json_annotation/json_annotation.dart';


/// This allows the `Album` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'Album.g.dart';

@JsonSerializable()
class Album {
  @JsonKey(name: '_id')
  final int? id;
  final String? title;
  final int noOfSongs;

  Album(this.id, this.title, this.noOfSongs);

  @override
  String toString() {
    return 'Album{id: $id, name: $title, songs: $noOfSongs}';
  }

  /*Serializing JSON using code generation library*/

factory Album.fromJSON(Map<String,dynamic> json) => _$AlbumFromJSON(json);

Map<String,dynamic> toJSON() => _$AlbumToJSON(this);






  /*Manual Serialization*/
 /* Album.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        title = json['name'],
        noOfSongs = json['songscount'];

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': title,
        'songscount': noOfSongs,
      };*/
}
