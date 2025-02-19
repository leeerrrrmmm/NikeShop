class ShoesModel {
  final String title;
  final String description;
  final int price;
  final String category;
  final String rate;
  final List<String> size;
  final List<String> imageUrl;

  ShoesModel({
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.rate,
    required this.size,
    required this.imageUrl,
  });
}
