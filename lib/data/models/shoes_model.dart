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

  factory ShoesModel.fromMap(Map<String, dynamic> map) {
    return ShoesModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] ?? 0).toInt(),
      category: map['category'] ?? '',
      rate: map['rate'] ?? '0',
      size: List<String>.from(map['size'] ?? []),
      imageUrl: List<String>.from(map['imageUrl'] ?? []),
    );
  }
}
