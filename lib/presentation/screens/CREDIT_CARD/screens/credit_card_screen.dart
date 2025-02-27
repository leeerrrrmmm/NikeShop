import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:nike_e_shop/data/models/credit_card_model.dart';
import 'package:nike_e_shop/domain/auth/auth_service.dart';
import 'package:nike_e_shop/presentation/screens/CREDIT_CARD/screens/add_credit_card.dart';
import 'package:nike_e_shop/presentation/screens/CREDIT_CARD/widgets/add_card_button.dart';

class CreditCardScreen extends StatelessWidget {
  const CreditCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthService();
    final curUser = auth.getCurrentUser();

    Future<List<UserCreditCardModel>> fetchUserData(String userId) async {
      List<UserCreditCardModel> userCards = [];
      try {
        var usersDoc =
            await FirebaseFirestore.instance
                .collection('Users')
                .doc(userId)
                .collection('UserCreditCards')
                .get();

        for (var el in usersDoc.docs) {
          userCards.add(UserCreditCardModel.creditFromMap(el.data()));
        }
      } catch (e) {
        print('Ошибка: $e');
      }
      return userCards;
    }

    return Scaffold(
      appBar: AppBar(title: Text("Your credit card"), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: fetchUserData(curUser!.uid),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snap.hasError) {
                  return Center(child: Text(snap.error.toString()));
                }

                return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, index) {
                    final card = snap.data![index];
                    return CreditCardWidget(
                      isHolderNameVisible: true,
                      cardNumber: card.cardNumber,
                      expiryDate: card.date,
                      cardHolderName: card.cardHolder,
                      cvvCode: card.cvv,
                      showBackView: false,
                      onCreditCardWidgetChange: (val) {},
                    );
                  },
                );
              },
            ),
          ),

          AddCardButtons(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => AddCreditCardScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
