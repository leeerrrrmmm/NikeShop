import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/presentation/screens/ONBOARDING/widgets/build_first_page_view.dart';
import 'package:nike_e_shop/presentation/screens/ONBOARDING/widgets/build_second_page_view.dart';
import 'package:nike_e_shop/presentation/screens/ONBOARDING/widgets/build_third_page_view.dart';
import 'package:nike_e_shop/presentation/screens/ONBOARDING/widgets/my_button.dart';
import 'package:nike_e_shop/presentation/screens/REGISTER/register_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1483C2),
      body: SafeArea(
        bottom: true,
        child: Stack(
          children: <Widget>[
            PageView(
              controller: pageController,
              onPageChanged: (val) {
                setState(() {
                  onLastPage = (val == 2);
                });
              },
              children: [
                BuildFirstPageview(),
                BuildSecondPageview(),
                BuildThirdPageview(),
              ],
            ),
            Positioned(
              bottom: 160,
              right: 130,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: WormEffect(
                  dotWidth: 50,
                  dotHeight: 10,
                  dotColor: Color(0xFFFFB21A),
                  activeDotColor: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 10,
              child: MyButton(
                onTap: () {
                  if (onLastPage) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                      (route) => false,
                    );
                  } else {
                    pageController.nextPage(
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInOutCubicEmphasized,
                    );
                  }
                },
                text: onLastPage ? 'Get Started!' : 'Next',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
