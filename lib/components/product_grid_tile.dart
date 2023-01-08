import 'package:flutter/material.dart';
import 'package:listanable_app/view_models/product_view_model.dart';

import '../models/product.dart';
import '../screens/homepage.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile({
    Key? key,
    required this.viewModel,
    required this.product, required this.addSnackBar,
  }) : super(key: key);

  final ProductViewModel viewModel;
  final Product product;

  final VoidCallback addSnackBar;



  @override
  Widget build(BuildContext context) {
    return Card(
      child: GridTile(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.network(viewModel.productImage),
            Container(
              width: 200,
              height: 50,
              color: const Color.fromARGB(77, 6, 0, 0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.productName,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'R\$ ${viewModel.productPrice.toStringAsFixed(2)}kg',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        productNotifier.addCart();

                        if (viewModel.addShop == false) {
                          productsAddCart.add(product);
                        }
                        addSnackBar();
                      },
                      icon: const Icon(Icons.shopping_cart),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
