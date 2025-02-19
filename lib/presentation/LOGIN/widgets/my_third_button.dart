import 'package:flutter/material.dart';
import 'package:nike_sneakers_store/extension/size_extension.dart';

class MyThirdButton extends StatelessWidget {
  final Color? color;
  final String? imagePath;

  const MyThirdButton({super.key, this.color, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child:
          imagePath == null
              ? Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(imagePath ?? ''),
                  15.wBox,
                  Text(
                    'Sign Up With Google',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
    );
  }
}
