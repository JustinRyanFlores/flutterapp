// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_dev/Cart.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(Icons.search),
                      ),
                      const SizedBox(width: 10.0),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.camera_alt_outlined),
                        onPressed: () => {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 5.0),
            ],
          ),
          actions: [
            IconButton(
              icon:
                  const Icon(Icons.shopping_cart_outlined, color: Colors.white),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Cart()), // Replace CartPage with your actual cart page widget
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.chat_outlined,
                color: Colors.white,
              ),
              onPressed: () => {},
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 19, 13, 0),
        ),
        body: Column(
          children: [
            Flexible(
              child: Container(
                height: 190,
                color: const Color.fromARGB(255, 105, 83, 42),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: const Color.fromARGB(255, 105, 83, 42),
                        child: const Center(
                          child: Text.rich(
                            TextSpan(
                              text: 'SUPER SALE\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'July 16 - 24, 2024\n10 am - 10 pm',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 150,
                        width: 125,
                        color: Color.fromARGB(255, 19, 13, 0),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 85,
                              image: AssetImage('plywood.jpg'),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '350.00 PHP',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 150,
                        width: 125,
                        color: Color.fromARGB(255, 19, 13, 0),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 90,
                              image: AssetImage('hallowblocks.jpg'),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '700.00 PHP',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Roofing Materials',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ItemCard(
                    imagePath: 'trimrib.png',
                    title: 'HUU Trim Rib',
                    price: '251.00 PHP',
                  ),
                  ItemCard(
                    imagePath: 'corrugated.png',
                    title: 'HUU Corrugated',
                    price: '334.00 PHP',
                  ),
                  ItemCard(
                    imagePath: 'ribtype.png',
                    title: 'Seymour Ribtype',
                    price: '1,533.00 PHP',
                  ),
                  ItemCard(
                    imagePath: 'ceilingtype.jpg',
                    title: 'PVC Ceiling Panel',
                    price: '390.00 PHP',
                  ),
                  ItemCard(
                    imagePath: 'longspan.jpg',
                    title: 'Longspan Ribtype ',
                    price: '560.00 PHP',
                  ),
                  // Add more ItemCard widgets as needed
                ],
              ),
            ),
            Expanded(
              child: const TabBarView(
                children: [
                  Icon(Icons.home, color: Colors.black, size: 100),
                  Icon(Icons.list, size: 100),
                  Icon(Icons.message, size: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;

  const ItemCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: const TextStyle(
                color: Color.fromARGB(255, 155, 151, 151),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: Home()));
