import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nike_e_shop/data/models/shoes_model.dart';
import 'package:nike_e_shop/extension/map_extension.dart';

class NotDb {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  Future<void> addNotItemsToFirebase(
    String userId,
    List<ShoesModel> notItems,
  ) async {
    try {
      List<Map<String, dynamic>> mappedItems =
          notItems.map((item) => item.toMaps()).toList();

      for (var item in mappedItems) {
        await _firebase
            .collection('Users')
            .doc(userId)
            .collection('NotificationItems')
            .add(item);
      }
      print('Successfuly adding not items to FIREBASE');
    } catch (e) {
      print('Error adding not items to FIREBASE: $e');
    }
  }

  Future<List<ShoesModel>> fetchNottemsFromFirestore(String userId) async {
    try {
      QuerySnapshot querySnapshot =
          await _firebase
              .collection('Users')
              .doc(userId)
              .collection('NotificationItems')
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
