
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';


class VoucherPage extends StatelessWidget {
  final List<Voucher> vouchers = [
    Voucher(
      title: "Shopee Mall",
      description: "20% off Capped at ₱200",
      discount: "20% off",
      minSpend: "Min. Spend ₱750",
      validity: "expiring: 9 hours left",
      buttonText: "Use Later",
    ),
    Voucher(
      title: "Shopee Live",
      description: "30% off Capped at ₱50",
      discount: "30% off",
      minSpend: "Min. Spend ₱0",
      validity: "expiring: 9 hours left",
      buttonText: "Use",
    ),
    Voucher(
      title: "Shopee Live",
      description: "30% off Capped at ₱50",
      discount: "30% off",
      minSpend: "Min. Spend ₱0",
      validity: "expiring: 9 hours left",
      buttonText: "Use",
    ),
    Voucher(
      title: "Shopee Live",
      description: "20% off Capped at ₱50",
      discount: "20% off",
      minSpend: "Min. Spend ₱0",
      validity: "expiring: 9 hours left",
      buttonText: "Use",
    ),
    Voucher(
      title: "Shopee Live XTRA",
      description: "15% off Capped at ₱100",
      discount: "15% off",
      minSpend: "Min. Spend ₱500",
      validity: "expiring: 9 hours left",
      buttonText: "Use",
    ),
    Voucher(
      title: "Shopee",
      description: "30% off Capped at ₱50",
      discount: "30% off",
      minSpend: "Min. Spend ₱0",
      validity: "expiring: 9 hours left",
      buttonText: "Use",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Vouchers'),
      ),
      body: ListView.builder(
        itemCount: vouchers.length,
        itemBuilder: (context, index) {
          final voucher = vouchers[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.local_offer, color: Colors.red),
              title: Text(voucher.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(voucher.description),
                  Text(voucher.minSpend),
                  Text(voucher.validity),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Add your logic for using the voucher
                },
                child: Text(voucher.buttonText),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Voucher {
  final String title;
  final String description;
  final String discount;
  final String minSpend;
  final String validity;
  final String buttonText;

  Voucher({
    required this.title,
    required this.description,
    required this.discount,
    required this.minSpend,
    required this.validity,
    required this.buttonText,
  });
}

