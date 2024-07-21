// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'pages/cart.dart';
import 'pages/item_details.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _autoSwipe();
  }

  void _autoSwipe() {
    Future.delayed(Duration(seconds: 10), () {
      if (_pageController.hasClients) {
        int nextPage = (_currentPage + 1) % 3;
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                MaterialPageRoute(builder: (context) => Cart()),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 190,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                    _autoSwipe();
                  },
                  children: [
                    _buildSaleContainer(
                      context,
                      'SUPER SALE\nJuly 16 - 24, 2024\n10 am - 10 pm',
                      'plywood.jpg',
                      '350.00 PHP',
                    ),
                    _buildSaleContainer(
                      context,
                      'MEGA SALE\nAugust 1 - 10, 2024\n9 am - 8 pm',
                      'hallowblocks.jpg',
                      '700.00 PHP',
                    ),
                    _buildSaleContainer(
                      context,
                      'FLASH SALE\nSeptember 5 - 15, 2024\n11 am - 9 pm',
                      'trimrib.png',
                      '251.00 PHP',
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    height: 8.0,
                    width: _currentPage == index ? 12.0 : 8.0,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Colors.grey
                          : Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  );
                }),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaleContainer(
      BuildContext context, String text, String imagePath, String price) {
    return Container(
      color: const Color.fromARGB(255, 105, 83, 42),
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 105, 83, 42),
              child: Center(
                child: Text.rich(
                  TextSpan(
                    text: text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
              color: const Color.fromARGB(255, 19, 13, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: 85,
                    image: AssetImage(imagePath),
                  ),
                  SizedBox(height: 10),
                  Text(
                    price,
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetails(
              title: title,
              imagePath: imagePath,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
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
      ),
    );
  }
}
