import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/features/home/presentation/view/audio_player_view.dart';
import 'package:qibla/features/home/presentation/view/widget/custom_bottom_navigation_bar.dart';
import 'package:qibla/core/presentation/widgets/custom_app_bar.dart';
import 'package:qibla/features/home/presentation/view/tasbeeh_view.dart';
import 'package:quick_actions/quick_actions.dart';
import '../quran_read_view.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _HomeViewState();
}

class _HomeViewState extends State<MainViewBody> {
  int currentIndex = 0;

  final QuickActions quickActions = const QuickActions();

  final List<Widget> pages = [
    AudioPlayerView(),
    QuranReadView(),
    TasbeehView(),
    Center(child: Text("home.listen".tr())),
    Center(child: Text("home.more".tr())),
  ];
  @override
  void initState() {
    super.initState();

    quickActions.initialize((type) {
      if (type == 'listening') {
        setState(() {
          currentIndex = 0;
        });
      } else if (type == 'quran') {
        setState(() {
          currentIndex = 1;
        });
      }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
       ShortcutItem(
        type: 'listening',
        localizedTitle: "home.listen".tr(),
        icon: 'icon_listening.png',
      ),
      ShortcutItem(
        type: 'quran',
        localizedTitle: "app.quran".tr(),
        icon: 'icon_quran.png',
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final List<AppBar> appBars = [
      buildAppBar(
        context,
        title: "home.listen".tr(),
        showBackButton: true,
      ),
      buildAppBar(
        context,
        title:"home.mushaf".tr(),
        showBackButton: true,
      ),
      buildAppBar(
        context,
        title: "home.tasbeeh".tr(),
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
        title: '',
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
