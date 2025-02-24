import 'package:nike_e_shop/data/models/category_model.dart';

final List<CategoryModel> _categoryList = [
  CategoryModel(title: 'All'),
  CategoryModel(title: 'Outdoor'),
  CategoryModel(title: 'Tennis'),
  CategoryModel(title: 'Basketball'),
  CategoryModel(title: 'Football'),
];

List<CategoryModel> get categoryList => _categoryList;
