import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_e_shop/data/models/shoes_model.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBloc() : super(CartBlocInitial()) {
    final List<ShoesModel> cartShoesItem = [];

    // Load items
    on<LoadCartsItem>((event, emit) {
      emit(CartLoaded(cartShoes: List.from(cartShoesItem)));
    });

    // add item to cart
    on<AddItemToCart>((event, emit) {
      if (!cartShoesItem.contains(event.shoe)) {
        cartShoesItem.add(event.shoe);
        emit(CartLoaded(cartShoes: List.from(cartShoesItem)));
      }
    });

    // delete items
    on<RemoveItemFtomCart>((event, emit) {
      cartShoesItem.remove(event.shoes);
      emit(CartLoaded(cartShoes: List.from(cartShoesItem)));
    });
  }
}
