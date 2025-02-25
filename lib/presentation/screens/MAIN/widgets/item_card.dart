import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_e_shop/data/models/shoes_model.dart';
import 'package:nike_e_shop/extension/size_extension.dart';
import 'package:nike_e_shop/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:nike_e_shop/presentation/screens/DETAIL/detail_screen.dart';
import 'package:nike_e_shop/presentation/screens/MYCART/cart_screen.dart';

class ItemCard extends StatefulWidget {
  final ShoesModel shoes;

  const ItemCard({super.key, required this.shoes});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(LoadFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => DetailScreen(shoes: widget.shoes),
          ),
        );
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.shoes.imageUrl[0]),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 5,
                        child: BlocBuilder<FavoriteBloc, FavoriteState>(
                          builder: (context, state) {
                            bool isFavorite = false;
                            if (state is FavoritesLoaded) {
                              isFavorite = state.favorites.any(
                                (el) => el.title == widget.shoes.title,
                              );
                            }
                            return IconButton(
                              onPressed: () {
                                if (!isFavorite) {
                                  context.read<FavoriteBloc>().add(
                                    AddToFavorite(widget.shoes),
                                  );
                                } else {
                                  context.read<FavoriteBloc>().add(
                                    RemoveFromFavorite(widget.shoes),
                                  );
                                }
                              },
                              icon: Icon(
                                isFavorite
                                    ? CupertinoIcons.heart_fill
                                    : CupertinoIcons.heart,
                                color: isFavorite ? Colors.red : Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                10.hBox,
                Text(
                  textAlign: TextAlign.center,
                  widget.shoes.title,
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '\$ ${widget.shoes.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => CartScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF0d6efd),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Icon(CupertinoIcons.add, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
