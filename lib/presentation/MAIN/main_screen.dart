import 'package:flutter/material.dart';
import 'package:nike_sneakers_store/presentation/DRAWER/custom_driver.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  void toggleMenu() {
    final state = _sideMenuKey.currentState;
    if (state!.isOpened) {
      state.closeSideMenu();
    } else {
      state.openSideMenu();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      background: Color(0xFF0D6EFD),
      key: _sideMenuKey,
      menu: DrawerMenu(scaffoldKey: GlobalKey<ScaffoldState>()),
      type: SideMenuType.shrikNRotate,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/image/smile.png',
                  scale: 2,
                  color: Colors.black,
                ),
                Text('Explore'),
              ],
            ),
          ),
          leading: IconButton(icon: Icon(Icons.menu), onPressed: toggleMenu),
        ),
        body: Center(child: Text('Содержимое экрана')),
      ),
    );
  }
}
