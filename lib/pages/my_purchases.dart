import 'package:flutter/material.dart';
import 'cart.dart';
import 'purchases/cancelled.dart';
import 'purchases/awaiting_payment.dart';
import 'purchases/pending_shipment.dart';
import 'purchases/in_transit.dart';
import 'purchases/completed.dart';
import 'purchases/refunds.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliding App Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyPurchases(),
    );
  }
}

class MyPurchases extends StatelessWidget {
  const MyPurchases({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Purchases'),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined,
                  color: Color.fromARGB(255, 0, 0, 0)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.chat_outlined,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              onPressed: () => {},
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.red,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Awaiting Payment"),
              Tab(text: "Pending Shipment"),
              Tab(text: "In Transit"),
              Tab(text: "Completed"),
              Tab(text: "Cancelled"),
              Tab(text: "Refunds"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AwaitingPayment(),
            Pending(),
            InTransit(),
            Completed(),
            Cancelled(),
            Refunds(),
          ],
        ),
      ),
    );
  }
}
