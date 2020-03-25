import 'package:flutter/material.dart';

class VendingMachineState with ChangeNotifier {
  int _currentBalance = 0;

  List<Map> _items = [
    {
      'product_id': 1,
      'image': 'assets/aqua.png',
      'name': 'Aqua',
      'price': 5000,
      'stock': 5
    },
    {
      'product_id': 2,
      'image': 'assets/tehbotol.png',
      'name': 'Teh Botol',
      'price': 7000,
      'stock': 3
    },
    {
      'product_id': 3,
      'image': 'assets/pocari.png',
      'name': 'Pocari',
      'price': 10000,
      'stock': 10
    },
  ];

  bool productSoldOut() {
    int stock = 0;
    _items.forEach((item) {
      stock = stock + item['stock'];
    });

    return stock > 0 ? false : true;
  }

  List _allowed = [2000, 5000, 10000, 20000];

  int get currentBalance => _currentBalance;
  List<Map> get items => _items;

  void dispenseProduct(productId) {
    _items = _items.map((Map item) {
      if (item['product_id'] == productId) {
        item['stock']--;
      }
      return item;
    }).toList();
    notifyListeners();
  }

  _getProduct(productId) {
    bool _found = false;
    Map _item;
    _items.forEach((Map item) {
      if (item['product_id'] == productId) {
        _found = true;
        _item = item;
      }
    });

    if (!_found) {
      return false;
    }

    return _item;
  }

  void insertBalance(int value) {
    if (!_allowed.contains(value)) {
      throw ('Pecahan tidak diperbolehkan, silahkan masukkan uang kembali');
    } else {
      _currentBalance = _currentBalance + value;
      notifyListeners();
    }
  }

  void buyProduct(productId) {
    final product = _getProduct(productId);

    if (product != false) {
      if (_currentBalance < product['price']) {
        throw ("Saldo tidak mencukupi, silahkan masukkan uang kembali");
      } else if (!stockIsAvailable(product['product_id'])) {
        throw ("Maaf, Product ${product['name']} sedang kosong, silakan pilih kembali produk lain");
      } else {
        dispenseBalance(product['price']);
        dispenseProduct(product['product_id']);
      }
    }
  }

  void dispenseBalance(int value) {
    _currentBalance = _currentBalance - value;
    notifyListeners();
  }

  bool stockIsAvailable(productId) {
    bool _found = false;
    bool _available = false;

    _items.forEach((Map item) {
      if (item['product_id'] == productId) {
        _found = true;
        _available = item['stock'] > 0 ? true : false;
      }
    });

    if (!_found) {
      return false;
    }

    if (!_available) {
      return false;
    }

    return true;
  }
}
