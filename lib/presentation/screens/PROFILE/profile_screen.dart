import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/domain/auth/auth_service.dart';
import 'package:nike_e_shop/presentation/screens/PROFILE/widgets/user_info_widget.dart';
import 'package:nike_e_shop/presentation/screens/PROFILE/widgets/profile_button.dart';
import 'package:nike_e_shop/presentation/screens/PROFILE/UPDATE_PROFILE/update_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    final curUser = auth.getCurrentUser();
    final img = curUser!.photoURL;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                curUser.displayName ?? 'User',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            children: [
              UserInfoWidget(
                topText: 'Name',
                userInfo: curUser.displayName ?? '',
              ),
              UserInfoWidget(topText: 'Email', userInfo: curUser.email ?? ''),
              UserInfoWidget(topText: 'Password', userInfo: '*' * 6),
            ],
          ),
          ProfileButton(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => UpdateProfileScreen()),
              );
            },
            btnText: 'Update Profile',
          ),
        ],
      ),
    );
  }
}
