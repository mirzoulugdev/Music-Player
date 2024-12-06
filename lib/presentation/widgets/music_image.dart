import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/app_images.dart';

class MusicImage extends StatelessWidget {
  const MusicImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            offset: const Offset(0, 5),
            color: Colors.lightBlue.withOpacity(1),
          )
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          AppImages.konsta,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
