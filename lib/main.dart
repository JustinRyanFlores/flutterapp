// ignore_for_file: file_names, use_key_in_widget_constructors, use_super_parameters
import 'package:flutter/material.dart';
import 'cart.dart';
import 'home.dart';
import 'message.dart';
import 'notification.dart';
import 'profile.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined, color: Colors.black),
          ),
          BottomNavigationBarItem(
            label: "Message",
            icon: Icon(Icons.message_outlined, color: Colors.black),
          ),
          BottomNavigationBarItem(
            label: "Notification",
            icon: Icon(Icons.notifications_none, color: Colors.black),
          ),
          BottomNavigationBarItem(
            label: "Me",
            icon: Icon(Icons.person_outline, color: Colors.black),
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        Hometab(),
        MessageTab(),
        NotificationTab(),
        ProfileTab(),
      ],
    );
  }
}

//Home Tab
class Hometab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Home(),
      ),
    );
  }
}

//Message Tab
class MessageTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Message(),
      ),
    );
  }
}

//Notification Tab
class NotificationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: notification(),
      ),
    );
  }
}

//Profile Tab
class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Profile(),
      ),
    );
  }
}

//Profile Tab
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Cart(),
      ),
    );
  }
}
