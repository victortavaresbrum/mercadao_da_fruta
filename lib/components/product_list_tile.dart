import 'package:flutter/material.dart';
import 'package:listanable_app/product_notifier.dart';
import 'package:listanable_app/view_models/product_view_model.dart';

import '../models/product.dart';
import '../screens/homepage.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    Key? key,
    required this.viewModel,
    required this.productAddCart, required this.removeSnackBar,
  }) : super(key: key);

  final ProductViewModel viewModel;
  final Product productAddCart;
  final VoidCallback removeSnackBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(viewModel.productImage),
            Text(
              viewModel.productName,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 85, 85, 85),
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'R\$${viewModel.productPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 85, 85, 85),
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
              onPressed: () {
                productNotifier.removeCart();
                if (viewModel.addShop == false) {
                  productsAddCart.remove(productAddCart);
                }
                removeSnackBar();
              },
              icon: const Icon(Icons.close),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}