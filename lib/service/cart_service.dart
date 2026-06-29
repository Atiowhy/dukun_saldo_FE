import 'package:flutter/foundation.dart';
import 'package:dukun_saldo/models/product_models.dart';

class CartItem {
  final PostModel product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}

class CartService extends ChangeNotifier {
  // Singleton Pattern
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final Map<int, CartItem> _items = {};

  // Getters
  List<CartItem> get items => _items.values.toList();
  
  int get itemCount {
    int count = 0;
    for (var item in _items.values) {
      count += item.quantity;
    }
    return count;
  }
  
  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, item) {
      total += item.product.price * item.quantity;
    });
    return total;
  }

  // Actions
  void addItem(PostModel product, int quantity) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += quantity;
    } else {
      _items[product.id] = CartItem(product: product, quantity: quantity);
    }
    notifyListeners();
  }

  void incrementQuantity(int productId) {
    if (_items.containsKey(productId)) {
      _items[productId]!.quantity += 1;
      notifyListeners();
    }
  }

  void decrementQuantity(int productId) {
    if (_items.containsKey(productId)) {
      if (_items[productId]!.quantity > 1) {
        _items[productId]!.quantity -= 1;
      } else {
        // Optionally remove if it reaches 0
        _items.remove(productId);
      }
      notifyListeners();
    }
  }

  void removeItem(int productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
