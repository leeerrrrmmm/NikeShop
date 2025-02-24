import 'package:flutter/material.dart';

class BuildSecondPageview extends StatelessWidget {
  const BuildSecondPageview({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 110,
          left: 30,
          child: Image.asset('asset/image/hi.png'),
        ),
        Positioned(
          bottom: 110,
          left: 0,
          child: Image.asset('asset/image/brand.png'),
        ),
        Positioned(
          top: 100,
          left: 10,
          child: Image.asset('asset/image/nenike.png'),
        ),
        Positioned(
          top: 80,
          right: 60,
          child: Image.asset('asset/image/smile.png'),
        ),
        Positioned(
          top: 380,
          left: 40,
          child: SizedBox(
            width: 345,
            height: 110,
            child: Text(
              textAlign: TextAlign.center,
              "Let's Start Journey With Nike",
              style: TextStyle(
                fontSize: 34,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 200,
          left: 40,
          child: SizedBox(
            width: 345,
            height: 110,
            child: Text(
              textAlign: TextAlign.center,
              "Smart, Gorgeous & Fashionable Collection Explor Now",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
