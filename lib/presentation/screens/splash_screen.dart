import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../utils/app_colors.dart';
import '../widgets/shadow.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  const ShadowColor(
                    align: MainAxisAlignment.end,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/headphone.png',
                          width: 450,
                          height: 400,
                        ),
                        const Text(
                          "Getting Started",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                        Text(
                          "Getting Started Getting",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey.shade500,
                            fontFamily: 'Urbanist-Regular',
                          ),
                        ),
                        const SizedBox(height: 50),
                        GestureDetector(
                          onTap: () => context.go('/home'),
                          child: Container(
                            width: 180,
                            height: 70,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF886AE2),
                                  Color(0xFFA284F6),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(45),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Let's Go",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: 'Urbanist-Medium',
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                        Text(
                          "DIEMU",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        Text(
                          "BEST MUSIC APP",
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.grey.shade600,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
