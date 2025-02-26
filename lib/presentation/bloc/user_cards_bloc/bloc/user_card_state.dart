part of 'user_card_bloc.dart';

@immutable
sealed class UserCardState {}

final class LoadedUserCard extends UserCardState {
  final List<UserCreditCardModel> userCreditCards;

  LoadedUserCard({this.userCreditCards = const []});
}
