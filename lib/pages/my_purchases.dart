// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_dev/message.dart';
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
      theme: ThemeData(),
      home: const MyPurchases(),
    );
  }
}

class MyPurchases extends StatelessWidget {
  final int initialIndex;

  const MyPurchases({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      initialIndex: initialIndex,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'MY PURCHASES',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Color.fromRGBO(207, 178, 135, 1),
            ),
          ),
          backgroundColor: Color.fromRGBO(2, 8, 75, 1),
          iconTheme: IconThemeData(
            color: Color.fromRGBO(207, 178, 135, 1),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.chat_outlined,
                color: Color.fromRGBO(207, 178, 135, 1),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Message()),
              ),
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Color.fromRGBO(207, 178, 135, 1),
            labelColor: Color.fromRGBO(207, 178, 135, 1),
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
