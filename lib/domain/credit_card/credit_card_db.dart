import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nike_e_shop/data/models/credit_card_model.dart';

class CreditCardDb {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  Future<void> addCreditCardToCurrentUser(
    String userId,
    UserCreditCardModel creditCard,
  ) async {
    try {
      _firebase
          .collection('Users')
          .doc(userId)
          .collection('UserCreditCards')
          .add(creditCard.cardToMap());
      print('Карта успешно добавлена пользователю :)');
    } catch (e) {
      print('Ошибка добавления карты пользователя: $e');
    }
  }

  Future<void> removeCreditCardFromCurUser(
    String userId,
    UserCreditCardModel creditCard,
  ) async {
    try {
      QuerySnapshot snap =
          await _firebase
              .collection('Users')
              .doc(userId)
              .collection('UserCreditCards')
              .where('cardNum', isEqualTo: creditCard.cardNumber)
              .get();

      for (var el in snap.docs) {
        el.reference.delete();
      }
      print('Карта успешно удалена');
    } catch (e) {
      print('Ошибка удаления карты пользователя: $e');
    }
  }

  Future<List<UserCreditCardModel>> fetchCreditCardsFromFirestore(
    String userId,
  ) async {
    try {
      QuerySnapshot snap =
          await _firebase
              .collection('Users')
              .doc(userId)
              .collection('UserCreditCards')
              .get();
      return snap.docs
          .map(
            (el) => UserCreditCardModel.creditFromMap(
              el.data() as Map<String, dynamic>,
            ),
          )
          .toList();
    } catch (e) {
      print('Ошибка загрузки карт пользователя: $e');
      return [];
    }
  }
}

extension CreditCardMapper on UserCreditCardModel {
  Map<String, dynamic> cardToMap() {
    return {
      'cardId': cardId,
      'cardNumber': cardNumber,
      'cvv': cvv,
      'date': date,
      'cardHolder': cardHolder,
    };
  }
}
