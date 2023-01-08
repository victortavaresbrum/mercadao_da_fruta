import 'package:flutter/material.dart';
import 'package:listanable_app/screens/homepage.dart';

import '../components/product_list_tile.dart';
import '../view_models/product_view_model.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({
    Key? key,
  }) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  void removeSnackBar() {
    final snackBarAdd = SnackBar(
      width: double.infinity,
      backgroundColor: Color.fromARGB(255, 196, 11, 11),
      behavior: SnackBarBehavior.floating,
      elevation: 150.0,
      duration: const Duration(milliseconds: 800),
      content: Row(
        children: const [
          Icon(
            Icons.close,
            color: Colors.white,
          ),
          SizedBox(
            width: 30,
          ),
          Text('Produto Removido ao Carrinho!'),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBarAdd);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: productNotifier,
      builder: (context, child) {
        return ListView.builder(
          itemCount: productsAddCart.length,
          itemBuilder: ((context, index) {
            final productAddCart = productsAddCart[index];
            final viewModel = ProductViewModel(productAddCart);

            return ProductListTile(
              viewModel: viewModel,
              productAddCart: productAddCart,
              removeSnackBar: removeSnackBar,
            );
          }),
        );
      },
    );
  }
}
