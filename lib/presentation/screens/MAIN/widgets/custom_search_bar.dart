import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 300,
          height: 50,
          child: TextField(
            // controller
            decoration: InputDecoration(
              prefixIcon: Icon(CupertinoIcons.search),
              label: Text('Looking for shoes'),
              labelStyle: TextStyle(fontFamily: 'Raleway', fontSize: 18),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {}, // Заглушка( будет реализована)
          child: CircleAvatar(
            backgroundColor: Color(0xFF0D6EFD),
            radius: 35,
            child: Center(
              child: Icon(Icons.tune_rounded, color: Colors.white, size: 30),
            ),
          ),
        ),
      ],
    );
  }
}
