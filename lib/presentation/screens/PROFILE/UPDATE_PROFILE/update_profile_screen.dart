import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/presentation/screens/BOTTOM_BAR/custom_bottom_bar.dart';
import 'package:nike_e_shop/presentation/screens/PROFILE/widgets/build_column.dart';
import 'package:nike_e_shop/presentation/screens/PROFILE/widgets/profile_button.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

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
                labelText: 'Enter New Name...',
              ),
              BuildColumnWithTextFieldAndText(
                text: 'Email Adress',
                labelText: 'Enter New Email...',
              ),
              BuildColumnWithTextFieldAndText(
                text: 'Password',
                labelText: 'Enter New Password',
              ),
              BuildColumnWithTextFieldAndText(
                text: 'Location (Optional)',
                labelText: 'Enter New Location',
              ),
              BuildColumnWithTextFieldAndText(
                text: 'Mobile Number',
                labelText: 'Enter New Mobile Number',
              ),
            ],
          ),
          ProfileButton(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => CustomBottomBars()),
                (route) => false,
              );
            },
            btnText: 'Save Changes',
          ),
        ],
      ),
    );
  }
}
