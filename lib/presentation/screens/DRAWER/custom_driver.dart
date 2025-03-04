import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/domain/auth/auth_service.dart';
import 'package:nike_e_shop/extension/size_extension.dart';
import 'package:nike_e_shop/presentation/screens/FAVORITES/favorite_screen.dart';
import 'package:nike_e_shop/presentation/screens/MYCART/cart_screen.dart';
import 'package:nike_e_shop/presentation/screens/PROFILE/profile_screen.dart';
import 'package:nike_e_shop/presentation/screens/SETTINGS/settings_screen.dart';

class DrawerMenu extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DrawerMenu({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    final curUser = auth.getCurrentUser();
    final img = curUser!.photoURL;

    return Drawer(
      backgroundColor: Color(0xFF0D6EFD),
      child: ListView(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    img != null
                        ? NetworkImage(img)
                        : AssetImage('asset/image/nig.png'),
              ),
              Text(
                curUser.displayName ?? '',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          40.hBox,
          _BuildListTileWidget(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            scaffoldKey: scaffoldKey,
            text: 'Profile',
            icon: CupertinoIcons.person,
          ),
          _BuildListTileWidget(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => CartScreen()),
              );
            },
            scaffoldKey: scaffoldKey,
            text: 'My Cart',
            icon: CupertinoIcons.bag,
          ),
          _BuildListTileWidget(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => FavoriteScreen()),
              );
            },
            scaffoldKey: scaffoldKey,
            text: 'Favorite',
            icon: CupertinoIcons.heart,
          ),
          _BuildListTileWidget(
            onTap: () {},
            scaffoldKey: scaffoldKey,
            text: 'Notification',
            icon: CupertinoIcons.bell,
          ),
          _BuildListTileWidget(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            scaffoldKey: scaffoldKey,
            text: 'Settings',
            icon: Icons.settings_outlined,
          ),
        ],
      ),
    );
  }
}

class _BuildListTileWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;

  const _BuildListTileWidget({
    required this.onTap,
    required this.scaffoldKey,
    required this.text,
    required this.icon,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      onTap: () {
        // Закрываем Drawer
        scaffoldKey.currentState?.openEndDrawer();

        // Даем небольшой таймаут перед навигацией, чтобы Drawer успел закрыться
        Future.delayed(Duration(milliseconds: 200), () {
          if (onTap != null) {
            onTap!();
          }
        });
      },
    );
  }
}
