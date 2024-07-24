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
      'Top Product A',
      'Top Product B',
      'Top Product C',
    ];

    // List of top product image paths
    final List<String> topProductImages = [
      'ceilingtype.jpg',
      'corrugated.png',
      'longspan.jpg',
    ];

return Scaffold(
  appBar: PreferredSize(
    preferredSize: Size.fromHeight(150.0), // Increase the height
    child: AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      flexibleSpace: Container(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0), // Adjusted padding
        decoration: BoxDecoration(
          color: Color.fromRGBO(2, 8, 75, 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 8.0), // Adjust this if needed
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 320.0, // Adjust the width as needed
                      height: 30, // Adjust the height as needed
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5.0), // Adjust this value to move the icon downward
                              child: Icon(Icons.search, color: Colors.grey),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search in shop',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(bottom: 15.0), // Adjust this value to move text upward
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
                // Store info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage('https://via.placeholder.com/50'), // Replace with actual image URL
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
                                Icon(Icons.star, color: Colors.yellow, size: 16.0),
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
                              borderRadius: BorderRadius.circular(5.0), // Lower the radius
                            ),
                            minimumSize: Size(115, 35),
                          ),
                          onPressed: () {
                            // Follow functionality
                          },
                          child: Text('+ Follow', style: TextStyle(color: Color.fromRGBO(2, 8, 75, 1)),),
                        ),
                        SizedBox(height: 10.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            minimumSize: Size(40, 35),
                          ),
                          onPressed: () {
                            // Chat functionality
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.chat_outlined),
                              SizedBox(width: 5),
                              Text('Chat',style: TextStyle(color: Color.fromRGBO(2, 8, 75, 1),)),
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
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Promotional Banners
            Container(
              color: Colors.orangeAccent,
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PromotionBanner(
                    title: '₱100 off',
                    subtitle: 'Min. Spend ₱3K\nValid Till 09.08.2024',
                    buttonText: 'Claim',
                    buttonCallback: () {
                      // Implement claim functionality
                    },
                  ),
                  PromotionBanner(
                    title: '10% off',
                    subtitle: 'Min. Spend ₱0\nSpecific Products Only\nValid Till 08.08.2024',
                  ),
                ],
              ),
            ),
            // Recommended For You Section
            SectionHeader(title: 'Recommended For You'),
            SizedBox(
              height: 230, // Adjust height as needed
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
            // Top Products Section
            SectionHeader(title: 'Top Products'),
            Padding(
              padding: const EdgeInsets.all(0),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(), // Prevent scrolling inside the list
                shrinkWrap: true,
                itemCount: topProductNames.length,
                itemBuilder: (context, index) {
                  return ItemCard(
                    imagePath: topProductImages[index], // Use image paths from the list
                    title: topProductNames[index],
                    price: '₱${100 * (index + 1)}.00',
                    position: index + 1, // Add position for top products
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class PromotionBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? buttonText;
  final VoidCallback? buttonCallback;

  PromotionBanner({
    required this.title,
    required this.subtitle,
    this.buttonText,
    this.buttonCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.yellowAccent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12),
          ),
          if (buttonText != null && buttonCallback != null)
            ElevatedButton(
              onPressed: buttonCallback,
              child: Text(buttonText!),
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
        width: 150,
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
                    borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover, // Ensure the image covers the container
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
