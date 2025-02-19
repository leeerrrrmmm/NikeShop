import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final void Function()? onTap;
  final String btnText;

  const ProfileButton({super.key, required this.onTap, required this.btnText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFF0D6EFD),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              btnText,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
