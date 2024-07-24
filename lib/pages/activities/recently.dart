import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:test_dev/pages/item_details.dart';

class RecentlyViewedPage extends StatelessWidget {
  RecentlyViewedPage({super.key});

  final List<Map<String, String>> recentlyViewedItems = [
    {'imagePath': 'item1.png', 'title': 'PVC P-Trap', 'price': '125.00 PHP'},
    {
      'imagePath': 'item2.png',
      'title': 'Fine Fissured 2x2',
      'price': '205.00 PHP'
    },
    {'imagePath': 'item3.png', 'title': 'Rockwool 50mm', 'price': '320.00 PHP'},
    {'imagePath': 'item4.jpg', 'title': 'Plywood 3/16', 'price': '450.00 PHP'},
    {
      'imagePath': 'item5.png',
      'title': 'Tekscrew #12x55',
      'price': '30.00 PHP'
    },
    {
      'imagePath': 'item6.png',
      'title': 'Razor Barb Wire',
      'price': '445.00 PHP'
    },
    {'imagePath': 'item7.png', 'title': 'PVC End Bell', 'price': '12.00 PHP'},
    {'imagePath': 'item8.png', 'title': 'PVC Pipe 3m', 'price': '299.00 PHP'},
    {
      'imagePath': 'item9.png',
      'title': 'PVC Junction Box',
      'price': '43.00 PHP'
    },
    {'imagePath': 'item10.jpg', 'title': 'PVC Clamp', 'price': '6.00 PHP'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RECENTLY VIEWED',
          style: TextStyle(
              color: Color.fromRGBO(207, 178, 135, 1),
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
        ),
        backgroundColor: Color.fromRGBO(2, 8, 75, 1),
        iconTheme: IconThemeData(
          color: Color.fromRGBO(207, 178, 135, 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: recentlyViewedItems.length,
          itemBuilder: (BuildContext context, int index) {
            final item = recentlyViewedItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetails(
                      imagePath: item['imagePath']!,
                      title: item['title']!,
                      price: item['price']!,
                    ),
                  ),
                );
              },
              child: Container(
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
                          image: AssetImage(item['imagePath']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item['title']!,
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
                        item['price']!,
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
          },
          staggeredTileBuilder: (int index) =>
              StaggeredTile.extent(1, 250), // Adjust height as needed
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
      ),
    );
  }
}
