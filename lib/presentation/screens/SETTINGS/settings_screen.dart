import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/domain/auth/auth_service.dart';
import 'package:nike_e_shop/presentation/screens/CREDIT_CARD/screens/credit_card_screen.dart';
import 'package:nike_e_shop/presentation/screens/LOGIN/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() async {
      final auth = AuthService();
      try {
        if (auth.getCurrentUser() != null) {
          await auth.logout();

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false,
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error during logout')));
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Settings'), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => CreditCardScreen()),
              );
            },
            child: Row(
              children: [
                Icon(Icons.payment, size: 40),
                Text('Payment', style: TextStyle(fontSize: 25)),
              ],
            ),
          ),
          TextButton(
            onPressed: logout,
            child: Text('Exit', style: TextStyle(fontSize: 25)),
          ),
        ],
      ),
    );
  }
}
