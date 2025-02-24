import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_e_shop/firebase_options.dart';
import 'package:nike_e_shop/presentation/bloc/cart_bloc/bloc/cart_bloc_bloc.dart';
import 'package:nike_e_shop/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:nike_e_shop/presentation/screens/BOTTOM_BAR/custom_bottom_bar.dart';
import 'package:nike_e_shop/presentation/screens/REGISTER/register_screen.dart';
import 'package:nike_e_shop/presentation/screens/SPLASH/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: RegisterScreen(),
      ),
    );
  }
}
