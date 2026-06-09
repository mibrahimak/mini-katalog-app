import 'package:flutter/material.dart';

import '../models/cart_item.dart';
import '../models/product.dart';

class AppState extends ChangeNotifier {
  final Map<int, Product> _favoriteProducts = {};
  final Map<int, CartItem> _cartItems = {};

  bool isFavorite(int productId) => _favoriteProducts.containsKey(productId);

  void toggleFavorite(Product product) {
    if (isFavorite(product.id)) {
      _favoriteProducts.remove(product.id);
    } else {
      _favoriteProducts[product.id] = product;
    }
    notifyListeners();
  }

  void addToCart(Product product, int quantity) {
    if (quantity <= 0) return;

    final existingItem = _cartItems[product.id];
    if (existingItem != null) {
      existingItem.quantity += quantity;
    } else {
      _cartItems[product.id] = CartItem(product: product, quantity: quantity);
    }
    notifyListeners();
  }

  void decrementCartItem(int productId) {
    final currentItem = _cartItems[productId];
    if (currentItem == null) return;

    currentItem.quantity -= 1;
    if (currentItem.quantity <= 0) {
      _cartItems.remove(productId);
    }
    notifyListeners();
  }

  void removeCartItem(int productId) {
    if (_cartItems.remove(productId) != null) {
      notifyListeners();
    }
  }

  int get cartCount =>
      _cartItems.values.fold(0, (sum, item) => sum + item.quantity);

  int get favoriteCount => _favoriteProducts.length;

  List<CartItem> get cartItems => _cartItems.values.toList();

  List<Product> get favoriteProducts => _favoriteProducts.values.toList();
}

class AppStateProvider extends InheritedNotifier<AppState> {
  const AppStateProvider({
    super.key,
    required AppState notifier,
    required super.child,
  }) : super(notifier: notifier);

  static AppState of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<AppStateProvider>();
    assert(provider != null, 'No AppStateProvider found in context');
    return provider!.notifier!;
  }
}
