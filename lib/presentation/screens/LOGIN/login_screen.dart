import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/domain/auth_service.dart';
import 'package:nike_e_shop/extension/size_extension.dart';
import 'package:nike_e_shop/presentation/screens/BOTTOM_BAR/custom_bottom_bar.dart';
import 'package:nike_e_shop/presentation/screens/LOGIN/widgets/build_text_editing_login_column.dart';
import 'package:nike_e_shop/presentation/screens/LOGIN/widgets/my_third_button.dart';
import 'package:nike_e_shop/presentation/screens/REGISTER/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() async {
    final _authService = AuthService();
    try {
      final userCredential = await _authService.loginWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );

      if (userCredential.user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => CustomBottomBars()),
          (route) => false,
        );
      } else {
        throw Exception('Auth Failed');
      }
    } catch (e) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text(' Error'),
              content: Text(_authService.getErrorMessage(e.toString())),
            ),
      );
    }
  }

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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        15.hBox,
                        BuildTextEditingLoginColumn(
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Введите email';
                            }
                            final emailRegExp = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                            );

                            if (!emailRegExp.hasMatch(val)) {
                              return 'Введите корректный email';
                            }
                            return null;
                          },
                          labelText: 'Email Adress',
                          text: 'Enter Your Email...',
                          obscure: false,
                          keyBoardType: TextInputType.text,
                          textController: _emailController,
                        ),
                        15.hBox,
                        BuildTextEditingLoginColumn(
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter password';
                            } else if (val.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          labelText: 'Password',
                          text: 'Enter Your Password...',
                          obscure: true,
                          keyBoardType: TextInputType.text,
                          textController: _passwordController,
                        ),
                      ],
                    ),
                  ),
                  20.hBox,
                  MyThirdButton(
                    color: Color(0xFF0D6EFD),
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        login();
                      }
                    },
                  ),
                  MyThirdButton(
                    imagePath: 'asset/image/google.png',
                    onTap: () {},
                  ),
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
