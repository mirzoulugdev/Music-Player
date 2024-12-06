import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/music_cubit.dart';
import 'shadow.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  @override
  void initState() {
    super.initState();
    context.read<MusicCubit>().addFavoritesMusic();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MusicCubit>().addFavoritesMusic();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocBuilder<MusicCubit, MusicState>(
        builder: (context, state) {
          if (state is FavoriteMusicState) {
            return state.favoriteMusic.isNotEmpty
                ? Column(
                    children: [
                      Stack(
                        children: [
                          const ShadowColor(
                            align: MainAxisAlignment.end,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 600,
                            child: Column(
                              children: [
                                const SizedBox(height: 15),
                                const Text(
                                  "Favorite Music",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  height: 500,
                                  child: ListView.builder(
                                    itemCount: state.favoriteMusic.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        contentPadding: const EdgeInsets.all(0),
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.asset(
                                            state
                                                .favoriteMusic[index].imagePath,
                                            width: 60,
                                            height: 70,
                                          ),
                                        ),
                                        title: Text(
                                          state.favoriteMusic[index].musicName,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                        subtitle: Text(
                                          state.favoriteMusic[index].author,
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              state.favoriteMusic[index]
                                                      .isFavorite =
                                                  !state.favoriteMusic[index]
                                                      .isFavorite;
                                            });
                                          },
                                          icon: state.favoriteMusic[index]
                                                  .isFavorite
                                              ? const Icon(
                                                  Icons.favorite_rounded,
                                                  color: Colors.white)
                                              : const Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                : const Center(
                    child: Text(
                      "Sevimli musiqalar mavjud emas!",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  );
          }
          return Container();
        },
      ),
    );
  }
}
