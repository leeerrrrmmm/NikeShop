import 'package:flutter/material.dart';

class BuildTextEditingLoginColumn extends StatefulWidget {
  final String labelText;
  final String text;
  final bool obscure;
  final TextInputType keyBoardType;
  final TextEditingController textController;

  const BuildTextEditingLoginColumn({
    super.key,
    required this.labelText,
    required this.text,
    required this.obscure,
    required this.keyBoardType,
    required this.textController,
  });

  @override
  State<BuildTextEditingLoginColumn> createState() =>
      _BuildTextEditingLoginColumnState();
}

class _BuildTextEditingLoginColumnState
    extends State<BuildTextEditingLoginColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'Raleway',
            fontSize: 16,
          ),
        ),
        TextFormField(
          controller: widget.textController,
          obscureText: widget.obscure,
          decoration: InputDecoration(
            label: Text(widget.text),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
    );
  }
}
