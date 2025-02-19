import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_sneakers_store/data/shoes_model.dart';
import 'package:nike_sneakers_store/extension/size_extension.dart';

class ItemCard extends StatelessWidget {
  final ShoesModel shoes;

  const ItemCard({super.key, required this.shoes});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.network(shoes.imageUrl[0]),
                10.hBox,
                Text(
                  textAlign: TextAlign.center,
                  shoes.title,
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${shoes.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF0d6efd),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Icon(CupertinoIcons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
