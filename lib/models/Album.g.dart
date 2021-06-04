// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return Album(
    json['_id'] as int?,
    json['name'] as String?,
    json['songscount'] as int,
  );
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.title,
      'songscount': instance.noOfSongs,
    };
