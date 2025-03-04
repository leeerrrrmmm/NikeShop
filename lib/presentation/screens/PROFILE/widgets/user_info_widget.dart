import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final String topText;
  final String userInfo;
  const UserInfoWidget({
    super.key,
    required this.topText,
    required this.userInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            topText,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Raleway',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 10.0),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black),
            ),
            child: Text(
              userInfo,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
