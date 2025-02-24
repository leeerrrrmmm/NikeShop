import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_e_shop/data/models/shoes_model.dart';
import 'package:nike_e_shop/extension/size_extension.dart';
import 'package:nike_e_shop/presentation/screens/DETAIL/widgets/bottom_row_widgets.dart';
import 'package:nike_e_shop/presentation/screens/DETAIL/widgets/description_widgets.dart';
import 'package:nike_e_shop/presentation/screens/DETAIL/widgets/select_size_widget.dart';
import 'package:nike_e_shop/presentation/screens/DETAIL/widgets/show_current_image.dart';

class DetailScreen extends StatefulWidget {
  final ShoesModel shoes;
  const DetailScreen({super.key, required this.shoes});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int imageIndex = 0;
  int sizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text(
          'Sneaker Shop',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(CupertinoIcons.bag),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.shoes.title,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Men's shoes",
                style: TextStyle(fontFamily: 'Raleway', fontSize: 18),
              ),
              Text(
                '\$${widget.shoes.price}',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              15.hBox,
              ShowCurrentImage(shoes: widget.shoes, imageIndex: imageIndex),
              const SizedBox(height: 10),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.shoes.imageUrl.length,
                  itemBuilder: (context, index) {
                    final curImage = widget.shoes.imageUrl[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            imageIndex = index;
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(curImage),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              10.hBox,
              DescriptionWidgets(shoes: widget.shoes),
              10.hBox,
              SelectSizeWidget(shoes: widget.shoes),
              25.hBox,
              BottomRowWidgets(),
              40.hBox,
            ],
          ),
        ),
      ),
    );
  }
}
