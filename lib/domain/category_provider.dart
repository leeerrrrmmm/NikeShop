import 'package:nike_sneakers_store/data/category_model.dart';

final List<CategoryModel> _categoryList = [
  CategoryModel(title: 'All'),
  CategoryModel(title: 'Outdoor'),
  CategoryModel(title: 'Tennis'),
  CategoryModel(title: 'Basketball'),
  CategoryModel(title: 'Football'),
];

List<CategoryModel> get categoryList => _categoryList;
