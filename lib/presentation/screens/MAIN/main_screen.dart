import 'package:flutter/material.dart';
import 'package:nike_e_shop/data/models/shoes_model.dart';
import 'package:nike_e_shop/data/data_source/category_provider.dart';
import 'package:nike_e_shop/data/data_source/shoes_provider.dart';
import 'package:nike_e_shop/extension/size_extension.dart';
import 'package:nike_e_shop/presentation/screens/DRAWER/custom_driver.dart';
import 'package:nike_e_shop/presentation/screens/MAIN/widgets/custom_app_bar.dart';
import 'package:nike_e_shop/presentation/screens/MAIN/widgets/custom_search_bar.dart';
import 'package:nike_e_shop/presentation/screens/MAIN/widgets/item_card.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  void toggleMenu() {
    final state = _sideMenuKey.currentState;
    if (state!.isOpened) {
      state.closeSideMenu();
    } else {
      state.openSideMenu();
    }
  }

  int selectedCategoryIndex = 0;

  List<List<ShoesModel>> selectedCat = [
    all,
    tennis,
    outdoor,
    basketball,
    football,
  ];

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      background: Color(0xFF0D6EFD),
      key: _sideMenuKey,
      menu: DrawerMenu(scaffoldKey: GlobalKey<ScaffoldState>()),
      type: SideMenuType.shrikNRotate,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(onPressed: toggleMenu),
                CustomSearchBar(),
                10.hBox,
                Padding(
                  padding: const EdgeInsets.only(left: 9.0),
                  child: Text(
                    'Selected Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                10.hBox,
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      final selCat = categoryList[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategoryIndex = index;
                          });
                        },
                        child: Container(
                          width: 100,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:
                                selectedCategoryIndex == index
                                    ? Color(0xFF0D6EFD)
                                    : Colors.white10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              selCat.title,
                              style: TextStyle(
                                color:
                                    selectedCategoryIndex == index
                                        ? Colors.white
                                        : Color(0xFF0D6EFD),
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                10.hBox,
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: selectedCat[selectedCategoryIndex].length,
                  itemBuilder: (context, index) {
                    return ItemCard(
                      shoes: selectedCat[selectedCategoryIndex][index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
