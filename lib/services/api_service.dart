import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../constants/assets.dart';

class ApiService {
  static const Duration timeout = Duration(seconds: 30);

  /// Fetch products from the API
  static Future<List<Product>> fetchProducts() async {
    final urls = [
      AppAssets.productsApiUrl,
      AppAssets.fakeStoreApi,
      AppAssets.dummyJsonApi,
    ];

    for (final url in urls) {
      try {
        final response = await http.get(Uri.parse(url)).timeout(timeout);

        if (response.statusCode != 200) {
          continue;
        }

        final jsonData = jsonDecode(response.body);
        final productList = _extractProductList(jsonData);

        return productList
            .map((item) => Product.fromJson(item as Map<String, dynamic>))
            .toList();
      } catch (e) {
        // Bir URL başarısız olsa bile diğerlerini denemeye devam et
        continue;
      }
    }

    throw Exception('Failed to load products from available APIs');
  }

  static List<dynamic> _extractProductList(dynamic jsonData) {
    if (jsonData is List) {
      return jsonData;
    }

    if (jsonData is Map<String, dynamic>) {
      if (jsonData.containsKey('products')) {
        return jsonData['products'] as List<dynamic>;
      }
      if (jsonData.containsKey('data')) {
        return jsonData['data'] as List<dynamic>;
      }
      if (jsonData.containsKey('items')) {
        return jsonData['items'] as List<dynamic>;
      }
    }

    throw Exception('Unexpected API response format');
  }

  /// Fetch a single product by ID
  static Future<Product> fetchProductById(int id) async {
    try {
      final products = await fetchProducts();
      return products.firstWhere(
        (product) => product.id == id,
        orElse: () => throw Exception('Product not found'),
      );
    } catch (e) {
      throw Exception('Error fetching product: $e');
    }
  }

  /// Fetch banner image
  static String getBannerUrl() {
    return AppAssets.bannerUrl;
  }
}
