import 'package:flutter/material.dart';
import 'package:nike_sneakers_store/presentation/BOTTOM_BAR/custom_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: CustomBottomBars(),
    );
  }
}
