import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/domain/auth/auth_service.dart';
import 'package:nike_e_shop/presentation/screens/BOTTOM_BAR/custom_bottom_bar.dart';
import 'package:nike_e_shop/presentation/screens/LOGIN/login_screen.dart';
import 'package:nike_e_shop/presentation/screens/SPLASH/splash_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService().getCurrentUser();

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snap.hasError) {
            return Center(child: Text('An error occurred. Please try again.'));
          }

          if (snap.hasData) {
            var user = FirebaseAuth.instance.currentUser;
            if (user != null && auth != null && user.uid == auth.uid) {
              return CustomBottomBars();
            } else {
              return LoginScreen();
            }
          } else {
            return SplashScreen();
          }
        },
      ),
    );
  }
}
