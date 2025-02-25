import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nike_e_shop/data/models/shoes_model.dart';
import 'package:nike_e_shop/domain/favorite_cart_checkout/favorite_db.dart';

class CartDb {
  final FirebaseFirestore _firesbase = FirebaseFirestore.instance;

  Future<void> addCartItemToFirebase(String userId, ShoesModel shoes) async {
    try {
      await _firesbase
          .collection('Users')
          .doc(userId)
          .collection('CartItem')
          .add(shoes.toMapp());
    } catch (e) {
      print('Ошибка добавления фильма: $e');
    }
  }

  Future<void> removeCartItemFromFirestore(
    String userId,
    ShoesModel shoes,
  ) async {
    try {
      QuerySnapshot querySnapshot =
          await _firesbase
              .collection('Users')
              .doc(userId)
              .collection('CartItem')
              .where('title', isEqualTo: shoes.title)
              .get();

      for (var el in querySnapshot.docs) {
        await el.reference.delete();
      }

      print('Пара обуви успешно удалена из FIREBASE');
    } catch (e) {
      print('Ошибка удаления из FIREBASE: $e');
    }
  }

  Future<List<ShoesModel>> fetchCartItemsFromFirestore(String userId) async {
    try {
      QuerySnapshot querySnapshot =
          await _firesbase
              .collection('Users')
              .doc(userId)
              .collection('CartItem')
              .get();

      return querySnapshot.docs
          .map((doc) => ShoesModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Ошибка при получении избранных товаров: $e');
      return [];
    }
  }
}

extension ShoesModelMapper on ShoesModel {
  Map<String, dynamic> toMapp() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'rate': rate,
      'size': size,
      'imageUrl': imageUrl,
      'likedAt': FieldValue.serverTimestamp(),
    };
  }
}
