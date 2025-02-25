import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_e_shop/extension/size_extension.dart';
import 'package:nike_e_shop/presentation/bloc/cart_bloc/bloc/cart_bloc_bloc.dart';
import 'package:nike_e_shop/presentation/bloc/favorite_bloc/favorite_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(LoadFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text(
          'Favorite',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(CupertinoIcons.heart),
          ),
        ],
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoritesLoaded) {
            return state.favorites.isEmpty
                ? Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    'Also You Have Not Any Favorite Items',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
                : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.56,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: state.favorites.length,
                  itemBuilder: (context, index) {
                    final shoes = state.favorites[index];
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(shoes.imageUrl[0]),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 10,
                                      left: 5,
                                      child: BlocBuilder<
                                        FavoriteBloc,
                                        FavoriteState
                                      >(
                                        builder: (context, state) {
                                          bool isFavorite = false;
                                          if (state is FavoritesLoaded) {
                                            isFavorite = state.favorites.any(
                                              (el) => el.title == shoes.title,
                                            );
                                          }
                                          return IconButton(
                                            onPressed: () {
                                              if (!isFavorite) {
                                                context
                                                    .read<FavoriteBloc>()
                                                    .add(AddToFavorite(shoes));
                                              } else {
                                                context
                                                    .read<FavoriteBloc>()
                                                    .add(
                                                      RemoveFromFavorite(shoes),
                                                    );
                                              }
                                            },
                                            icon: Icon(
                                              isFavorite
                                                  ? CupertinoIcons.heart_fill
                                                  : CupertinoIcons.heart,
                                              color:
                                                  isFavorite
                                                      ? Colors.red
                                                      : Colors.grey,
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
                                shoes.title,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '\$ ${shoes.price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
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
                                      child: IconButton(
                                        onPressed: () {
                                          context.read<CartBloc>().add(
                                            AddItemToCart(shoes),
                                          );
                                        },
                                        icon: Icon(CupertinoIcons.add),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
