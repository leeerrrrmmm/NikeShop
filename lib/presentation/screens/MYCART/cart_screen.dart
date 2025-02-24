import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nike_e_shop/presentation/bloc/cart_bloc/bloc/cart_bloc_bloc.dart';
import 'package:nike_e_shop/presentation/screens/CHECKOUT/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(LoadCartsItem());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartBlocState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            // Суммируем цену всех товаров в корзине
            double subTotalPrice = state.cartShoes.fold(0, (sum, item) {
              return sum + item.price;
            });
            double deliveryPrice = 110.53; // Базовая цена доставки
            if (subTotalPrice > 700.0) {
              deliveryPrice = 0.0;
            }

            double totalCost = subTotalPrice + deliveryPrice;

            return state.cartShoes.length <= 0
                ? Center(
                  child: Text(
                    'Items: ${state.cartShoes.length}',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ALL ITEMS
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Items: ${state.cartShoes.length}',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    /// LIST VIEW OF CART ITEM
                    SizedBox(
                      height: 580,
                      child: ListView.builder(
                        itemCount: state.cartShoes.length,
                        itemBuilder: (context, index) {
                          final curCartItem = state.cartShoes[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20,
                            ),
                            child: Slidable(
                              key: ValueKey(curCartItem),
                              startActionPane: ActionPane(
                                motion: const DrawerMotion(),
                                extentRatio: 0.28,
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {},
                                    borderRadius: BorderRadius.circular(15),
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    icon: Icons.info,
                                    label: 'Подробнее',
                                  ),
                                ],
                              ),
                              endActionPane: ActionPane(
                                motion: const DrawerMotion(),
                                extentRatio: 0.28,
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      context.read<CartBloc>().add(
                                        RemoveItemFtomCart(curCartItem),
                                      );
                                    },

                                    borderRadius: BorderRadius.circular(15),
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    label: 'Удалить',
                                    icon: Icons.delete,
                                  ),
                                ],
                              ),
                              child: Container(
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.3,
                                    color: Colors.black,
                                  ),
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Image.network(curCartItem.imageUrl[0]),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                curCartItem.title,
                                                style: TextStyle(
                                                  fontFamily: 'Raleway',
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                '\$${curCartItem.price.toStringAsFixed(2)}',
                                                style: TextStyle(
                                                  fontFamily: 'Raleway',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 218,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// TOTAL PRICE
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Subtotal: ',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '\$${subTotalPrice.toStringAsFixed(2)}', // Используем totalPrice для вывода общей стоимости
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            /// DELIVERY PRICE
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delivery: ',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '\$${deliveryPrice}', // Используем totalPrice для вывода общей стоимости
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Divider(),

                            /// TOTAL + DELIVERY PRICE
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Cost:',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '\$${totalCost}',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),

                            /// CHECKOUT BTN
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder:
                                        (context) => CheckoutScreen(
                                          subtotal: subTotalPrice,
                                          delivery: deliveryPrice,
                                          totalPrice: totalCost,
                                        ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.all(15),
                                width: double.infinity,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Color(0xff0d6efd),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    'Checkout',
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
