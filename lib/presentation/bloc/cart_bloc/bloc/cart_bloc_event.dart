part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocEvent {}

class AddItemToCart extends CartBlocEvent {
  final ShoesModel shoe;

  AddItemToCart(this.shoe);
}

class RemoveItemFtomCart extends CartBlocEvent {
  final ShoesModel shoes;

  RemoveItemFtomCart(this.shoes);
}

class LoadCartsItem extends CartBlocEvent {}
