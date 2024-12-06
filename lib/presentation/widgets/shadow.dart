import 'dart:ui';

import 'package:flutter/material.dart';

class ShadowColor extends StatelessWidget {
  final MainAxisAlignment align;

  const ShadowColor({required this.align, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: align,
      children: [
        Align(
          alignment: const AlignmentDirectional(1.3, 0.7),
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
          alignment: const AlignmentDirectional(-0.4, 0.4),
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
      ],
    );
  }
}
