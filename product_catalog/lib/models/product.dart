/// Data model representing a Product in the catalog.
class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final String image;
  final double rating;
  final String description;
  bool isFavorite;
  bool isInCart;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.rating,
    required this.description,
    this.isFavorite = false,
    this.isInCart = false,
  });

  /// Factory constructor to create a [Product] instance from a JSON map.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      rating: (json['rating'] as num).toDouble(),
      description: json['description'] as String,
      isFavorite: json['isFavorite'] ?? false,
      isInCart: json['isInCart'] ?? false,
    );
  }

  /// Converts a [Product] instance back into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'image': image,
      'rating': rating,
      'description': description,
      'isFavorite': isFavorite,
      'isInCart': isInCart,
    };
  }
}
