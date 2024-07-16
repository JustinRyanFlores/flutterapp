import 'package:flutter/material.dart';
import 'pages/my_purchases.dart';
import 'pages/my_profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 19, 13, 0),
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
                      color: Colors.white,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.handyman,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            "Be a seller!",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Icon(
                            Icons.chevron_right_outlined,
                            color: Colors.black,
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
                  color: Colors.white,
                ),
                onPressed: () => {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70.0, top: 8.0),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
                onPressed: () => {},
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 70.0, right: 5.0, top: 8.0),
              child: IconButton(
                icon: const Icon(
                  Icons.chat_outlined,
                  color: Colors.white,
                ),
                onPressed: () => {},
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Profile
              Container(
                color: const Color.fromARGB(255, 19, 13, 0),
                padding: const EdgeInsets.only(top: 60.0, bottom: 20.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyProfile()),
                        );
                      },
                      child: Row(
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyProfile()),
                                  );
                                },
                                child: const Text(
                                  'User_Sample_Name',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Row(
                                children: [
                                  Text(
                                    '3 Followers',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '28 Following',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // My Purchases
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                    top: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
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
                          color: Color.fromARGB(179, 0, 0, 0),
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
                                    builder: (context) => const MyPurchases()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.payment_outlined,
                                    color: Colors.black),
                                SizedBox(height: 5.0),
                                Text(
                                  'To Pay',
                                  style: TextStyle(
                                    color: Colors.black,
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
                                    builder: (context) => const MyPurchases()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.local_shipping_outlined,
                                    color: Colors.black),
                                SizedBox(height: 5.0),
                                Text(
                                  'To Ship',
                                  style: TextStyle(
                                    color: Colors.black,
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
                                    builder: (context) => const MyPurchases()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.inbox_outlined, color: Colors.black),
                                SizedBox(height: 5.0),
                                Text(
                                  'To Receive',
                                  style: TextStyle(
                                    color: Colors.black,
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
                                    builder: (context) => const MyPurchases()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.star_outline, color: Colors.black),
                                SizedBox(height: 5.0),
                                Text(
                                  'To Rate',
                                  style: TextStyle(
                                    color: Colors.black,
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
                  color: Color.fromARGB(255, 255, 255, 255),
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
                          color: Color.fromARGB(179, 0, 0, 0),
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
                                    builder: (context) => const MyPurchases()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.wallet, color: Colors.black),
                                SizedBox(height: 5.0),
                                Text(
                                  'Wallet',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  '₱ 3023.22',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 105, 83, 42),
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
                                    builder: (context) => const MyPurchases()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.add_circle_outline,
                                    color: Colors.black),
                                SizedBox(height: 5.0),
                                Text(
                                  'Funds',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  'Add Funds!',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 105, 83, 42),
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
                                    builder: (context) => const MyPurchases()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.credit_card, color: Colors.black),
                                SizedBox(height: 5.0),
                                Column(
                                  children: [
                                    Text(
                                      'Credit',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Text(
                                      '₱ 4563.12',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 105, 83, 42),
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
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
                                    builder: (context) => const MyPurchases()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.local_activity, color: Colors.black),
                                SizedBox(height: 5.0),
                                Text(
                                  'Vouchers',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  '37 Vouchers',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 105, 83, 42),
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
              // Activities (Custom Grid View)
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
