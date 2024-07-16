import 'package:flutter/material.dart';

class MyPurchases extends StatelessWidget {
  const MyPurchases({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Purchases'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 70.0, top: 8.0),
            child: IconButton(
              icon: const Icon(
                Icons.settings_outlined,
                color: Color.fromARGB(255, 19, 13, 0),
              ),
              onPressed: () => {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 70.0, top: 8.0),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Color.fromARGB(255, 19, 13, 0),
              ),
              onPressed: () => {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 70.0, right: 5.0, top: 8.0),
            child: IconButton(
              icon: const Icon(
                Icons.chat_outlined,
                color: Color.fromARGB(255, 19, 13, 0),
              ),
              onPressed: () => {},
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text('To Pay Page Content'),
      ),
    );
  }
}
