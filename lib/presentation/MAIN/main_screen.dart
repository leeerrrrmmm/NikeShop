import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_sneakers_store/data/shoes_model.dart';
import 'package:nike_sneakers_store/domain/category_provider.dart';
import 'package:nike_sneakers_store/domain/shoes_provider.dart';
import 'package:nike_sneakers_store/extension/size_extension.dart';
import 'package:nike_sneakers_store/presentation/DRAWER/custom_driver.dart';
import 'package:nike_sneakers_store/presentation/MAIN/widgets/custom_app_bar.dart';
import 'package:nike_sneakers_store/presentation/MAIN/widgets/custom_search_bar.dart';
import 'package:nike_sneakers_store/presentation/MAIN/widgets/item_card.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

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
                            color: Color(0xFF0D6EFD),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              selCat.title,
                              style: TextStyle(
                                color: Colors.white,
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
