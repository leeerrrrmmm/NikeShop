import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_sneakers_store/extension/size_extension.dart';
import 'package:nike_sneakers_store/presentation/LOGIN/widgets/build_text_editing_login_column.dart';
import 'package:nike_sneakers_store/presentation/LOGIN/widgets/my_third_button.dart';
import 'package:nike_sneakers_store/presentation/REGISTER/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Hello Again!',
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
                  15.hBox,
                  BuildTextEditingLoginColumn(
                    labelText: 'Email Adress',
                    text: 'Enter Your Email...',
                    obscure: false,
                    keyBoardType: TextInputType.text,
                    textController: _emailController,
                  ),
                  15.hBox,
                  BuildTextEditingLoginColumn(
                    labelText: 'Password',
                    text: 'Enter Your Password...',
                    obscure: true,
                    keyBoardType: TextInputType.text,
                    textController: _passwordController,
                  ),
                  20.hBox,
                  MyThirdButton(color: Color(0xFF0D6EFD)),
                  MyThirdButton(imagePath: 'asset/image/google.png'),
                ],
              ),
              10.hBox,
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        (CupertinoPageRoute(
                          builder: (context) => RegisterScreen(),
                        )),
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
                        text: 'New User?',
                        children: [
                          TextSpan(
                            text: '\tCreate Account',
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
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
