part of 'user_card_bloc.dart';

@immutable
sealed class UserCardEvent {}

class AddCreditCard extends UserCardEvent {
  final UserCreditCardModel creditCard;
  AddCreditCard(this.creditCard);
}

class RemoveCreditCard extends UserCardEvent {
  final UserCreditCardModel creditCard;
  RemoveCreditCard(this.creditCard);
}

class CreditCardLoadedEvent extends UserCardEvent {}
