import 'package:flutter/material.dart';

class BuildTextEditingColumn extends StatefulWidget {
  final String labelText;
  final String text;
  final bool obscure;
  final TextInputType keyBoardType;
  final TextEditingController textController;
  final String? Function(String?)? validator;

  const BuildTextEditingColumn({
    super.key,
    required this.labelText,
    required this.text,
    required this.obscure,
    required this.keyBoardType,
    required this.textController,
    required this.validator,
  });

  @override
  State<BuildTextEditingColumn> createState() => _BuildTextEditingColumnState();
}

class _BuildTextEditingColumnState extends State<BuildTextEditingColumn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
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
            validator: widget.validator,
            controller: widget.textController,
            obscureText: widget.obscure,
            decoration: InputDecoration(
              label: Text(widget.text),
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
