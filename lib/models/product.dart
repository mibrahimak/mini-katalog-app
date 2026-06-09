class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String category;
  final double rating;
  final int reviews;
  final String image;
  final bool inStock;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.rating,
    required this.reviews,
    required this.image,
    required this.inStock,
    required this.stock,
  });

  static double _parsePrice(dynamic price) {
    if (price == null) return 0.0;
    if (price is num) return price.toDouble();
    if (price is String) {
      final cleaned = price
          .replaceAll(RegExp(r'[^0-9.,]'), '')
          .replaceAll(',', '.');
      return double.tryParse(cleaned) ?? 0.0;
    }
    return 0.0;
  }

  static String _parseCategory(Map<String, dynamic> json) {
    return json['category'] as String? ??
        json['tagline'] as String? ??
        json['type'] as String? ??
        json['brand'] as String? ??
        'Teknoloji';
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int? ?? (json['productId'] as int? ?? 0),
      name: json['name'] as String? ?? 'Ürün',
      description:
          json['description'] as String? ??
          json['body'] as String? ??
          json['tagline'] as String? ??
          'Açıklama mevcut değil.',
      price: _parsePrice(json['price']),
      category: _parseCategory(json),
      rating:
          (json['rating'] as num?)?.toDouble() ??
          (json['score'] as num?)?.toDouble() ??
          4.5,
      reviews: json['reviews'] as int? ?? json['reviewCount'] as int? ?? 100,
      image: json['image'] as String? ?? json['imageUrl'] as String? ?? '',
      inStock: (json['inStock'] as bool?) ?? true,
      stock: json['stock'] as int? ?? json['inventory'] as int? ?? 20,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'category': category,
    'rating': rating,
    'reviews': reviews,
    'image': image,
    'inStock': inStock,
    'stock': stock,
  };
}
