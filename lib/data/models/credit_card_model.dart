class UserCreditCardModel {
  final String cardId;
  final String cardNumber;
  final String cvv;
  final String date;
  final String cardHolder;

  UserCreditCardModel({
    required this.cardId,
    required this.cardNumber,
    required this.cvv,
    required this.date,
    required this.cardHolder,
  });

  factory UserCreditCardModel.creditFromMap(Map<String, dynamic> map) {
    return UserCreditCardModel(
      cardId: map['cardId'],
      cardNumber: map['cardNumber'],
      cvv: map['cvv'],
      date: map['date'],
      cardHolder: map['cardHolder'],
    );
  }
}
