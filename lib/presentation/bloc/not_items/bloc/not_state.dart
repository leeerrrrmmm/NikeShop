part of 'not_bloc.dart';

@immutable
sealed class NotState {}

final class NotInitial extends NotState {
  final List<ShoesModel> notItems;

  NotInitial({this.notItems = const []});
}
