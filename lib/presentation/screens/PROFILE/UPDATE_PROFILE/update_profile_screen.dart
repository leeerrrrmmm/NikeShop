import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/domain/auth/auth_service.dart';
import 'package:nike_e_shop/domain/update_user_db/update_user.dart';
import 'package:nike_e_shop/presentation/screens/BOTTOM_BAR/custom_bottom_bar.dart';
import 'package:nike_e_shop/presentation/screens/PROFILE/widgets/build_column.dart';
import 'package:nike_e_shop/presentation/screens/PROFILE/widgets/profile_button.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _nameController = TextEditingController();
  late final TextEditingController _phoneController = TextEditingController();

  void updateUserData() async {
    final AuthService _auth = AuthService();
    final curUser = _auth.getCurrentUser();
    final db = UpdateUser();
    try {
      if (curUser != null) {
        db.updateUserData(
          curUser.uid,
          _emailController.text,
          _nameController.text,
          _phoneController.text,
        );
      }
      print("Повторный ответ об УСПЕХЕ ОБНОВЛЕНИЯ ДАННЫХ");
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    final curUser = auth.getCurrentUser();

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
                '${curUser!.displayName}',
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
                validator: (val) {},
                controller: _nameController,
              ),
              BuildColumnWithTextFieldAndText(
                text: 'Email Adress',
                labelText: 'Enter New Email...',
                validator: (val) {},
                controller: _emailController,
              ),
              // BuildColumnWithTextFieldAndText(
              //   text: 'Password',
              //   labelText: 'Enter New Password',
              //   validator: (val) {},
              //   controller: null,
              // ),
              BuildColumnWithTextFieldAndText(
                text: 'Mobile Number',
                labelText: 'Enter New Mobile Number',
                validator: (val) {},
                controller: _phoneController,
              ),
            ],
          ),
          ProfileButton(
            onTap: () async {
              updateUserData();
              await Navigator.pushAndRemoveUntil(
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
