import 'package:flutter/material.dart';

class BuildColumnWithTextFieldAndText extends StatefulWidget {
  final String text;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? obscureText;

  const BuildColumnWithTextFieldAndText({
    super.key,
    required this.text,
    required this.labelText,
    required this.validator,
    required this.controller,
    this.obscureText = false,
  });

  @override
  State<BuildColumnWithTextFieldAndText> createState() =>
      _BuildColumnWithTextFieldAndTextState();
}

class _BuildColumnWithTextFieldAndTextState
    extends State<BuildColumnWithTextFieldAndText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'Raleway',
              fontSize: 16,
            ),
          ),
          TextFormField(
            validator: widget.validator,
            controller: widget.controller,
            obscureText: widget.obscureText!,
            decoration: InputDecoration(
              label: Text(widget.labelText),
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
