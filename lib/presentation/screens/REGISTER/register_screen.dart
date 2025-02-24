import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/domain/auth_service.dart';
import 'package:nike_e_shop/extension/size_extension.dart';
import 'package:nike_e_shop/presentation/screens/BOTTOM_BAR/custom_bottom_bar.dart';
import 'package:nike_e_shop/presentation/screens/LOGIN/login_screen.dart';
import 'package:nike_e_shop/presentation/screens/REGISTER/widgets/build_text_editing_column.dart';
import 'package:nike_e_shop/presentation/screens/REGISTER/widgets/my_second_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController = TextEditingController();
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  void register() async {
    final _authService = AuthService();
    try {
      _authService.registerWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
        _nameController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
    }

    if (_authService != null) {
      Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => CustomBottomBars()),
        (route) => false,
      );
    } else {
      showDialog(
        context: context,
        builder:
            (contexgt) => AlertDialog(title: Text('User already registered')),
      );
    }
  }

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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      BuildTextEditingColumn(
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter name';
                          } else if (val.length < 6) {
                            return 'Name must be at least 6 characters';
                          }
                          return null;
                        },
                        labelText: 'Your Name',
                        text: 'Enter Your Name...',
                        obscure: false,
                        keyBoardType: TextInputType.text,
                        textController: _nameController,
                      ),
                      15.hBox,
                      BuildTextEditingColumn(
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
                        labelText: 'Email Address',
                        text: 'Enter Your Email...',
                        obscure: false,
                        keyBoardType: TextInputType.emailAddress,
                        textController: _emailController,
                      ),
                      15.hBox,
                      BuildTextEditingColumn(
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
                      20.hBox,
                      MySecondButton(
                        color: Color(0xFF0D6EFD),
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            register();
                          }
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
                            CupertinoPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
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
                            text: 'Already Have An Account?',
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
