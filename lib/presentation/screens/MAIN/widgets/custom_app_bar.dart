import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? onPressed;
  const CustomAppBar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(onPressed: onPressed, icon: Icon(Icons.menu, size: 30)),
            Row(
              children: [
                Image.asset('asset/image/smile.png', color: Colors.black),
                Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bag)),
          ],
        ),
      ),
    );
  }
}
