import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_e_shop/data/models/shoes_model.dart';
import 'package:nike_e_shop/domain/favorite_cart_checkout/favorite_db.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  List<ShoesModel> favoriteShoes = [];
  final FavoriteDb _firebase = FavoriteDb();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FavoriteBloc() : super(FavoriteInitial()) {
    on<LoadFavorites>((event, emit) async {
      final favShoes = await _firebase.fetchFavoriteItemsFromFirestore(
        _auth.currentUser!.uid,
      );

      emit(FavoritesLoaded(favorites: favShoes));
    });

    on<AddToFavorite>((event, emit) {
      if (!favoriteShoes.contains(event.shoes)) {
        if (_auth.currentUser != null) {
          _firebase.addFavoriteToFirestore(_auth.currentUser!.uid, event.shoes);
        }

        favoriteShoes.add(event.shoes);
        emit(FavoritesLoaded(favorites: List.from(favoriteShoes)));
      }
    });

    on<RemoveFromFavorite>((event, emit) {
      if (_auth.currentUser != null) {
        _firebase.removeFavoriteFromFirestore(
          _auth.currentUser!.uid,
          event.shoes,
        );
      }

      favoriteShoes.removeWhere((item) => item.title == event.shoes.title);
      emit(FavoritesLoaded(favorites: List.from(favoriteShoes)));
    });
  }
}
