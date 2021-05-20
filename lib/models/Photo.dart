import 'dart:convert';

import 'package:flutter/material.dart';

class Photo {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photo(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory Photo.fromJSON(Map<String,dynamic> json){
    return Photo(albumId: json['albumId'], id: json['id'], title: json['title'], url: json['url'], thumbnailUrl: json['thumbnailUrl']);
  }
}
