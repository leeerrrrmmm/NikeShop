import 'package:flutter/material.dart';

class BuildColumnWithTextFieldAndText extends StatelessWidget {
  final String text;
  final String labelText;

  const BuildColumnWithTextFieldAndText({
    super.key,
    required this.text,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              textAlign: TextAlign.center,
              labelText,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
