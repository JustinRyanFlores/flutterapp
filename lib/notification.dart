import 'package:flutter/material.dart';

class notification extends StatelessWidget {
  const notification({super.key});

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
