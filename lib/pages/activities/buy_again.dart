import 'package:flutter/material.dart';
import 'package:test_dev/pages/cart.dart';

class BuyAgainPage extends StatelessWidget {
  const BuyAgainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(2, 8, 75, 1),
        title: const Text(
          "BUY AGAIN",
          style: TextStyle(
              color: Color.fromRGBO(207, 178, 135, 1),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Color.fromRGBO(207, 178, 135, 1)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: 6, // Number of items
                itemBuilder: (context, index) {
                  return _buildGridItem(context, index);
                },
              ),
              const SizedBox(height: 16.0),
              const Text(
                "No more products found",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, int index) {
    final items = [
      {
        'image': 'wrench.png',
        'title': 'Lotus Wrench Cp 8',
        'subtitle': 'Bought 2 times',
        'price': '₱398',
        'badge': '',
      },
      {
        'image': 'chopsaw.png',
        'title': 'Chopesaw 2 4KW',
        'subtitle': 'Bought 3 times',
        'price': '₱10,994',
        'badge': 'Preferred',
      },
      {
        'image': 'ribtype.png',
        'title': 'Longspan Ribtype',
        'subtitle': 'Purchased Shop',
        'price': '₱560',
        'badge': 'Preferred',
      },
      {
        'image': 'item1.png',
        'title': 'PVC P-Trap',
        'subtitle': 'Bought 2 times',
        'price': '₱125',
        'badge': '',
      },
      {
        'image': 'trimrib.png',
        'title': 'HUU Trim Rib',
        'subtitle': 'Bought 3 times',
        'price': '₱251',
        'badge': '',
      },
      {
        'image': 'corrugated.png',
        'title': 'HUU Corrugated',
        'subtitle': '',
        'price': '₱334',
        'badge': '',
      },
    ];

    final item = items[index];

    return GestureDetector(
          onTap: () {
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage(item['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        item['subtitle']!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        item['price']!,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 155, 151, 151),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (item['badge']!.isNotEmpty)
              Positioned(
                top: 8.0,
                left: 8.0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  color: const Color.fromRGBO(2, 8, 75, 1),
                  child: Text(
                    item['badge']!,
                    style: TextStyle(
                      color: Color.fromRGBO(207, 178, 135, 1),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            Positioned(
              bottom: 8.0,
              right: 8.0,
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Color.fromRGBO(2, 8, 75, 1),
                ),
                onPressed: () {
                  // Handle add to cart action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}