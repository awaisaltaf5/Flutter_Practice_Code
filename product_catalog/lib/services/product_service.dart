import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product.dart';

/// Service class responsible for loading product data from local assets.
class ProductService {
  /// Loads products from the `assets/products.json` asset file.
  static Future<List<Product>> loadProducts() async {
    try {
      // Simulate slight delay for realistic loading effect (optional for demo)
      await Future.delayed(const Duration(milliseconds: 600));

      // Read JSON file from assets
      final String jsonString = await rootBundle.loadString('assets/products.json');

      // Decode JSON string to List of maps
      final List<dynamic> jsonList = json.decode(jsonString);

      // Map each JSON object to a Product instance
      return jsonList.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load product catalog: $e');
    }
  }
}
