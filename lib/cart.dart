// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Hello!',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
