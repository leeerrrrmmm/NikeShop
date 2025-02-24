import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/domain/auth_service.dart';
import 'package:nike_e_shop/extension/size_extension.dart';

class DrawerMenu extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DrawerMenu({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = AuthService();
    final _curUser = _auth.getCurrentUser();

    return Drawer(
      backgroundColor: Color(0xFF0D6EFD),
      child: ListView(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 49,
                child: Image.asset('asset/image/nig.png', fit: BoxFit.contain),
              ),
              Text(
                '${_curUser!.displayName ?? ''}',
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
            scaffoldKey: scaffoldKey,
            text: 'Profile',
            icon: CupertinoIcons.person,
          ),
          _BuildListTileWidget(
            scaffoldKey: scaffoldKey,
            text: 'My Cart',
            icon: CupertinoIcons.bag,
          ),
          _BuildListTileWidget(
            scaffoldKey: scaffoldKey,
            text: 'Favorite',
            icon: CupertinoIcons.heart,
          ),
          _BuildListTileWidget(
            scaffoldKey: scaffoldKey,
            text: 'Orders',
            icon: CupertinoIcons.bus,
          ),
          _BuildListTileWidget(
            scaffoldKey: scaffoldKey,
            text: 'Notification',
            icon: CupertinoIcons.bell,
          ),
          _BuildListTileWidget(
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

  const _BuildListTileWidget({
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
        scaffoldKey.currentState?.openEndDrawer();
      },
    );
  }
}
