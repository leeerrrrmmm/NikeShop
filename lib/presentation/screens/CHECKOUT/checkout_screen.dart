import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/data/models/credit_card_model.dart';
import 'package:nike_e_shop/domain/auth/auth_service.dart';
import 'package:nike_e_shop/extension/size_extension.dart';
import 'package:nike_e_shop/presentation/screens/BOTTOM_BAR/custom_bottom_bar.dart';
import 'package:nike_e_shop/presentation/screens/CHECKOUT/widget/bottom_widget.dart';

class CheckoutScreen extends StatefulWidget {
  final double subtotal;
  final double delivery;
  final double totalPrice;
  const CheckoutScreen({
    super.key,
    required this.subtotal,
    required this.delivery,
    required this.totalPrice,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String formatCardNumber(String cardNumber) {
    int length = cardNumber.length;
    if (length <= 8) {
      return cardNumber;
    }
    String visibleDigits = cardNumber.substring(length - 4);
    String hiddenDigits = '*' * (length - 4);
    return hiddenDigits + visibleDigits;
  }

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

  void showAlert() async {
    showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder:
          (context) => Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Image.asset('asset/image/win.png', scale: 1.7),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Your Payment Is Successfule',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Raleway',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => CustomBottomBars(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xff0d6edf),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Back to Shopping',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
    await Future.delayed(Duration(seconds: 5));

    Navigator.pop(context);

    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(builder: (context) => CustomBottomBars()),
      (route) => false,
    );
  }

  String? selectedDropDownButton;
  final curUser = AuthService().getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// CONTACT INFORMATION
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                top: 20.0,
                right: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact information',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        // EMAIL
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(CupertinoIcons.mail, size: 30),
                            // EMAIL
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  curUser!.email!,
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Email',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        20.hBox,
                        // PHONE
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(CupertinoIcons.phone, size: 30),
                            // Phone
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '+(380)98-805-50-87',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Phone',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// ADRESS
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                top: 20.0,
                right: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Adress (optional)',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  /// ADRESS
                  Padding(
                    padding: const EdgeInsets.only(right: 35.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ukrain',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(Icons.gps_fixed, color: Colors.grey),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      right: 20.0,
                      left: 10.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => CustomBottomBars(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://t4.ftcdn.net/jpg/01/24/27/05/360_F_124270591_CtuUNrS8u5uvyH9BFCLgSi4ayLeIzZj2.jpg',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// PAYMENT METHOD
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment method',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                      left: 15.0,
                      right: 40.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.payment, size: 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Selected Card',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                5.hBox,
                                FutureBuilder<List<UserCreditCardModel>>(
                                  future: fetchUserData(curUser!.uid),
                                  builder: (context, snap) {
                                    if (snap.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }

                                    if (snap.hasError) {
                                      return Center(
                                        child: Text('Error: ${snap.error}'),
                                      );
                                    }

                                    if (selectedDropDownButton == null &&
                                        snap.data!.isNotEmpty) {
                                      selectedDropDownButton =
                                          snap.data!.first.cardNumber;
                                    }

                                    return DropdownButton<String>(
                                      borderRadius: BorderRadius.circular(10),
                                      value: selectedDropDownButton,
                                      items:
                                          snap.data!
                                              .map(
                                                (card) =>
                                                    DropdownMenuItem<String>(
                                                      value: card.cardNumber,
                                                      child: Text(
                                                        formatCardNumber(
                                                          card.cardNumber,
                                                        ),
                                                      ),
                                                    ),
                                              )
                                              .toList(),
                                      onChanged: (String? val) {
                                        setState(() {
                                          selectedDropDownButton = val;
                                        });
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(Icons.downhill_skiing),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            20.hBox,
            BottomWidget(
              onTap: showAlert,
              subtotal: widget.subtotal,
              delivery: widget.delivery,
              total: widget.totalPrice,
            ),
            50.hBox,
          ],
        ),
      ),
    );
  }
}
