import 'package:flutter/material.dart';
import 'package:nike_e_shop/data/models/shoes_model.dart';
import 'package:nike_e_shop/extension/size_extension.dart';

class SelectSizeWidget extends StatefulWidget {
  const SelectSizeWidget({super.key, required this.shoes});

  final ShoesModel shoes;

  @override
  State<SelectSizeWidget> createState() => _SelectSizeWidgetState();
}

class _SelectSizeWidgetState extends State<SelectSizeWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
        15.hBox,
        Row(
          children: List.generate(widget.shoes.size.length, (index) {
            final curShoesSize = widget.shoes.size[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(3),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color:
                      selectedIndex == index ? Colors.blueAccent : Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: selectedIndex == index ? 3 : 1,
                    color: selectedIndex == index ? Colors.pink : Colors.black,
                  ),
                ),
                child: Center(
                  child: Text(
                    curShoesSize,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          selectedIndex == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
