// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  final bool showCashInDialog;

  Wallet({this.showCashInDialog = false});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (showCashInDialog) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CashInDialog();
          },
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HW WALLET',
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
            Card(
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
                      'Balance',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '₱10,000.00',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(207, 178, 135, 1),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CashInDialog();
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(2, 8, 75, 1),
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                      ),
                      child: Center(
                        child: Text(
                          'Cash In',
                          style: TextStyle(
                              color: Color.fromRGBO(207, 178, 135, 1),
                              fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.shopping_bag, color: Colors.blue),
                    title: Text('Purchase at Hardware Store A'),
                    subtitle: Text('₱1,500.00'),
                    trailing: Text('21 July 2024'),
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_bag, color: Colors.blue),
                    title: Text('Purchase at Construction Supply B'),
                    subtitle: Text('₱2,300.00'),
                    trailing: Text('20 July 2024'),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_balance_wallet,
                        color: Colors.orange),
                    title: Text('Cash In via E-Wallet'),
                    subtitle: Text('₱5,000.00'),
                    trailing: Text('19 July 2024'),
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_bag, color: Colors.blue),
                    title: Text('Purchase at Store C'),
                    subtitle: Text('₱800.00'),
                    trailing: Text('18 July 2024'),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_balance_wallet,
                        color: Colors.orange),
                    title: Text('Cash In via Online Banking'),
                    subtitle: Text('₱2,000.00'),
                    trailing: Text('17 July 2024'),
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_bag, color: Colors.blue),
                    title: Text('Purchase at Hardware Store D'),
                    subtitle: Text('₱1,200.00'),
                    trailing: Text('16 July 2024'),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_balance_wallet,
                        color: Colors.orange),
                    title: Text('Cash In via Over the Counter'),
                    subtitle: Text('₱3,000.00'),
                    trailing: Text('15 July 2024'),
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_bag, color: Colors.blue),
                    title: Text('Purchase at Construction Supply E'),
                    subtitle: Text('₱1,000.00'),
                    trailing: Text('14 July 2024'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final Color textColor = Color.fromRGBO(2, 8, 75, 1);

class CashInDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        'Select Cash In Method',
        style: TextStyle(
          color: textColor, // Use the defined color
        ),
      ),
      children: [
        ListTile(
          leading: Icon(Icons.wallet_travel, color: textColor), // Icon color
          title: Text(
            'E-Wallet',
            style: TextStyle(color: textColor), // Text color
          ),
          onTap: () {
            // Handle E-Wallet payment
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: Icon(Icons.account_balance, color: textColor), // Icon color
          title: Text(
            'Online Banking',
            style: TextStyle(color: textColor), // Text color
          ),
          onTap: () {
            // Handle Online Banking payment
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: Icon(Icons.store, color: textColor), // Icon color
          title: Text(
            'Over the Counter',
            style: TextStyle(color: textColor), // Text color
          ),
          onTap: () {
            // Handle Over the Counter payment
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: Icon(Icons.more_horiz, color: textColor), // Icon color
          title: Text(
            'Other Methods',
            style: TextStyle(color: textColor), // Text color
          ),
          onTap: () {
            // Handle Other payment methods
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Wallet(showCashInDialog: true),
              ),
            );
          },
          child: Text('Add Funds'),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));
