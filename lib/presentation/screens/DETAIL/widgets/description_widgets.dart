import 'package:flutter/material.dart';
import 'package:nike_e_shop/data/models/shoes_model.dart';
import 'package:nike_e_shop/extension/size_extension.dart';

class DescriptionWidgets extends StatelessWidget {
  final ShoesModel shoes;
  const DescriptionWidgets({super.key, required this.shoes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        10.hBox,
        Text(
          shoes.description,
          style: TextStyle(fontSize: 16, fontFamily: 'Raleway'),
        ),
      ],
    );
  }
}
