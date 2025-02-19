import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_sneakers_store/extension/size_extension.dart';
import 'package:nike_sneakers_store/presentation/BOTTOM_BAR/custom_bottom_bar.dart';
import 'package:nike_sneakers_store/presentation/LOGIN/login_screen.dart';
import 'package:nike_sneakers_store/presentation/REGISTER/widgets/build_text_editing_column.dart';
import 'package:nike_sneakers_store/presentation/REGISTER/widgets/my_second_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _nameController = TextEditingController();
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Register Account',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                10.hBox,
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 320,
                    height: 55,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Fill Your Details Or Continue With Social Media',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                BuildTextEditingColumn(
                  labelText: 'Your Name',
                  text: 'Enter Your Name...',
                  obscure: false,
                  keyBoardType: TextInputType.text,
                  textController: _nameController,
                ),
                15.hBox,
                BuildTextEditingColumn(
                  labelText: 'Email Adress',
                  text: 'Enter Your Email...',
                  obscure: false,
                  keyBoardType: TextInputType.text,
                  textController: _emailController,
                ),
                15.hBox,
                BuildTextEditingColumn(
                  labelText: 'Password',
                  text: 'Enter Your Password...',
                  obscure: true,
                  keyBoardType: TextInputType.text,
                  textController: _passwordController,
                ),
                20.hBox,
                MySecondButton(
                  color: Color(0xFF0D6EFD),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => CustomBottomBars(),
                      ),
                      (route) => false,
                    );
                  },
                ),
                MySecondButton(
                  imagePath: 'asset/image/google.png',
                  onTap: () {},
                ),
                10.hBox,
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(builder: (context) => LoginScreen()),
                      (route) => false,
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      text: 'Already Have An Coount?',
                      children: [
                        TextSpan(
                          text: '\tLog In',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
