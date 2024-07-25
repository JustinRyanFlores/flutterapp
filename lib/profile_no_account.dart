// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_dev/login.dart';
import 'package:test_dev/main.dart';
import 'pages/wallet/mywallet.dart';
import 'pages/wallet/credit.dart';
import 'pages/my_purchases.dart';
import 'pages/my_profile.dart';
import 'pages/cart.dart';
import 'pages/wallet/vouchers.dart';

class ProfileNoAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(2, 8, 75, 1),
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 0.0, right: 20.0, top: 18.0),
                child: Transform(
                  transform: Matrix4.translationValues(-20.0, -10.0, 0.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      width: 150.0,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      color: Color.fromRGBO(207, 178, 135, 1),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.handyman,
                            color: Color.fromRGBO(2, 8, 75, 1),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            "Be a seller!",
                            style: TextStyle(
                              color: Color.fromRGBO(2, 8, 75, 1),
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Icon(
                            Icons.chevron_right_outlined,
                            color: Color.fromRGBO(2, 8, 75, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 70.0, top: 8.0),
              child: IconButton(
                icon: const Icon(
                  Icons.settings_outlined,
                  color: Color.fromRGBO(207, 178, 135, 1),
                ),
                onPressed: () => {},
              ),
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined,
                  color: Color.fromRGBO(207, 178, 135, 1)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.message_outlined,
                  color: Color.fromRGBO(207, 178, 135, 1)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessageTab()),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile
              Container(
                color: const Color.fromRGBO(2, 8, 75, 1),
                padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage('sampleprofile.png'),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Guest User',
                              style: TextStyle(
                                color: Color.fromRGBO(207, 178, 135, 1),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              },
                              child: const Text(
                                'Log in to access more features',
                                style: TextStyle(
                                  color: Color.fromRGBO(207, 178, 135, 1),
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Color.fromRGBO(2, 8, 75, 1),
                            backgroundColor: Color.fromRGBO(207, 178, 135, 1),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: Text('Login or Sign Up'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // My Purchases
              Divider(color: Colors.transparent, height: 10),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                    top: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'My Purchases',
                        style: TextStyle(
                          color: Color.fromARGB(174, 0, 0, 0),
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.payment_outlined,
                                    color: Color.fromARGB(174, 0, 0, 0)),
                                SizedBox(height: 5.0),
                                Text(
                                  'To Pay',
                                  style: TextStyle(
                                    color: Color.fromARGB(174, 0, 0, 0),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.local_shipping_outlined,
                                    color: Color.fromARGB(174, 0, 0, 0)),
                                SizedBox(height: 5.0),
                                Text(
                                  'To Ship',
                                  style: TextStyle(
                                    color: Color.fromARGB(174, 0, 0, 0),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.inbox_outlined,
                                    color: Color.fromARGB(174, 0, 0, 0)),
                                SizedBox(height: 5.0),
                                Text(
                                  'To Receive',
                                  style: TextStyle(
                                    color: Color.fromARGB(174, 0, 0, 0),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.star_outline,
                                    color: Color.fromARGB(174, 0, 0, 0)),
                                SizedBox(height: 5.0),
                                Text(
                                  'To Rate',
                                  style: TextStyle(
                                    color: Color.fromARGB(174, 0, 0, 0),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(color: Colors.transparent, height: 10),
              // My Wallet
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'My Wallet',
                        style: TextStyle(
                          color: Color.fromARGB(174, 0, 0, 0),
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.account_balance_wallet_outlined,
                                    color: Color.fromARGB(174, 0, 0, 0)),
                                SizedBox(height: 5.0),
                                Text(
                                  'Balance',
                                  style: TextStyle(
                                    color: Color.fromARGB(174, 0, 0, 0),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.credit_card_outlined,
                                    color: Color.fromARGB(174, 0, 0, 0)),
                                SizedBox(height: 5.0),
                                Text(
                                  'Cards',
                                  style: TextStyle(
                                    color: Color.fromARGB(174, 0, 0, 0),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.card_giftcard_outlined,
                                    color: Color.fromARGB(174, 0, 0, 0)),
                                SizedBox(height: 5.0),
                                Text(
                                  'Vouchers',
                                  style: TextStyle(
                                    color: Color.fromARGB(174, 0, 0, 0),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.local_activity_outlined,
                                    color: Color.fromARGB(174, 0, 0, 0)),
                                SizedBox(height: 5.0),
                                Text(
                                  'Rewards',
                                  style: TextStyle(
                                    color: Color.fromARGB(174, 0, 0, 0),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(color: Colors.transparent, height: 200),
              // Ads
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
