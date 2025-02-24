import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/domain/auth_service.dart';
import 'package:nike_e_shop/presentation/screens/PROFILE/UPDATE_PROFILE/update_profile_screen.dart';
import 'package:nike_e_shop/presentation/screens/PROFILE/widgets/build_column.dart';
import 'package:nike_e_shop/presentation/screens/PROFILE/widgets/profile_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _auth = AuthService();
    final _curUser = _auth.getCurrentUser();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                child: Image.asset('asset/image/nig.png'),
              ),
              Text(
                '${_curUser!.displayName ?? ''}',
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
              BuildColumnWithTextFieldAndText(
                text: 'Your Name',
                labelText: '${_curUser.displayName}',
              ),
              BuildColumnWithTextFieldAndText(
                text: 'Email Adress',
                labelText: '${_curUser.email}',
              ),
              BuildColumnWithTextFieldAndText(
                text: 'Password',
                labelText: '********',
              ),
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
