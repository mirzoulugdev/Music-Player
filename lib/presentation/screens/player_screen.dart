import 'dart:ui';

import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../widgets/music_image.dart';
import '../widgets/play_menu.dart';
import '../../utils/app_images.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
        title: const Text(
          "Insonlar",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: PopupMenuButton(
              iconColor: Colors.white,
              iconSize: 30,
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  child: Text('Favorites'),
                ),
                const PopupMenuItem(
                  child: Text('Music List'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.7, 1.1),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFC03EFE),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.7, 1.1),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF5E46F8),
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 100,
                  sigmaY: 100,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const MusicImage(),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Insonlar",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Konsta",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isFavorite = !_isFavorite;
                            });
                          },
                          icon: _isFavorite
                              ? const Icon(
                                  Icons.favorite_outline_rounded,
                                  color: Colors.white,
                                  size: 35,
                                )
                              : const Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.white,
                                  size: 35,
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Image.asset(
                      AppImages.voiceImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 60,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "1.04",
                          style: TextStyle(
                            color: Color(0xFF7B57E4),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "3.29",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const PlayMenu(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
