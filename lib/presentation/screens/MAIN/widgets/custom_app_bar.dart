import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_e_shop/presentation/bloc/cart_bloc/bloc/cart_bloc_bloc.dart';
import 'package:nike_e_shop/presentation/screens/MYCART/cart_screen.dart';

class CustomAppBar extends StatefulWidget {
  final void Function()? onPressed;
  const CustomAppBar({super.key, required this.onPressed});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(LoadCartsItem());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: widget.onPressed,
              icon: Icon(Icons.menu, size: 30),
            ),
            Row(
              children: [
                Image.asset('asset/image/smile.png', color: Colors.black),
                Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            BlocBuilder<CartBloc, CartBlocState>(
              builder: (context, state) {
                if (state is CartLoaded) {
                  return Stack(
                    children: [
                      !state.cartShoes.isEmpty
                          ? Positioned(
                            right: 5,
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.red,
                            ),
                          )
                          : SizedBox(),
                      Positioned(
                        child: IconButton(
                          onPressed:
                              () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => CartScreen(),
                                ),
                              ),
                          icon: Icon(CupertinoIcons.bag),
                        ),
                      ),
                    ],
                  );
                } else {
                  return IconButton(
                    onPressed:
                        () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => CartScreen(),
                          ),
                        ),
                    icon: Icon(CupertinoIcons.bag),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
