import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nike_e_shop/domain/auth/auth_service.dart';

class UpdateUser {
  final FirebaseFirestore _firesbase = FirebaseFirestore.instance;

  Future<void> updateUserData(
    String userId,
    String email,
    String name,
    String phone,
  ) async {
    final AuthService _auth = AuthService();
    final curUser = _auth.getCurrentUser();
    try {
      if (curUser != null) {
        _firesbase.collection('Users').doc(userId).update({
          'email': email,
          'displayName': name,
          'phone': phone,
        });
      }
      print('Успешное обновление данных:)');
    } catch (e) {
      print('Ощибка обновление данных:$e');
    }
  }

  Future<void> updateUserImg(String userId, String img) async {
    final AuthService _auth = AuthService();
    final curUser = _auth.getCurrentUser();

    try {
      if (curUser != null) {
        _firesbase.collection('Users').doc(userId).update({'userImg': img});
      }

      print('Успешное обновление данных:)');
    } catch (e) {
      print('Ощибка обновление данных:$e');
    }
  }
}
