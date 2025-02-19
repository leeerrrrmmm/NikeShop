import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_sneakers_store/presentation/PROFILE/UPDATE_PROFILE/update_profile_screen.dart';
import 'package:nike_sneakers_store/presentation/PROFILE/widgets/build_column.dart';
import 'package:nike_sneakers_store/presentation/PROFILE/widgets/profile_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Inspiration',
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
                labelText: 'Inspiration',
              ),
              BuildColumnWithTextFieldAndText(
                text: 'Email Adress',
                labelText: 'lerm@gmail.com',
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
