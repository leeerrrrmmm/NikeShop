import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<bool> checkIfUserExists(String email) async {
    try {
      var result = await _auth.fetchSignInMethodsForEmail(email);
      return result.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
    String displayName,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Обновляем displayName
      await userCredential.user?.updateDisplayName(displayName);
      await userCredential.user?.updatePassword(password);
      await userCredential.user?.reload(); // Перезагружаем пользователя

      // Получаем обновленного пользователя
      User? user = _auth.currentUser;

      await _firestore.collection('Users').doc(user!.uid).set({
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName,
        'password': password,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('Ошибка регистрации: ${e.code}');
    } catch (e) {
      throw Exception('Произошла ошибка: $e');
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _firestore.collection('Users').doc(userCredential.user!.uid).update({
        'lastLogin': FieldValue.serverTimestamp(),
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('Ошибка входа: ${e.code}');
    }
  }

  Future<UserCredential?> registerGoogle() async {
    try {
      /// НАЧИНАЕМ ПРОЦЕСС ВХОДА ЧЕРЕЗ ГУГЛ
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      /// ЕСЛИ ЮЗЕР ОТМЕНИЛ ВХОД
      if (gUser == null) return null;

      /// ПОЛУЧАЕМ ДАННЫЕ АВТОРИЗАЦИИ ОТ ГУГЛ
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      /// Создаем данные для FIREBASE
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // ВЫПОЛНЯЕМ ВХОД FIREBASE
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      ///  ПРОВЕРЯЕМ ЕСТЬ-ЛИ ЮЗЕР В БД
      final userDoc =
          await _firestore
              .collection('Users')
              .doc(userCredential.user!.uid)
              .get();

      if (userDoc.exists) {
        /// если записи нет создаем новую
        await _firestore.collection('Users').doc(userCredential.user!.uid).set({
          'uid': userCredential.user!.uid,
          'email': userCredential.user!.email,
          'name': userCredential.user!.displayName ?? 'Anonymous',
          'photoUrl': userCredential.user!.photoURL,
          'phoneNumber': userCredential.user!.phoneNumber,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential?> loginWithGoogle() async {
    try {
      // Начинаем процесс входа через Google
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) return null; // Если пользователь отменил вход

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Входим в Firebase с помощью полученных данных
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      // Проверка, существует ли пользователь в базе данных Firestore
      final userDoc =
          await _firestore
              .collection('Users')
              .doc(userCredential.user!.uid)
              .get();

      if (!userDoc.exists) {
        // Если пользователя нет в базе данных -> выбрасываем ошибку
        throw Exception("Пользователь не найден в базе данных.");
      }

      // Если пользователь существует, возвращаем учетные данные
      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception('Ошибка авторизации через Google: ${e.code}');
    } catch (e) {
      throw Exception('Произошла ошибка: $e');
    }
  }

  Future<void> deleteUser() async {
    User? user = _auth.currentUser;

    if (user != null) {
      ///DELETE FROM FIREBASE

      await _firestore.collection('Users').doc(user.uid).delete();

      ///DELETE FROM AUTH
      await user.delete();
    }
  }

  Future<void> logout() async {
    return await _auth.signOut();
  }

  String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'Exception wrong-password':
        return 'The password is incorrect. Please try again';
      case 'Exception user-not-found':
        return 'No user fount with this email. Please sign in';
      case 'Exception email does not exist':
        return 'This email does not exist';
      default:
        return 'An unexpected error occured. Pleasy try again later.';
    }
  }
}
