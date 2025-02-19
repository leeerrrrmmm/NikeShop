import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:nike_sneakers_store/presentation/MAIN/main_screen.dart';
import 'package:nike_sneakers_store/presentation/PROFILE/profile_screen.dart';

class CustomBottomBars extends StatefulWidget {
  const CustomBottomBars({super.key});

  @override
  State<CustomBottomBars> createState() => _CustomBottomBarsState();
}

class _CustomBottomBarsState extends State<CustomBottomBars>
    with TickerProviderStateMixin {
  late MotionTabBarController _motionTabBarController;
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MainScreen(),
    Center(child: Text("Favorite")), // Заглушка для Favorite
    Center(child: Text("My Cart")), // Заглушка для Cart
    Center(child: Text("Notification")), // Заглушка для Notification
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: _selectedIndex,
      length: _screens.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BODY
      body: _screens[_selectedIndex],

      /// BOTTOM NAV BAR
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        labels: ['Home', 'Favotite', 'Card', 'Nitification', 'Profile'],
        icons: [
          CupertinoIcons.home,
          CupertinoIcons.heart,
          CupertinoIcons.bag,
          CupertinoIcons.bell,
          Icons.person_outline,
        ],
        initialSelectedTab: 'Home',
        tabSize: 50,
        tabBarHeight: 60,
        textStyle: const TextStyle(fontSize: 14, color: Colors.black),
        onTabItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _motionTabBarController.dispose();
    super.dispose();
  }
}
