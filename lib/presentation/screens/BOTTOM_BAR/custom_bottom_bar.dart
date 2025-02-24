import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/presentation/screens/FAVORITES/favorite_screen.dart';
import 'package:nike_e_shop/presentation/screens/MAIN/main_screen.dart';
import 'package:nike_e_shop/presentation/screens/MYCART/cart_screen.dart';
import 'package:nike_e_shop/presentation/screens/PROFILE/profile_screen.dart';

class CustomBottomBars extends StatefulWidget {
  const CustomBottomBars({super.key});

  @override
  State<CustomBottomBars> createState() => _CustomBottomBarsState();
}

class _CustomBottomBarsState extends State<CustomBottomBars> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MainScreen(),
    FavoriteScreen(),
    Center(child: Text("Notification")), // Заглушка для Notification
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BODY
      body: _screens[_selectedIndex],

      // FAB
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => CartScreen()),
          );
        },
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xff0d6efd),
          child: Icon(CupertinoIcons.bag, color: Colors.white, size: 30),
        ),
      ),

      // FAB LOCATION
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(CupertinoIcons.home),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(CupertinoIcons.heart),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              SizedBox(width: 50), // Для выемки в центре
              IconButton(
                icon: Icon(CupertinoIcons.bell),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
              ),
              IconButton(
                icon: Icon(CupertinoIcons.person),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
