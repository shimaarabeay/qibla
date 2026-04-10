import 'package:flutter/material.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/features/home/presentation/view/audio_player_view.dart';
import 'package:qibla/features/home/presentation/view/widget/custom_bottom_navigation_bar.dart';
import 'package:qibla/core/presentation/widgets/custom_app_bar.dart';

import '../quran_read_view.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _HomeViewState();
}

class _HomeViewState extends State<MainViewBody> {
  int currentIndex = 0;
  final List<Widget> pages = [
    AudioPlayerView(),
    QuranReadView(),
    Center(child: Text('المصحف')),
    Center(child: Text('القبلة')),
    Center(child: Text('الإعدادات')),
    Center(child: Text('المزيد')),
  ];

  @override
  Widget build(BuildContext context) {
    final List<AppBar> appBars = [
      buildAppBar(
        context,
        title: 'Now Playing',
        showBackButton: true,
      ),
      buildAppBar(
        context,
        title: 'المصحف',
        showBackButton: true,
      ),
      buildAppBar(
        context,
        title: 'القبلة',
        showBackButton: true,
        actionIcon: IconButton(
          icon: Icon(Icons.search, color: ColorManager.white),
          onPressed: () {
            print("Search Clicked");
          },
        ),
      ),
      buildAppBar(
        context,
        title: 'الإعدادات',
        showBackButton: true,
      ),
      buildAppBar(
        context,
        title: 'المزيد',
        showBackButton: true,
      ),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: appBars[currentIndex],
        body: pages[currentIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
