import '../models/product.dart';

class ProductViewModel{
  ProductViewModel(Product product) 
  : productName = product.productName,
    productPrice = product.productPrice,
    addShop = product.addShop,
    productImage = product.productImage;


final String productName;
final int productPrice;
final String productImage;
bool addShop;
}