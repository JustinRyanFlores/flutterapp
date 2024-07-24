import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  final String storeName;
  final String productName;
  final String productImage;
  final String productPrice;
  final String orderTotal;
  final bool isPaid;
  final String paymentDueDate;

  ProductContainer({
    required this.storeName,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.orderTotal,
    required this.isPaid,
    required this.paymentDueDate,
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
              Image.asset(
                '$productImage',
                width: 100,
                height: 100,
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
            isPaid ? 'Payment received' : 'Awaiting payment',
            style: TextStyle(
              color: isPaid ? Colors.green : Colors.red,
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            'Please complete payment by $paymentDueDate',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {},
            child: Text('Cancel Order'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Color.fromRGBO(207, 178, 135, 1),
              backgroundColor: Color.fromRGBO(2, 8, 75, 1),
            ),
          ),
        ],
      ),
    );
  }
}

class AwaitingPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ProductContainer(
            storeName: 'Do it Best',
            productName: 'PVC P-Trap',
            productImage: 'item1.png',
            productPrice: '₱125',
            orderTotal: '₱1,420',
            isPaid: false,
            paymentDueDate: '18-08-2024',
          ),
          ProductContainer(
            storeName: 'Northern Tool + Equipment',
            productName: 'Fine Fissured 2x2',
            productImage: 'item2.png',
            productPrice: '₱205',
            orderTotal: '₱2,578',
            isPaid: false,
            paymentDueDate: '18-08-2024',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 150.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
              items: [
                'ad0.png',
                'ad1.png',
                'ad2.png',
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(2, 8, 75, 1),
                      ),
                      child: Image.asset(i, fit: BoxFit.cover),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: AwaitingPayment(),
    ));
