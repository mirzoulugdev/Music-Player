import 'package:flutter/material.dart';

import '../../utils/app_images.dart';

class PlayMenu extends StatefulWidget {
  const PlayMenu({super.key});

  @override
  State<PlayMenu> createState() => _PlayMenuState();
}

class _PlayMenuState extends State<PlayMenu> {
  bool _isToggle = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            AppImages.reverseIcon,
            width: 30,
            height: 30,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_previous_rounded,
            size: 40,
            color: Color(0xFFBAA8ED),
          ),
        ),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF7150D0),
                Color(0xFFAE92FF),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            onPressed: () {
              setState(() {
                _isToggle = !_isToggle;
              });
            },
            icon: Icon(
              _isToggle ? Icons.pause : Icons.play_arrow_rounded,
              size: 50,
              color: Colors.white,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_next_rounded,
            size: 40,
            color: Color(0xFFBAA8ED),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            AppImages.loopIcon,
            width: 25,
            height: 25,
          ),
        ),
      ],
    );
  }
}
