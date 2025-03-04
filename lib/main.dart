import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_e_shop/domain/gate/auth_gate.dart';
import 'package:nike_e_shop/firebase_options.dart';
import 'package:nike_e_shop/presentation/bloc/cart_bloc/bloc/cart_bloc_bloc.dart';
import 'package:nike_e_shop/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:nike_e_shop/presentation/bloc/not_items/bloc/not_bloc.dart';
import 'package:nike_e_shop/presentation/bloc/user_cards_bloc/bloc/user_card_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("Firebase initializing...");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoriteBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => UserCardBloc()),
        BlocProvider(create: (context) => NotBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: AuthGate(),
      ),
    );
  }
}
