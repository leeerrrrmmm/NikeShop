import 'package:flutter/material.dart';

class BuildThirdPageview extends StatelessWidget {
  const BuildThirdPageview({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 150,
          left: 30,
          child: Image.asset('asset/image/bigSmile.png'),
        ),
        Positioned(
          top: 60,
          right: 30,
          child: Image.asset('asset/image/smile.png'),
        ),
        Positioned(
          bottom: 110,
          left: 0,
          child: Image.asset('asset/image/brand.png'),
        ),
        Positioned(
          top: 40,
          left: 10,
          child: Image.asset('asset/image/jordan.png'),
        ),
        Positioned(
          bottom: 300,
          left: 40,
          child: SizedBox(
            width: 345,
            height: 110,
            child: Text(
              textAlign: TextAlign.center,
              "You Have The Power Too",
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
          bottom: 170,
          left: 40,
          child: SizedBox(
            width: 345,
            height: 110,
            child: Text(
              textAlign: TextAlign.center,
              "There Are Many Beautiful And Attractive Plants To Your Room",
              style: TextStyle(
                fontSize: 16,
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
