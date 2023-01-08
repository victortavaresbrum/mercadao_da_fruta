import 'package:flutter/material.dart';
import 'package:listanable_app/product_notifier.dart';
import 'package:listanable_app/screens/shopping_cart.dart';
import 'package:listanable_app/utils/product_helper.dart' as product_helper;
import '../models/product.dart';
import 'catalog_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int _selectedIndex = 0;



final products = List<Product>.from(product_helper.productList);

final productNotifier = ProductNotifier();

final List<Product> productsAddCart = [];



class _HomePageState extends State<HomePage> {


  late PageController pc;



  @override
  void initState() {
    super.initState();
    pc =PageController(initialPage: _selectedIndex);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 1, 174, 7),
        title: const Text('Mercadão dos Legumes & Frutas'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Carrinho',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (int index) {
            setState(() {
              pc.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.ease);
              _selectedIndex = index;
            });
          }),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pc,
        children: const [
           CatalogCart(),
           ShoppingCart()
        ],
      ),
    );
  }
}

