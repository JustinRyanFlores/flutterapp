import 'package:flutter/material.dart';
import 'package:test_dev/pages/cart.dart';

class MyPurchases extends StatelessWidget {
  const MyPurchases({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Purchases'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined,
                color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cart()),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.chat_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () => {},
          ),
        ],
      ),
      body: const Center(
        child: Text('To Pay Page Content'),
      ),
    );
  }
}
