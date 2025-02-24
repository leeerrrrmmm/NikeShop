import 'package:flutter/cupertino.dart';

class BuildFirstPageview extends StatelessWidget {
  const BuildFirstPageview({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 100,
          left: 90,
          child: Image.asset('asset/image/ef.png'),
        ),
        Positioned(
          top: 110,
          left: 90,
          child: SizedBox(
            width: 220,
            height: 90,
            child: Text(
              textAlign: TextAlign.center,
              'WELCOME TO NIKE',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFFECECEC),
              ),
            ),
          ),
        ),
        Positioned(
          top: 220,
          left: 133,
          child: Image.asset('asset/image/vector.png'),
        ),
        Positioned(
          bottom: 110,
          left: 0,
          child: Image.asset('asset/image/brand.png'),
        ),
        Positioned(
          top: 140,
          left: 60,
          child: Image.asset('asset/image/nike.png'),
        ),
        Positioned(
          bottom: 50,
          left: 60,
          child: Image.asset('asset/image/wow.png'),
        ),
      ],
    );
  }
}
