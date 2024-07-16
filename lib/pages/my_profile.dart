import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 70.0, right: 5.0, top: 8.0),
            child: IconButton(
              icon: const Icon(
                Icons.check,
                color: Color.fromARGB(255, 19, 13, 0),
              ),
              onPressed: () => {},
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text('My Profile'),
      ),
    );
  }
}
