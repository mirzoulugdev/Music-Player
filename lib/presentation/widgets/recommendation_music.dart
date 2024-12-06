import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/music_cubit.dart';

class RecommendationMusic extends StatefulWidget {
  const RecommendationMusic({super.key});

  @override
  State<RecommendationMusic> createState() => _RecommendationMusicState();
}

class _RecommendationMusicState extends State<RecommendationMusic> {
  @override
  void initState() {
    context.read<MusicCubit>().resetMusicInitial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicCubit, MusicState>(
      builder: (context, state) {
        if (state is MusicInitial) {
          return SizedBox(
            height: 330,
            width: double.infinity,
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: state.musicList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      state.musicList[index].imagePath,
                      width: 60,
                      height: 70,
                    ),
                  ),
                  title: Text(
                    state.musicList[index].musicName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    state.musicList[index].author,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        state.musicList[index].isFavorite =
                            !state.musicList[index].isFavorite;
                      });
                    },
                    icon: state.musicList[index].isFavorite
                        ? const Icon(Icons.favorite_rounded,
                            color: Colors.white)
                        : const Icon(
                            Icons.favorite_border_outlined,
                          ),
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
