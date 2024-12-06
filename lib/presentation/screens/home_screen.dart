import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/logic/music_cubit.dart';
import '../widgets/favorite_widget.dart';
import '../widgets/home_widget.dart';
import '../../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndexOnBar = 0;
  List<Widget> screens = [
    const HomeWidget(),
    const FavoriteWidget(),
  ];

  @override
  void initState() {
    context.read<MusicCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade700,
        selectedFontSize: 15,
        backgroundColor: AppColors.mainColor,
        currentIndex: currentIndexOnBar,
        onTap: (value) {
          setState(() {
            currentIndexOnBar = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color:
                  currentIndexOnBar == 0 ? Colors.white : Colors.grey.shade700,
              size: currentIndexOnBar == 0 ? 28 : 25,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_rounded,
              color:
                  currentIndexOnBar == 1 ? Colors.white : Colors.grey.shade700,
              size: currentIndexOnBar == 1 ? 28 : 25,
            ),
            label: "Favorites",
          ),
        ],
      ),
      backgroundColor: AppColors.mainColor,
      body: screens[currentIndexOnBar],
    );
  }
}
