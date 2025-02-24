import 'package:flutter/material.dart';
import 'package:nike_e_shop/data/models/shoes_model.dart';

class ShowCurrentImage extends StatelessWidget {
  const ShowCurrentImage({
    super.key,
    required this.shoes,
    required this.imageIndex,
  });

  final ShoesModel shoes;
  final int imageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(shoes.imageUrl[imageIndex])),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 20,
            child: Text(
              '${imageIndex + 1} / ${shoes.imageUrl.length}',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
