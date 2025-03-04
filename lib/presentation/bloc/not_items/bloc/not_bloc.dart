import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:nike_e_shop/data/models/shoes_model.dart';
import 'package:nike_e_shop/domain/auth/auth_service.dart';
import 'package:nike_e_shop/domain/not_db/not_db.dart';

part 'not_event.dart';
part 'not_state.dart';

class NotBloc extends Bloc<NotEvent, NotState> {
  List<ShoesModel> favoriteShoes = [];
  final FirebaseAuth user = FirebaseAuth.instance;
  final _db = NotDb();

  NotBloc() : super(NotInitial()) {
    on<AddItemToNot>((event, emit) {
      if (!favoriteShoes.contains(event.items)) {
        if (user.currentUser != null) {
          _db.addNotItemsToFirebase(user.currentUser!.uid, event.items);
        }

        favoriteShoes.addAll(event.items);
      }
      emit(NotInitial(notItems: List.from(favoriteShoes)));
    });

    on<LoadNotItem>((event, emit) async {
      if (user.currentUser != null) {
        final notItems = await _db.fetchNottemsFromFirestore(
          user.currentUser!.uid,
        );
        emit(NotInitial(notItems: notItems));
      }
    });
  }
}
