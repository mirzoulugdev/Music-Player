class Music {
  final int id;
  final String musicName;
  final String author;
  final String imagePath;
  bool isFavorite = false;

  Music({
    required this.id,
    required this.musicName,
    required this.author,
    required this.imagePath,
    required this.isFavorite,
  });
}
