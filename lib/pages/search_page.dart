import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; // Import the staggered grid view package
import 'cart.dart';
import 'item_details.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a list of items with different properties
    final List<Map<String, String>> staggeredItems = [
      {'imagePath': 'item1.png', 'title': 'PVC P-Trap', 'price': '125.00 PHP'},
      {'imagePath': 'item2.1.png', 'title': 'PVC ISO', 'price': '53.00 PHP'},
      {'imagePath': 'item3.1.png', 'title': 'PVC Female', 'price': '10.00 PHP'},
      {
        'imagePath': 'item4.1.png',
        'title': 'PVC Patente',
        'price': '64.00 PHP'
      },
      {
        'imagePath': 'item5.1.png',
        'title': 'PVC Threaded',
        'price': '16.00 PHP'
      },
      {'imagePath': 'item6.1.png', 'title': 'PVC Tee', 'price': '15.00 PHP'},
      {'imagePath': 'item7.png', 'title': 'PVC End Bell', 'price': '12.00 PHP'},
      {'imagePath': 'item8.png', 'title': 'PVC Pipe 3m', 'price': '299.00 PHP'},
      {
        'imagePath': 'item9.png',
        'title': 'PVC Junction Box',
        'price': '43.00 PHP'
      },
      {'imagePath': 'item10.jpg', 'title': 'PVC Clamp', 'price': '6.00 PHP'},
    ];

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
                      IconButton(
                        icon: const Icon(Icons.search,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchPage()),
                        ),
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
              icon: const Icon(Icons.chat_outlined, color: Colors.white),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              ),
            ),
          ],
          backgroundColor: Color.fromRGBO(2, 8, 75, 1),
        ),
        body: CustomScrollView(
          slivers: [
            SliverStaggeredGrid.countBuilder(
              crossAxisCount: 2,
              itemCount: staggeredItems.length,
              itemBuilder: (BuildContext context, int index) {
                final item = staggeredItems[index];
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
                  child: StaggeredItemCard(
                    imagePath: item['imagePath']!,
                    title: item['title']!,
                    price: item['price']!,
                  ),
                );
              },
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.extent(1, 250), // Adjust height as needed
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}

class StaggeredItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;

  const StaggeredItemCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
