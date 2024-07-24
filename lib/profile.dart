// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test_dev/pages/activities/buy_again.dart';
import 'package:test_dev/pages/activities/favorites.dart';
import 'package:test_dev/pages/activities/recently.dart';
import 'package:test_dev/pages/activities/rewards.dart';
import 'package:test_dev/pages/activities/support.dart';
import 'package:test_dev/main.dart';
import 'pages/wallet/mywallet.dart';
import 'pages/wallet/credit.dart';
import 'pages/my_purchases.dart';
import 'pages/my_profile.dart';
import 'pages/cart.dart';
import 'pages/wallet/vouchers.dart';
import 'itemcardwidget.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final List<Map<String, String>> staggeredItems = [
    {'imagePath': 'item1.png', 'title': 'PVC P-Trap', 'price': '125.00 PHP'},
    {
      'imagePath': 'item2.png',
      'title': 'Fine Fissured 2x2',
      'price': '205.00 PHP'
    },
    {'imagePath': 'item3.png', 'title': 'Rockwool 50mm', 'price': '320.00 PHP'},
    {'imagePath': 'item4.jpg', 'title': 'Plywood 3/16', 'price': '450.00 PHP'},
    {
      'imagePath': 'item5.png',
      'title': 'Tekscrew #12x55',
      'price': '30.00 PHP'
    },
    {
      'imagePath': 'item6.png',
      'title': 'Razor Barb Wire',
      'price': '445.00 PHP'
    },
    {'imagePath': 'item7.png', 'title': 'PVC End Bell', 'price': '12.00 PHP'},
    {'imagePath': 'item8.png', 'title': 'PVC Pipe 3m', 'price': '299.00 PHP'},
    {
      'imagePath': 'item9.png',
      'title': 'PVC Junction Box',
      'price': '43.00 PHP'
    },
    {'imagePath': 'item10.jpg', 'title': 'PVC Clamp', 'price': '6.00 PHP'},
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(2, 8, 75, 1),
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
                                    color: Color.fromRGBO(207, 178, 135, 1),
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
                                      color: Color.fromRGBO(207, 178, 135, 1),
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '28 Following',
                                    style: TextStyle(
                                      color: Color.fromRGBO(207, 178, 135, 1),
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
                                    builder: (context) => const MyPurchases()),
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
                                    builder: (context) => const MyPurchases()),
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
                                    builder: (context) => const MyPurchases()),
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
                                    builder: (context) => const MyPurchases()),
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
                                    builder: (context) => Wallet()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.wallet,
                                    color: Color.fromARGB(174, 0, 0, 0)),
                                SizedBox(height: 5.0),
                                Text(
                                  'Balance',
                                  style: TextStyle(
                                    color: Color.fromARGB(174, 0, 0, 0),
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  '₱ 3023.22',
                                  style: TextStyle(
                                    color: Color.fromRGBO(207, 178, 135, 1),
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
                                  builder: (context) =>
                                      Wallet(showCashInDialog: true),
                                ),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.add_circle_outline,
                                    color: Color.fromARGB(174, 0, 0, 0)),
                                SizedBox(height: 5.0),
                                Text(
                                  'Funds',
                                  style: TextStyle(
                                    color: Color.fromARGB(174, 0, 0, 0),
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  'Add Funds!',
                                  style: TextStyle(
                                    color: Color.fromRGBO(207, 178, 135, 1),
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
                                    builder: (context) => Credit()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.credit_card,
                                    color: Color.fromARGB(174, 0, 0, 0)),
                                SizedBox(height: 5.0),
                                Column(
                                  children: [
                                    Text(
                                      'Credit',
                                      style: TextStyle(
                                        color: Color.fromARGB(174, 0, 0, 0),
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Text(
                                      '₱ 4563.12',
                                      style: TextStyle(
                                        color: Color.fromRGBO(207, 178, 135, 1),
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
                                    builder: (context) => VoucherPage()),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(Icons.local_activity,
                                    color: Color.fromARGB(174, 0, 0, 0)),
                                SizedBox(height: 5.0),
                                Text(
                                  'Vouchers',
                                  style: TextStyle(
                                    color: Color.fromARGB(174, 0, 0, 0),
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  '37 Vouchers',
                                  style: TextStyle(
                                    color: Color.fromRGBO(207, 178, 135, 1),
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
                            color: Color.fromARGB(174, 0, 0, 0),
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
                            navigateToActivityPage(
                                context, activityNames[index]);
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
                                  color: iconColors[index],
                                  size: 24.0,
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  activityNames[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Color.fromARGB(174, 0, 0, 0),
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
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: Color.fromARGB(174, 0, 0, 0),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "You May Also Like",
                            style: TextStyle(
                              color: Color.fromARGB(174, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color.fromARGB(174, 0, 0, 0),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: staggeredItems.length,
                itemBuilder: (context, index) {
                  final item = staggeredItems[index];
                  return StaggeredItemCard(
                    imagePath: item['imagePath']!,
                    title: item['title']!,
                    price: item['price']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Activity Page Attributes
List<String> activityNames = [
  'Favorites',
  'Recently Viewed',
  'Buy Again',
  'Rewards',
  'Customer Support',
];

final List<Color> iconColors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.purple,
  Color.fromRGBO(2, 8, 75, 1),
];

final List<IconData> activityIcons = [
  Icons.favorite,
  Icons.history,
  Icons.shopping_cart,
  Icons.card_giftcard,
  Icons.support_agent,
];

// Activity Page Navigation
void navigateToActivityPage(BuildContext context, String activityName) {
  switch (activityName) {
    case 'Favorites':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoritesPage()),
      );
      break;
    case 'Recently Viewed':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecentlyViewedPage()),
      );
      break;
    case 'Buy Again':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BuyAgainPage()),
      );
      break;
    case 'Rewards':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RewardsPage()),
      );
      break;
    case 'Customer Support':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CustomerSupportPage()),
      );
      break;
    default:
      break;
  }
}

