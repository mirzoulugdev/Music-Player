import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../model/music.dart';

part 'music_state.dart';

List<Music> musicsList = [
  Music(
      id: 1,
      musicName: 'Insonlar',
      author: "Konsta ",
      imagePath: 'assets/images/konsta.png',
      isFavorite: true),
  Music(
      id: 2,
      musicName: 'Odamlar nima deydi',
      author: "Konsta ",
      imagePath: 'assets/images/odamlar.png',
      isFavorite: false),
  Music(
      id: 3,
      musicName: 'Mendirman',
      author: "Ozodbek Nazarbekov ",
      imagePath: 'assets/images/mendirman.png',
      isFavorite: false),
  Music(
      id: 4,
      musicName: "O'zbekistonlik",
      author: "Konsta ",
      imagePath: 'assets/images/uzbek.png',
      isFavorite: false),
  Music(
      id: 5,
      musicName: 'Yaxshi qiz',
      author: "Shoxruxbek Ergashev",
      imagePath: 'assets/images/shohrux_ergashev.png',
      isFavorite: false),
  Music(
      id: 6,
      musicName: 'Kuz',
      author: "Konsta ",
      imagePath: 'assets/images/konsta_kuz.png',
      isFavorite: false),
];

class MusicCubit extends Cubit<MusicState> {
  MusicCubit() : super(MusicInitial(musicList: musicsList));

  final List<Music> favoriteMusic = [];

  void resetMusicInitial() {
    emit(MusicInitial(musicList: musicsList));
  }

  void addFavoritesMusic() {
    if (favoriteMusic.isNotEmpty) return;

    favoriteMusic.addAll(
      musicsList.where((music) => music.isFavorite).toList(),
    );

    emit(FavoriteMusicState(favoriteMusic: favoriteMusic));
  }

  void resetFavoriteMusic() {
    addFavoritesMusic();
  }
}
