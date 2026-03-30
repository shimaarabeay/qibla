import 'package:flutter/material.dart';
import 'package:qibla/features/home/presentation/view/widget/custom_bottom_navigation_bar.dart';


class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _HomeViewState();
}

class _HomeViewState extends State<MainViewBody> {
  int currentIndex = 0;

  final List<Widget> pages = [
    Scaffold(),
    Center(child: Text('الرئيسية')),
    Center(child: Text('المصحف')),
    Center(child: Text('القبلة')),
    Center(child: Text('الإعدادات')),
    Center(child: Text('المزيد')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}