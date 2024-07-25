// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test_dev/pages/item_details.dart';

class Store extends StatelessWidget {
  final String storeName;

  const Store({super.key, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShopScreen(storeName: storeName),
    );
  }
}

class ShopScreen extends StatelessWidget {
  final String storeName;

  const ShopScreen({super.key, required this.storeName});

  @override
  Widget build(BuildContext context) {
    // List of top product names
    final List<String> topProductNames = [
      'PVC Ceiling Panel',
      'HUU Corrugated',
      'HUU Trim Rib',
    ];

    // List of top product image paths
    final List<String> topProductImages = [
      'ceilingtype.jpg',
      'corrugated.png',
      'longspan.jpg',
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
              180.0), // Increased height to accommodate TabBar
          child: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            flexibleSpace: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: 15.0, left: 10.0, right: 10.0, bottom: 10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(2, 8, 75, 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 320.0,
                                height: 30,
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 4.0),
                                        child: Icon(Icons.search,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(width: 8.0),
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: 'Search in shop',
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.only(bottom: 15.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('huu.png'),
                              ),
                              SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'HUU Building Solutions Inc.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Active 13 minutes ago',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.yellow, size: 16.0),
                                      Text(
                                        '4.7/5.0',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(width: 5.0),
                                      Text(
                                        '| 1.6K Followers',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  minimumSize: Size(50, 35),
                                ),
                                onPressed: () {
                                  // Follow functionality
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.add,
                                      color: Color.fromRGBO(2, 8, 75, 1),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Follow',
                                      style: TextStyle(
                                        color: Color.fromRGBO(2, 8, 75, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  minimumSize: Size(125, 35),
                                ),
                                onPressed: () {
                                  // Chat functionality
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.chat_outlined,
                                      color: Color.fromRGBO(2, 8, 75, 1),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Chat',
                                      style: TextStyle(
                                        color: Color.fromRGBO(2, 8, 75, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                TabBar(
                  tabs: [
                    Tab(text: 'Shop'),
                    Tab(text: 'Products'),
                    Tab(text: 'Categories'),
                  ],
                  indicatorColor: Color.fromRGBO(2, 8, 75, 1),
                  labelColor: Color.fromRGBO(2, 8, 75, 1),
                  unselectedLabelColor: Color.fromRGBO(2, 8, 75, 1),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Promotional Banners
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.all(8.0),
                      children: [
                        PromotionBanner(
                          title: '₱100 off',
                          subtitle: 'Min. Spend ₱3K\nValid Till 09.08.2024',
                          buttonText: 'Claim',
                          buttonCallback: () {
                            // Implement claim functionality
                          },
                          width: 300,
                        ),
                        SizedBox(width: 8.0),
                        PromotionBanner(
                          title: '10% off',
                          subtitle:
                              'Min. Spend ₱0\nSpecific Products Only\nValid Till 08.08.2024',
                          buttonText: 'Claim',
                          buttonCallback: () {
                            // Implement claim functionality
                          },
                          width: 300,
                        ),
                      ],
                    ),
                  ),
                  // Recommended For You Section
                  SectionHeader(title: 'Recommended For You'),
                  SizedBox(
                    height: 230,
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
                      ],
                    ),
                  ),
                  // Top Products Section
                  SectionHeader(title: 'Top Products'),
                  SizedBox(
                    height: 500, // Adjust height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: topProductNames.length,
                      itemBuilder: (context, index) {
                        return ItemCard(
                          imagePath: topProductImages[index],
                          title: topProductNames[index],
                          price: '499.00 PHP',
                          position: index + 1,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            ProductsTab(), // Placeholder for Products tab
            CategoriesTab(),
          ],
        ),
      ),
    );
  }
}

class CategoriesTab extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Roofing Materials', 'image': 'ceilingtype.jpg', 'count': 6},
    {'name': 'Flooring', 'image': 'hallowblocks.jpg', 'count': 5},
    {'name': 'Pipes', 'image': 'pvc.jpg', 'count': 5},
    {'name': 'Ceiling Board', 'image': 'plywood.jpg', 'count': 3},
    {'name': 'Plumbing Supplies', 'image': 'item1.png', 'count': 3},
    {
      'name': 'Cement and Concrete Products ',
      'image': 'cement.jpg',
      'count': 3
    },
    {'name': 'Switch and Outlets ', 'image': 'socket.png', 'count': 2},
    {'name': 'Power Tools', 'image': 'chopsaw.png', 'count': 2},
    {'name': 'Hand Tools', 'image': 'hammer.png', 'count': 2},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryCard(
          name: category['name'],
          image: category['image'],
          itemCount: category['count'],
        );
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  final String image;
  final int itemCount;

  const CategoryCard({
    Key? key,
    required this.name,
    required this.image,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0), // Add some spacing between items
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: 100.0, // Fixed width for the image
              height: 100.0, // Fixed height for the image
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text('$itemCount items',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductsTab extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'title': 'HUU Trim Rib', 'image': 'trimrib.png', 'price': '251.00 PHP'},
    {
      'title': 'HUU Corrugasted',
      'image': 'corrugated.png',
      'price': '334.00 PHP'
    },
    {
      'title': 'Seymour Ribtype',
      'image': 'ribtype.png',
      'price': '1,533.00 PHP'
    },
    {
      'title': 'PVC Ceiling Panel',
      'image': 'ceilingtype.jpg',
      'price': '390.00 PHP'
    },
    {
      'title': 'Longspan Ribtype',
      'image': 'longspan.jpg',
      'price': '560.00 PHP'
    },
    {
      'title': 'Ceiling Panel',
      'image': 'ceilingtype.jpg',
      'price': '120.00 PHP'
    },
    {
      'title': 'Corrugated Sheet',
      'image': 'corrugated.png',
      'price': '500.00 PHP'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75, // Adjust the aspect ratio as needed
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(
          imagePath: products[index]['image'],
          title: products[index]['title'],
          price: products[index]['price'],
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;

  ProductCard(
      {required this.imagePath, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                '$imagePath',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PromotionBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? buttonText;
  final VoidCallback? buttonCallback;
  final double width;

  PromotionBanner({
    required this.title,
    required this.subtitle,
    this.buttonText,
    this.buttonCallback,
    this.width = 250,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Color.fromRGBO(2, 8, 75, 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(2, 8, 75, 1),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          if (buttonText != null && buttonCallback != null)
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: buttonCallback,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(2, 8, 75, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  buttonText!,
                  style: TextStyle(color: Color.fromRGBO(207, 178, 135, 1)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final int? position;

  const ItemCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    this.position,
  });

  @override
  Widget build(BuildContext context) {
    Color medalColor;
    String medalText;

    // Determine the color and text for the medal based on the position
    switch (position) {
      case 1:
        medalColor = Colors.amber; // Gold
        medalText = 'Top 1';
        break;
      case 2:
        medalColor = Colors.grey; // Silver
        medalText = 'Top 2';
        break;
      case 3:
        medalColor = Colors.brown; // Bronze
        medalText = 'Top 3';
        break;
      default:
        medalColor = Colors.transparent; // Default to no color
        medalText = '';
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetails(
              imagePath: imagePath,
              title: title,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        width: 200, // Increased width
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Container for image
                Container(
                  height: 150, // Adjust height as needed
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(8.0)),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit
                          .contain, // Ensure the image covers the container
                    ),
                  ),
                ),
                if (position != null && position! <= 3)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: medalColor,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          medalText,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
