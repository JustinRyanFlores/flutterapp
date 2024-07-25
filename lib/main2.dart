// ignore_for_file: file_names, use_key_in_widget_constructors, use_super_parameters, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:test_dev/profile_no_account.dart';
import 'pages/cart.dart';
import 'home.dart';
import 'message.dart';
import 'notification.dart';
import 'profile.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage2(),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({Key? key}) : super(key: key);
  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  int _currentIndex = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading delay
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? _buildLoadingScreen() : _buildBody(),
      bottomNavigationBar: isLoading ? null : _buildBottomNavigationBar(),
    );
  }

  Widget _buildLoadingScreen() {
    return Container(
      color: const Color.fromRGBO(2, 8, 75, 1),
      child: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Image.asset('loading.png'),
        ),
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
        ProfileTab2(),
        CartPage(),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      fixedColor: Color.fromRGBO(2, 8, 75, 1),
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home_outlined, color: Color.fromRGBO(2, 8, 75, 1)),
        ),
        BottomNavigationBarItem(
          label: "Message",
          icon:
              Icon(Icons.message_outlined, color: Color.fromRGBO(2, 8, 75, 1)),
        ),
        BottomNavigationBarItem(
          label: "Notification",
          icon: Icon(Icons.notifications_none,
              color: Color.fromRGBO(2, 8, 75, 1)),
        ),
        BottomNavigationBarItem(
          label: "Me",
          icon: Icon(Icons.person_outline, color: Color.fromRGBO(2, 8, 75, 1)),
        ),
      ],
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}

// Home Tab
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

// Message Tab
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

// Notification Tab
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

// Profile Tab
class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ProfileNoAccount(),
      ),
    );
  }
}

class ProfileTab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Profile(),
      ),
    );
  }
}

// Cart Tab
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
