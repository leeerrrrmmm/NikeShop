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

class RemoveAllItemFromCart extends CartBlocEvent {
  final List<ShoesModel> shoesList;

  RemoveAllItemFromCart(this.shoesList);
}

class LoadCartsItem extends CartBlocEvent {}
