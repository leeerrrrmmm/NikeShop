import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';
import 'package:nike_e_shop/data/models/shoes_model.dart';
import 'package:nike_e_shop/domain/favorite_cart_checkout/cart_db.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBloc() : super(CartBlocInitial()) {
    final List<ShoesModel> cartShoesItem = [];
    final CartDb _firebase = CartDb();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    // Load items
    on<LoadCartsItem>((event, emit) async {
      final cartItem = await _firebase.fetchCartItemsFromFirestore(
        _auth.currentUser!.uid,
      );
      emit(CartLoaded(cartShoes: cartItem));
    });

    // add item to cart
    on<AddItemToCart>((event, emit) {
      if (!cartShoesItem.contains(event.shoe)) {
        _firebase.addCartItemToFirebase(_auth.currentUser!.uid, event.shoe);

        cartShoesItem.add(event.shoe);
        emit(CartLoaded(cartShoes: List.from(cartShoesItem)));
      }
    });

    // delete items
    on<RemoveItemFtomCart>((event, emit) {
      if (_auth.currentUser != null) {
        _firebase.removeCartItemFromFirestore(
          _auth.currentUser!.uid,
          event.shoes,
        );
      }

      cartShoesItem.removeWhere((item) => item.title == event.shoes.title);
      emit(CartLoaded(cartShoes: List.from(cartShoesItem)));
    });
  }
}
