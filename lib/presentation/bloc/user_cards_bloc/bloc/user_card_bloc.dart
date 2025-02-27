import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:nike_e_shop/data/models/credit_card_model.dart';
import 'package:nike_e_shop/domain/credit_card/credit_card_db.dart';

part 'user_card_event.dart';
part 'user_card_state.dart';

class UserCardBloc extends Bloc<UserCardEvent, UserCardState> {
  List<UserCreditCardModel> userCards = [];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CreditCardDb _db = CreditCardDb();

  UserCardBloc() : super(LoadedUserCard()) {
    on<CreditCardLoadedEvent>((event, emit) async {
      final userCard = await _db.fetchCreditCardsFromFirestore(
        _auth.currentUser!.uid,
      );

      emit(LoadedUserCard(userCreditCards: userCard));
    });

    on<AddCreditCard>((event, emit) {
      if (!userCards.contains(event.creditCard)) {
        if (_auth.currentUser != null) {
          _db.addCreditCardToCurrentUser(
            _auth.currentUser!.uid,
            event.creditCard,
          );
        }
      }

      userCards.add(event.creditCard);
      emit(LoadedUserCard(userCreditCards: List.from(userCards)));
    });

    on<RemoveCreditCard>((event, emit) {
      if (_auth.currentUser != null) {
        _db.removeCreditCardFromCurUser(
          _auth.currentUser!.uid,
          event.creditCard,
        );
      }

      userCards.removeWhere(
        (el) => el.cardHolder == event.creditCard.cardHolder,
      );
      emit(LoadedUserCard(userCreditCards: List.from(userCards)));
    });
  }
}
