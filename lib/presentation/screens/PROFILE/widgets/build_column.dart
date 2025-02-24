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
          TextField(
            decoration: InputDecoration(
              label: Text(labelText, style: TextStyle(fontSize: 18)),
              labelStyle: TextStyle(fontFamily: 'Raleway'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
