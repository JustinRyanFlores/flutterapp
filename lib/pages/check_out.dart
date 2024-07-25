// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'change_address.dart';
import 'payment_option.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CHECKOUT',
          style: TextStyle(color:Color.fromRGBO(207,178,135, 1),fontSize: 18,fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color:Color.fromRGBO(207,178,135, 1)),
        backgroundColor: Color.fromRGBO(2, 8, 75, 1),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80.0), // Add padding to avoid button overlay
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Free shipping banner
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        const Icon(Icons.local_shipping, color: Colors.green),
                        const SizedBox(width: 8.0),
                        const Text(
                          'Free shipping discount applied',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Delivery address
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeAddress(),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      elevation: 5,
                      child: const ListTile(
                        leading: Icon(Icons.location_pin, color: Colors.red),
                        title: Text(
                          'Delivery Address',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'John Emmanuel Umandal\n(+63) 963 789 4351\nBlock 2 Lot 5 Neptune Street, Golden Country Homes, Alangilan\nAlangilan, Batangas City, Batangas, South Luzon, 4200',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Product details
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 5,
                    child: ListTile(
                      leading: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: AssetImage('ceilingtype.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: const Text(
                        'HUU BUILDING SOLUTIONS INC.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Roofing'),
                          Text('Variation: Trim Rib'),
                          Text('₱251'),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('x1'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Shipping options
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.local_shipping, color: Colors.blue),
                      title: const Text(
                        'Shipping Option',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Standard Local'),
                          Text('Guaranteed to get by 22 - 25 Jul'),
                          Text(
                            'Get a ₱50 voucher if no delivery was attempted by 25 Jul 2024.',
                          ),
                        ],
                      ),
                      trailing: const Text('₱57'),
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Order total
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 5,
                    child: const ListTile(
                      title: Text(
                        'Order Total (1 Item): ₱251',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('E-receipt'),
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Payment option
                  GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentOptions(), // Replace with your target page
      ),
    );
  },
  child: Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
    elevation: 5,
    child: const ListTile(
      leading: Icon(Icons.payment, color: Colors.purple),
      title: Text(
        'Payment Option',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Payment Center / E-Wallet - GCash'),
    ),
  ),
),
const SizedBox(height: 20.0),

                  // Payment details
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payment Details',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Merchandise Subtotal'),
                              Text('₱149'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Shipping Subtotal'),
                              Text('₱57'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Shipping Discount Subtotal'),
                              Text('-₱50'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Handling fee'),
                              Text('₱3'),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Total Payment',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '₱159',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                   // Add space at the bottom
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle place order action
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Color.fromRGBO(2, 8, 75, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Place Order',
                    style: TextStyle(fontSize: 16.0, color: Color.fromRGBO(207,178,135, 1)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
