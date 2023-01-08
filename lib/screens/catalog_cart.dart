import 'package:flutter/material.dart';

import '../components/product_grid_tile.dart';
import '../view_models/product_view_model.dart';
import 'homepage.dart';

class CatalogCart extends StatefulWidget {
  const CatalogCart({
    Key? key,
  }) : super(key: key);

  @override
  State<CatalogCart> createState() => _CatalogCartState();
}

class _CatalogCartState extends State<CatalogCart> {
  void addSnackBar() {
    final snackBarAdd = SnackBar(
      width: double.infinity,
      duration: Duration(milliseconds: 800),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      elevation: 150.0,
      content: Row(
        children: const [
          Icon(Icons.shopping_cart,color: Colors.white,),
          SizedBox(
            width: 30,
          ),
          Text('Produto Adicionado ao Carrinho!'),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBarAdd);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        final viewModel = ProductViewModel(product);
        return ProductGridTile(
          viewModel: viewModel,
          product: product,
          addSnackBar: addSnackBar,
        );
      },
    );
  }
}
