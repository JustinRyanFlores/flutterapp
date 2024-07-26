// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:test_dev/pages/cart.dart';
import 'message.dart';

class notification extends StatelessWidget {
  const notification({super.key});

  // Root widget of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'NOTIFICATIONS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Color.fromRGBO(207, 178, 135, 1),
              ),
            ),
            backgroundColor: Color.fromRGBO(2, 8, 75, 1),
            iconTheme: IconThemeData(
              color: Color.fromRGBO(207, 178, 135, 1),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined,
                    color: Color.fromRGBO(207, 178, 135, 1)),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cart()),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.chat_outlined,
                  color: Color.fromRGBO(207, 178, 135, 1),
                ),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Message()))
                },
              ),
            ],
            bottom: TabBar(
              indicatorColor: Color.fromRGBO(207, 178, 135, 1),
              labelColor: Color.fromRGBO(207, 178, 135, 1),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'Orders'),
                Tab(text: 'Offers/Other Alerts'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ProductInfo(),
              NotificationMain(),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationMain extends StatelessWidget {
  const NotificationMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Available Alerts'),
        ),
        body: const NotificationBody(),
      ),
    );
  }
}

//Notification Tab Offers/Alerts Code
class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.sell, color: Colors.orange),
                    title: Text('Promotions'),
                    subtitle: Text('Take part at many promotions'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('More'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Promotions()),
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.event, color: Colors.green),
                    title: Text('Event Reminder'),
                    subtitle: Text('View current and future events'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('See Events'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationEvents()));
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.group, color: Colors.pink),
                    title: Text('Social Updates'),
                    subtitle: Text('Stay up to date with the latest trends'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('See Socials'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SocialNotification()));
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.app_registration, color: Colors.red),
                    title: Text('App Updates'),
                    subtitle: Text('View new features and bug fixes'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View Updates'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppUpdates()));
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            Card.filled(
                child: ListTile(
                    title: Text(
                        'Notice: Promotions and other changes update from overtime'))),
          ],
        ),
      ),
    );
  }
}

//Notification Order Page
class ProductInfo extends StatelessWidget {
  // Root widget of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product Updates:'),
        ),
        body: ListView.builder(
          itemCount: 5, // Example: 5 list items
          itemBuilder: (context, index) {
            // Example titles (replace with your own titles)
            List<String> titles = [
              'Order Complete',
              'Shipped Out',
              'Pending Payment',
              'Rate your Order',
              'Lost at Sea',
            ];

            // Example descriptions (replace with your own descriptions)
            List<String> descriptions = [
              'Eagle Portland Cement',
              'Goulds Shallow Water Pump',
              'Lucky Blueline PVC U',
              'Lucky Optima PVC Coupling',
              'Eagle Portland Cement',
            ];

            // Example images (replace with your own images)
            List<String> images = [
              'cement.png',
              'fluid.jpeg',
              'goulds.jpeg',
              'PVC.jpeg',
              'cement.png',
            ];

            return CustomListTile(
              title: titles[index % titles.length],
              description: descriptions[index % descriptions.length],
              imageUrl: images[index % images.length],
              onPressed: () {
                // Define actions for each title
                switch (index % titles.length) {
                  case 0: // 'Order Complete'
                    print('View details for Order Complete');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderComplete()));
                    break;
                  case 1: // 'Shipped Out'
                    print('View details for Shipped Out');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShippedOut()));
                    break;
                  case 2: // 'Pending Payment'
                    print('View details for Pending Payment');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PendingPayment()));
                    break;
                  case 3: // 'Rate your Order'
                    print('View details for Rate your Order');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RateOrder()));
                    break;
                  case 4: // 'Lost at Sea'
                    print('View details for Lost at Sea');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LostAtSea()));
                    break;
                  default:
                    print('Unknown title');
                    break;
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback? onPressed;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageUrl),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0),
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      trailing: ElevatedButton(
        onPressed: onPressed,
        child: Text('View Order'),
        style: ElevatedButton.styleFrom(
          foregroundColor: Color.fromRGBO(207, 178, 135, 1),
          backgroundColor: Color.fromRGBO(2, 8, 75, 1),
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Notifcation Recived"),
              content:
                  const Text("Please click the View Order to See Product Info"),
              actions: <Widget>[
                TextButton(
                  child: const Text("Accept"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}

//Offers/Alerts Classes

class Promotions extends StatelessWidget {
  // Root widget of your application
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotions'),
      ),
      body: ListView.builder(
        itemCount: 5, // Example: 5 list items
        itemBuilder: (context, index) {
          // Example titles (replace with your own titles)
          List<String> titles = [
            'UP TO P100 OFF VOUCHER',
            'FOR YOU P50 OFF',
            'LIMITED: UP TO P250 OFF',
            'SHOP NOW DISCOUNT VOUCHER',
            'LOWEST PRICE IN 90 DAYS',
          ];

          // Example descriptions (replace with your own descriptions)
          List<String> descriptions = [
            'Scan to pay with HardWhere',
            'MORE VOUCHERS FOR YOU',
            'LIMITED OFFER DEALS',
            'UP TO 50% OFFERS',
            'EXCLUSIVE SALES',
          ];

          // Example images (replace with your own images)
          List<String> images = [
            'fiftyoff.jpeg',
            'voucher.jpeg',
            'fiftyoff.jpeg',
            'voucher.jpeg',
            'fiftyoff.jpeg',
          ];

          return PromotionTile(
            title: titles[index % titles.length],
            description: descriptions[index % descriptions.length],
            imageUrl: images[index % images.length],
          );
        },
      ),
    );
  }
}

class PromotionTile extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback? onPressed;

  const PromotionTile({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageUrl),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0),
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      trailing: Text('>'),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Redeemed"),
              content: const Text("Voucher Already Claimed"),
              actions: <Widget>[
                TextButton(
                  child: const Text("Accept"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class NotificationEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Image.asset('calendar.png', fit: BoxFit.cover, height: 300),
        NotificationEventsInfo(
          icon: Icons.scale,
          title: '7.7 Tech Sale (July 20 2024 - 7PM)',
          description:
              'Take part in the 7.7 sale with tech products up to 50% off',
        ),
        NotificationEventsInfo(
          icon: Icons.phone,
          title: 'ITEL Piso Deal (August 10 2024 - 7PM)',
          description:
              'Mark your calendars as we have an upcoming event with deals up to P1 ',
        ),
        TextButton(
          child: const Text('Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class NotificationEventsInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const NotificationEventsInfo({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}

class SocialNotification extends StatelessWidget {
  const SocialNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('socials.jpeg', fit: BoxFit.cover, height: 300),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.menu, color: Colors.blue),
                    title: Text('Facebook'),
                    subtitle: Text('Like our Facebook Page'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Like'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.menu, color: Colors.pink),
                    title: Text('Instagram'),
                    subtitle: Text('Follow our Instagram'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Follow'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.menu, color: Colors.black),
                    title: Text('Twitter'),
                    subtitle: Text('Follow us on Twitter'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Follow'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            Card.filled(
                child: ListTile(
                    title: Text(
                        'Follow our Socials and be a part of the HardWhere Family'))),
            TextButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AppUpdates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Text(
          'Version History',
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        VersionInfo(
          title: '3.30.47',
          content: 'Improvements to overall app performance. Minor Bug Fixes',
        ),
        VersionInfo(
          title: '3.29.38',
          content:
              'Image Search Improvements. Improve Flash Sale Promotion Notification',
        ),
        VersionInfo(
          title: '3.29.30',
          content:
              'Optimisation on Product Search. Optimize Battery Consumption',
        ),
        VersionInfo(
          title: '3.29.23',
          content: 'Optimization on Product Search',
        ),
        TextButton(
          child: const Text('Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class VersionInfo extends StatelessWidget {
  final String title;
  final String content;

  const VersionInfo({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(content),
      ),
    );
  }
}
