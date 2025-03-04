import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nike_e_shop/data/models/shoes_model.dart';

extension ShoesModelMapper on ShoesModel {
  Map<String, dynamic> toMaps() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'rate': rate,
      'size': size,
      'imageUrl': imageUrl,
      'addetAt': FieldValue.serverTimestamp(),
    };
  }
}
