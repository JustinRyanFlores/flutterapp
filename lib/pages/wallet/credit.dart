// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Credit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'HW CREDITS',
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Color.fromRGBO(240, 240, 240, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Available Credit',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '₱50,000.00',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(207, 178, 135, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TabBar(
                tabs: [
                  Tab(text: 'Bills'),
                  Tab(text: 'Transactions'),
                ],
                indicatorColor: Color.fromRGBO(2, 8, 75, 1),
                labelColor: Color.fromRGBO(2, 8, 75, 1),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: TabBarView(
                  children: [
                    BillsTab(),
                    TransactionsTab(),
                  ],
                ),
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
        ),
      ),
    );
  }
}

class BillsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.receipt, color: Colors.blue),
          title: Text('Electricity Bill'),
          subtitle: Text('Due: 25 July 2024'),
          trailing: Text('₱3,000.00'),
          onTap: () => _showPaymentMethodsDialog(context, 'Electricity Bill'),
        ),
        ListTile(
          leading: Icon(Icons.receipt, color: Colors.blue),
          title: Text('Water Bill'),
          subtitle: Text('Due: 28 July 2024'),
          trailing: Text('₱1,200.00'),
          onTap: () => _showPaymentMethodsDialog(context, 'Water Bill'),
        ),
        ListTile(
          leading: Icon(Icons.receipt, color: Colors.blue),
          title: Text('Internet Bill'),
          subtitle: Text('Due: 30 July 2024'),
          trailing: Text('₱2,500.00'),
          onTap: () => _showPaymentMethodsDialog(context, 'Internet Bill'),
        ),
        ListTile(
          leading: Icon(Icons.receipt, color: Colors.blue),
          title: Text('Gas Bill'),
          subtitle: Text('Due: 31 July 2024'),
          trailing: Text('₱1,800.00'),
          onTap: () => _showPaymentMethodsDialog(context, 'Gas Bill'),
        ),
        ListTile(
          leading: Icon(Icons.receipt, color: Colors.blue),
          title: Text('Mobile Bill'),
          subtitle: Text('Due: 05 August 2024'),
          trailing: Text('₱800.00'),
          onTap: () => _showPaymentMethodsDialog(context, 'Mobile Bill'),
        ),
        // Add more ListTile widgets for more bills
      ],
    );
  }

  void _showPaymentMethodsDialog(BuildContext context, String billType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Methods for $billType'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.wallet_travel),
                title: Text('E-Wallet'),
                onTap: () {
                  // Handle E-Wallet payment
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.account_balance),
                title: Text('Online Banking'),
                onTap: () {
                  // Handle Online Banking payment
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.store),
                title: Text('Over the Counter'),
                onTap: () {
                  // Handle Over the Counter payment
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.more_horiz),
                title: Text('Other Methods'),
                onTap: () {
                  // Handle Other payment methods
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class TransactionsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.shopping_bag, color: Colors.blue),
          title: Text('Purchase at Store A'),
          subtitle: Text('₱5,000.00'),
          trailing: Text('21 July 2024'),
        ),
        ListTile(
          leading: Icon(Icons.shopping_bag, color: Colors.blue),
          title: Text('Purchase at Store B'),
          subtitle: Text('₱3,200.00'),
          trailing: Text('20 July 2024'),
        ),
        ListTile(
          leading: Icon(Icons.account_balance_wallet, color: Colors.orange),
          title: Text('Loan Payment'),
          subtitle: Text('₱10,000.00'),
          trailing: Text('18 July 2024'),
        ),
        ListTile(
          leading: Icon(Icons.shopping_bag, color: Colors.blue),
          title: Text('Purchase at Store C'),
          subtitle: Text('₱2,500.00'),
          trailing: Text('17 July 2024'),
        ),
        ListTile(
          leading: Icon(Icons.shopping_bag, color: Colors.blue),
          title: Text('Purchase at Store D'),
          subtitle: Text('₱1,200.00'),
          trailing: Text('16 July 2024'),
        ),
        ListTile(
          leading: Icon(Icons.account_balance_wallet, color: Colors.orange),
          title: Text('Credit Card Payment'),
          subtitle: Text('₱4,000.00'),
          trailing: Text('15 July 2024'),
        ),
        // Add more ListTile widgets for more transactions
      ],
    );
  }
}

void main() => runApp(MaterialApp(
      home: Credit(),
    ));
