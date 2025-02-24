import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/presentation/screens/FAVORITES/favorite_screen.dart';

class BottomRowWidgets extends StatelessWidget {
  const BottomRowWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => FavoriteScreen()),
            );
          },
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade100,
            radius: 35,
            child: Icon(CupertinoIcons.heart, size: 30),
          ),
        ),
        Container(
          width: 230,
          height: 52,
          decoration: BoxDecoration(
            color: Color(0xff0d6efd),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(CupertinoIcons.bag, color: Colors.white),
              Text(
                'Add To Cart',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
