import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  final String storeName;
  final String productName;
  final String productImage;
  final String productPrice;
  final String orderTotal;
  final bool isDelivered;
  final String deliveryDate;

  ProductContainer({
    required this.storeName,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.orderTotal,
    required this.isDelivered,
    required this.deliveryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            storeName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Image.network(
                productImage,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      productPrice,
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            'Order Total: $orderTotal',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            isDelivered ? 'Parcel has been delivered' : 'Parcel is on the way',
            style: TextStyle(
              color: isDelivered ? Colors.green : Colors.orange,
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            'Rate products by $deliveryDate',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              // Add your rating functionality here
            },
            child: Text('Rate'),
          ),
        ],
      ),
    );
  }
}

class Cancelled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ProductContainer(
            storeName: 'Handyman Official Store',
            productName: 'Bow Wow Dog Food Puppy Chow 15Kg',
            productImage: 'https://via.placeholder.com/50',
            productPrice: '₱1,450',
            orderTotal: '₱1,420',
            isDelivered: true,
            deliveryDate: '18-08-2024',
          ),
          ProductContainer(
            storeName: 'mookeesy.ph',
            productName: 'Flip Case infinix Zero X Neo Pro Smart...',
            productImage: 'https://via.placeholder.com/50',
            productPrice: '₱181',
            orderTotal: '₱126',
            isDelivered: true,
            deliveryDate: '18-08-2024',
          ),
          // Add more ProductContainer instances here
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Cancelled(),
    ));
