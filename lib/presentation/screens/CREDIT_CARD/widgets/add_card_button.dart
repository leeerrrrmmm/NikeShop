import 'package:flutter/material.dart';

class AddCardButtons extends StatelessWidget {
  final void Function()? onTap;

  const AddCardButtons({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 23, 88, 193),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 2, color: Colors.green),
          ),
          child: Center(
            child: Text(
              'Add Card',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
