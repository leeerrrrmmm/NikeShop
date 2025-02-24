import 'package:flutter/material.dart';
import 'package:nike_e_shop/extension/size_extension.dart';

class MySecondButton extends StatelessWidget {
  final Color? color;
  final String? imagePath;
  final void Function()? onTap;

  const MySecondButton({
    super.key,
    this.color,
    this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
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
                      'Sign Up',
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
        ),
      ),
    );
  }
}
