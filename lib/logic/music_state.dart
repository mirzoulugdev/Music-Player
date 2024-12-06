part of 'music_cubit.dart';

@immutable
abstract class MusicState {}

class MusicInitial extends MusicState {
  final List<Music> musicList;

  MusicInitial({
    required this.musicList,
  });
}

class MusicPlaying extends MusicState {}

class MusicPlayed extends MusicState {}

class MusicError extends MusicState {}

class FavoriteMusicState extends MusicState {
  final List<Music> favoriteMusic;

  FavoriteMusicState({
    required this.favoriteMusic,
  });
}
