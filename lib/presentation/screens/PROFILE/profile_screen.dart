import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/domain/auth/auth_service.dart';
import 'package:nike_e_shop/presentation/screens/PROFILE/UPDATE_PROFILE/update_profile_screen.dart';
import 'package:nike_e_shop/presentation/screens/PROFILE/widgets/build_column.dart';
import 'package:nike_e_shop/presentation/screens/PROFILE/widgets/profile_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    final curUser = auth.getCurrentUser();

    // Функция для получения данных пользователя из Firestore
    Future<String> getUserPassword(String userId) async {
      try {
        // Получаем данные пользователя из Firestore по userId
        var userDoc =
            await FirebaseFirestore.instance
                .collection('Users')
                .doc(userId)
                .get();
        if (userDoc.exists) {
          // Предположим, что поле password хранит пароль
          return userDoc.data()?['password'] ?? '';
        }
      } catch (e) {
        print("Ошибка при получении пароля: $e");
      }
      return '';
    }

    return Scaffold(
      body: FutureBuilder<String>(
        future: getUserPassword(
          curUser!.uid,
        ), // Замените на реальный id пользователя
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          }

          // Получаем длину пароля
          final passwordLength = snapshot.data?.length ?? 0;

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Image.asset('asset/image/nig.png'),
                  ),
                  Text(
                    curUser.displayName ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  BuildColumnWithTextFieldAndText(
                    text: 'Your Name',
                    labelText: '${curUser.displayName}',
                  ),
                  BuildColumnWithTextFieldAndText(
                    text: 'Email Address',
                    labelText: '${curUser.email}',
                  ),
                  BuildColumnWithTextFieldAndText(
                    text: 'Password',
                    labelText: '*' * passwordLength,
                  ),
                ],
              ),
              ProfileButton(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => UpdateProfileScreen(),
                    ),
                  );
                },
                btnText: 'Update Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
