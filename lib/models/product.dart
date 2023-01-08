class Product {
  Product(
      {required this.productImage,
      required this.productName,
      required this.productPrice,
      this.addShop = false
      });

  final String productName;
  final int productPrice;
  final String productImage;
  bool addShop = false;
}
