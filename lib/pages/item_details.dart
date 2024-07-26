import 'package:flutter/material.dart';
import 'check_out.dart';
import 'store_page.dart';

class ItemDetails extends StatefulWidget {
  final String title;
  final String imagePath; // Updated: Use imagePath for dynamic image loading
  final String price;

  const ItemDetails({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.price,
  }) : super(key: key);

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int quantity = 1;
  final int availableStock = 543;

  void incrementQuantity() {
    setState(() {
      if (quantity < availableStock) quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Color.fromRGBO(207, 178, 135, 1)),
        ),
        backgroundColor: const Color.fromRGBO(2, 8, 75, 1),
        iconTheme: IconThemeData(color: Color.fromRGBO(207, 178, 135, 1)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Product Image
            Container(
              height: 300,
              child: PageView(
                children: [
                  Image.asset(widget.imagePath), // Use dynamic imagePath here
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Price and Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 105, 83, 42),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.right,
                    ),
                    const Text(
                      '2.1K Sold',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Quantity Selector
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color.fromARGB(255, 230, 228, 228)),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Text(
                    'Quantity:',
                    style: TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: decrementQuantity,
                  ),
                  Text(
                    '$quantity',
                    style: TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: incrementQuantity,
                  ),
                  Text(
                    '($availableStock available)',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Description
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color.fromARGB(255, 230, 228, 228)),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text(
                'Description:\n'
                'BASE METAL : Cold Rolled Steel Galvanized\n'
                'AVAILABLE THICKNESS : 0.40mm to 0.60mm\n'
                'LENGTH : Any transportable length\n'
                'WIDTH : Nominal width = 1090mm',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            // Free & Easy Returns
            Row(
              children: const [
                Icon(Icons.check_circle_outline, color: Colors.green),
                SizedBox(width: 5),
                Text('Free & Easy Returns'),
              ],
            ),
            const SizedBox(height: 10),
            // Reviews Section
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                border: Border.all(color: Color.fromARGB(255, 230, 228, 228)),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  // Product Ratings
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.orange),
                      SizedBox(width: 5),
                      Text('4.8/5 (162 Review)'),
                      Spacer(),
                      Text('See All', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Review Tags
                  Row(
                    children: const [
                      Chip(label: Text('Great Quality! (14)')),
                      SizedBox(width: 5),
                      Chip(label: Text('Affordable (6)')),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Bottom Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(2, 8, 75, 1),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to checkout page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Checkout()),
                      );
                    },
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(2, 8, 75, 1),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ShopScreen(storeName: '',)),
                      );
                    },
                    child: const Text(
                      'Store',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 19, 13, 0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
