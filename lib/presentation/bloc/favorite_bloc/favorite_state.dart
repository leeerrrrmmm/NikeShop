part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

class FavoritesLoaded extends FavoriteState {
  final List<ShoesModel> favorites;

  FavoritesLoaded({this.favorites = const []});
}
