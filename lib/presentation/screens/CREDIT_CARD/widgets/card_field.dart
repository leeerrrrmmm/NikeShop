import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardField extends StatefulWidget {
  final String? Function(String?)? validator;
  final void Function(String)? onChanget;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String hintText;
  final String labelText;

  const CardField({
    super.key,
    required this.validator,
    required this.hintText,
    required this.labelText,
    required this.onChanget,
    this.inputFormatters,
    this.keyboardType,
  });

  @override
  State<CardField> createState() => _CardFieldState();
}

class _CardFieldState extends State<CardField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        onChanged: widget.onChanget,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          label: Text(widget.labelText),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
