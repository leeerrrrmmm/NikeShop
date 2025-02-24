part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent {}

class AddToFavorite extends FavoriteEvent {
  final ShoesModel shoes;
  AddToFavorite(this.shoes);
}

class RemoveFromFavorite extends FavoriteEvent {
  final ShoesModel shoes;

  RemoveFromFavorite(this.shoes);
}

class LoadFavorites extends FavoriteEvent {}
