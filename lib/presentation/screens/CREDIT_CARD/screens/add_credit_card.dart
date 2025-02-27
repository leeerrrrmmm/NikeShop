import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:holdable_button/holdable_button.dart';
import 'package:holdable_button/utils/utils.dart';
import 'package:nike_e_shop/data/models/credit_card_model.dart';
import 'package:nike_e_shop/extension/size_extension.dart';
import 'package:nike_e_shop/presentation/bloc/user_cards_bloc/bloc/user_card_bloc.dart';
import 'package:nike_e_shop/presentation/screens/BOTTOM_BAR/custom_bottom_bar.dart';
import 'package:nike_e_shop/presentation/screens/CREDIT_CARD/widgets/add_card_button.dart';
import 'package:nike_e_shop/presentation/screens/CREDIT_CARD/widgets/card_field.dart';
import 'package:vibration/vibration.dart';

class AddCreditCardScreen extends StatefulWidget {
  const AddCreditCardScreen({super.key});

  @override
  State<AddCreditCardScreen> createState() => _AddCreditCardScreenState();
}

class _AddCreditCardScreenState extends State<AddCreditCardScreen> {
  String buttonText = 'Add';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  late final TextEditingController _numberCard = TextEditingController();
  late final TextEditingController _dateCard = TextEditingController();
  late final TextEditingController _cvvCard = TextEditingController();
  late final TextEditingController _cadrHolder = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add your card'), centerTitle: true),
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                CreditCardWidget(
                  floatingConfig: FloatingConfig(
                    isGlareEnabled: true,
                    isShadowEnabled: true,
                    shadowConfig: FloatingShadowConfig(
                      offset: Offset(10, 10),
                      color: Colors.black87,
                      blurRadius: 15,
                    ),
                  ),
                  isHolderNameVisible: true,
                  cardType: CardType.mastercard,
                  enableFloatingCard: true,
                  cardNumber: _numberCard.text,
                  expiryDate: _dateCard.text,
                  cardHolderName: _cadrHolder.text,
                  cvvCode: _cvvCard.text,
                  showBackView: false,
                  onCreditCardWidgetChange: (CreditCardBrand? data) {},
                ),
                10.hBox,

                /// CARD NUM
                CardField(
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please, fill this line';
                    } else if (val.length < 16) {
                      return 'Card Number must be at least 16 characters';
                    } else {
                      return null;
                    }
                  },
                  hintText: 'Enter your card number..',
                  labelText: 'Card Number',
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(19),
                  ],
                  onChanget: (str) {
                    setState(() {
                      _numberCard.text = str;
                    });
                  },
                ),
                30.hBox,

                /// EXPIRED DATE AND CVV
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///DATE
                    Expanded(
                      child: CardField(
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return 'Введите срок действия';
                          if (!RegExp(
                            r'^(0[1-9]|1[0-2])\/\d{2}$',
                          ).hasMatch(val)) {
                            return 'Введите корректный срок действия (MM/YY)';
                          }
                          return null;
                        },
                        hintText: 'MM/YY',
                        labelText: 'Expired Date',
                        onChanget: (str) {
                          setState(() {
                            _dateCard.text = str;
                          });
                        },
                        inputFormatters: [ExpiryDateFormatter()],
                        keyboardType: TextInputType.number,
                      ),
                    ),

                    //CVV
                    Expanded(
                      child: CardField(
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter the cvv code';
                          } else if (val.length < 3) {
                            return 'CVV must be at least 3 characters';
                          } else {
                            return null;
                          }
                        },
                        hintText: 'Enter your cvv..',
                        labelText: 'CVV',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        onChanget: (str) {
                          setState(() {
                            _cvvCard.text = str;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                30.hBox,

                /// CARD HOLDER
                CardField(
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter the cardholder name';
                    }
                    if (!RegExp(r"^[A-Za-z]+(?: [A-Za-z]+)*$").hasMatch(val)) {
                      return 'Enter first and last name in Latin letters';
                    }
                    if (val.length < 2 || val.length > 26) {
                      return 'Name must be between 2 and 26 characters';
                    }
                    return null;
                  },
                  hintText: 'Enter your name..',
                  labelText: 'Card Holder',
                  onChanget: (str) {
                    setState(() {
                      _cadrHolder.text = str;
                    });
                  },
                ),
              ],
            ),
            BlocBuilder<UserCardBloc, UserCardState>(
              builder: (context, state) {
                return AddCardButtons(
                  onTap: () {
                    if (_globalKey.currentState!.validate()) {
                      context.read<UserCardBloc>().add(
                        AddCreditCard(
                          UserCreditCardModel(
                            cardId: _auth.currentUser!.uid,
                            cardNumber: _numberCard.text,
                            cvv: _cvvCard.text,
                            date: _dateCard.text,
                            cardHolder: _cadrHolder.text,
                          ),
                        ),
                      );

                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => CustomBottomBars(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                );
              },
            ),

            HoldableButton(
              loadingType: LoadingType.fillingLoading,
              buttonColor: Colors.indigo,
              loadingColor: Colors.green.shade900,
              duration: 2,
              radius: 10,
              onConfirm: () async {
                if (await Vibration.hasVibrator()) {
                  Vibration.vibrate(duration: 200);
                }
                setState(() {
                  buttonText = 'Successfuly added!';
                });
                print('finis');
              },
              child: Text(buttonText, style: TextStyle(color: Colors.white)),
              strokeWidth: 3,
              width: double.infinity,
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.length > 4) {
      text = text.substring(0, 4);
    }

    String formattedText = text;
    if (text.length >= 2) {
      formattedText = '${text.substring(0, 2)}/${text.substring(2)}';
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
