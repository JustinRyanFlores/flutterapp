// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test_dev/message.dart';
import 'pages/my_purchases.dart';
import 'pages/my_profile.dart';
import 'pages/cart.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
            IconButton(
              icon:
                  const Icon(Icons.shopping_cart_outlined, color: Colors.white),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.message_outlined, color: Colors.white),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Message()),
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
                color: const Color.fromARGB(255, 19, 13, 0),
                padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage()),
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
                                            EditProfilePage()),
                                  );
                                },
                                child: const Text(
                                  'User_Sample_Name',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
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
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '28 Following',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 10.0,
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
                          color: Colors.black,
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
                          color: Colors.black,
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
                                  'Balance',
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
              Divider(color: Colors.transparent, height: 10),
              // Activities (Custom Grid View)
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
                padding: const EdgeInsets.only(bottom: 30, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          'My Activities',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                        childAspectRatio: 2.0,
                      ),
                      itemCount: activityNames.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            navigateToActivityPage(activityNames[index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  activityIcons[index],
                                  size: 24.0,
                                  color: Colors.black,
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  activityNames[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "You May Also Like",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.transparent, height: 10),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}

List<String> activityNames = [
  'Favorites',
  'Recently Viewed',
  'Buy Again',
  'Rewards',
  'Customer Support',
];

final List<IconData> activityIcons = [
  Icons.favorite,
  Icons.history,
  Icons.shopping_cart,
  Icons.card_giftcard,
  Icons.support_agent,
];

// Activity Page Navigation
void navigateToActivityPage(String activityName) {
  // Perform navigation or action based on activity name
  switch (activityName) {
    case 'Favorites':
      // Navigate to Favorites page or perform corresponding action
      break;
    case 'Recently Viewed':
      // Navigate to Recently Viewed page or perform corresponding action
      break;
    case 'Buy Again':
      // Navigate to Buy Again page or perform corresponding action
      break;
    case 'Rewards':
      // Navigate to Rewards page or perform corresponding action
      break;
    case 'Customer Support':
      // Navigate to Customer Support page or perform corresponding action
      break;
    default:
      break;
  }
}
