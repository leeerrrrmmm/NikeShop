part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocState {}

final class CartBlocInitial extends CartBlocState {}

class CartLoaded extends CartBlocState {
  final List<ShoesModel> cartShoes;

  CartLoaded({this.cartShoes = const []});
}
