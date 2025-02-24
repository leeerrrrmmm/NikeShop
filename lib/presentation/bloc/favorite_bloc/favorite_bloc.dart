import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_e_shop/data/models/shoes_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  List<ShoesModel> favoriteShoes = [];

  FavoriteBloc() : super(FavoriteInitial()) {
    on<LoadFavorites>((event, emit) {
      emit(FavoritesLoaded(favorites: List.from(favoriteShoes)));
    });

    on<AddToFavorite>((event, emit) {
      if (!favoriteShoes.contains(event.shoes)) {
        favoriteShoes.add(event.shoes);
        emit(FavoritesLoaded(favorites: List.from(favoriteShoes)));
      }
    });

    on<RemoveFromFavorite>((event, emit) {
      favoriteShoes.remove(event.shoes);
      emit(FavoritesLoaded(favorites: List.from(favoriteShoes)));
    });
  }
}
