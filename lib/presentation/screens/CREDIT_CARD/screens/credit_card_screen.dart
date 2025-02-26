import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/presentation/screens/CREDIT_CARD/screens/add_credit_card.dart';

class CreditCardScreen extends StatelessWidget {
  const CreditCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your credit card"), centerTitle: true),
      body: Center(
        child: TextButton(
          child: Text('Add cart', style: TextStyle(fontSize: 30)),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => AddCreditCardScreen()),
            );
          },
        ),
      ),
    );
  }
}
