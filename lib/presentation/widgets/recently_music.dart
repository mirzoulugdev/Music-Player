import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/music_cubit.dart';

class RecentlyMusic extends StatefulWidget {
  const RecentlyMusic({super.key});

  @override
  State<RecentlyMusic> createState() => _RecentlyMusicState();
}

class _RecentlyMusicState extends State<RecentlyMusic> {
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
            width: double.infinity,
            height: 270,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.musicList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    width: 170,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15,
                                  offset: const Offset(3, 8),
                                  color: const Color.fromRGBO(123, 87, 228, 1)
                                      .withOpacity(0.7),
                                )
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                state.musicList[index].imagePath,
                                fit: BoxFit.cover,
                                height: 150,
                                width: 160,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            state.musicList[index].musicName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            state.musicList[index].author,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
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
