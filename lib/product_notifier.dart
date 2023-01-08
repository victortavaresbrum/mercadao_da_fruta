import 'package:flutter/cupertino.dart';
import 'package:listanable_app/models/product.dart';
import 'package:listanable_app/view_models/product_view_model.dart';

class ProductNotifier extends ChangeNotifier {
  
  ProductViewModel? _productViewModel;

  void addCart() {
    _productViewModel?.addShop = true;
    notifyListeners();
  }

  void removeCart() {
   _productViewModel?.addShop = false;
    notifyListeners();
  }
}
