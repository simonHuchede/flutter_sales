
import 'package:flutter/foundation.dart';

import 'product_model.dart';

class CartModel extends ChangeNotifier{
  final List<ProductModel> lsProducts;
  CartModel(this.lsProducts);

  addProduct(ProductModel product){
    lsProducts.add(product);
    notifyListeners();
  }
  remove(ProductModel product){
    lsProducts.remove(product);
    notifyListeners();
  }
  getTotalPrice(){
   return lsProducts.fold<num>(0, (previousValue, element) => previousValue + element.prix).toStringAsFixed(2);
  }
  removeAllProducts(){
    lsProducts.clear();
    notifyListeners();
  }
}