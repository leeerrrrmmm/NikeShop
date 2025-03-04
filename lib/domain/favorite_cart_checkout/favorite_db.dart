import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nike_e_shop/data/models/shoes_model.dart';

class FavoriteDb {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  Future<void> addFavoriteToFirestore(String userId, ShoesModel shoes) async {
    try {
      await _firebase
          .collection('Users')
          .doc(userId)
          .collection('FavItems')
          .add(shoes.toMap());
    } catch (e) {
      print('Ошибка добавления фильма: $e');
    }
  }

  Future<void> removeFavoriteFromFirestore(
    String userId,
    ShoesModel shoes,
  ) async {
    try {
      QuerySnapshot querySnapshot =
          await _firebase
              .collection('Users')
              .doc(userId)
              .collection('FavItems')
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

  Future<List<ShoesModel>> fetchFavoriteItemsFromFirestore(
    String userId,
  ) async {
    try {
      QuerySnapshot querySnapshot =
          await _firebase
              .collection('Users')
              .doc(userId)
              .collection('FavItems')
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
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'rate': rate,
      'size': size,
      'imageUrl': imageUrl,
      'addetAt': FieldValue.serverTimestamp(),
    };
  }
}
