part of 'not_bloc.dart';

@immutable
sealed class NotEvent {}

class LoadNotItem extends NotEvent {}

class AddItemToNot extends NotEvent {
  final List<ShoesModel> items;
  AddItemToNot(this.items);
}
