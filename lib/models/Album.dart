
class Album {
  final int? id;
  final String? title;
  final int noOfSongs;

  Album({required this.id,required this.title, required this.noOfSongs});

  @override
  String toString() {
    return 'Album{id: $id, name: $title, songs: $noOfSongs}';
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': title,
      'songscount': noOfSongs,
    };
  }

}