import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/presentation/screens/ONBOARDING/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        // Проверяем, что виджет всё ещё в дереве
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => OnboardingScreen()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D6EFD),
      body: Center(child: Image.asset('asset/image/splash.png')),
    );
  }
}
