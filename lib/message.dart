// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CHATS',
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
      ),
      body: Column(
        children: [
          SearchBox(
            onChanged: (value) {
              // Handle search logic
            },
          ),
          Expanded(
            child: ListViewBuilderWithSearch(),
          ),
        ],
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchBox({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search, color: Color.fromRGBO(2, 8, 75, 1)),
            contentPadding: EdgeInsets.all(16.0),
          ),
        ),
      ),
    );
  }
}

class ListViewBuilderWithSearch extends StatefulWidget {
  @override
  _ListViewBuilderWithSearchState createState() =>
      _ListViewBuilderWithSearchState();
}

class _ListViewBuilderWithSearchState extends State<ListViewBuilderWithSearch> {
  final List<String> titles = [
    'Robart Construction Supplies',
    'Golden Dream',
    'Starken',
    'Clarence Agena',
    'Leuan Santos',
  ];

  final List<String> descriptions = [
    'sent a message',
    'sent a message',
    'sent a message',
    'sent a message',
    'sent a message',
  ];

  final List<String> images = [
    'robart.png',
    'gdcc.jpeg',
    'starken.jpg',
    'clarence4.jpg',
    'leuan.jpg',
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredTitles = titles
        .where(
            (title) => title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredTitles.length,
      itemBuilder: (context, index) {
        return ChatTile(
          title: filteredTitles[index],
          description: descriptions[titles.indexOf(filteredTitles[index])],
          imageUrl: images[titles.indexOf(filteredTitles[index])],
        );
      },
    );
  }
}

class ChatTile extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const ChatTile({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
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
          onTap: () {
            // Navigate to the detail page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailPage(title: title, description: description),
              ),
            );
          },
        ),
        Divider(), // This adds a divider line
      ],
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String description;

  const DetailPage({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: Color.fromRGBO(207, 178, 135, 1),
          ),
        ),
        backgroundColor: Color.fromRGBO(2, 8, 75, 1),
        actions: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Call Unavailable"),
                    content: const Text("No Internet Connetion"),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.video_call),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Video Call Unavailable"),
                    content: const Text(
                        "Video Calling have been disable by Administrator"),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
        iconTheme: IconThemeData(
          color: Color.fromRGBO(207, 178, 135, 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  ChatMessage(
                      isSent: true,
                      message: "Hi are all your products still available"),
                  ChatMessage(
                      isSent: false,
                      message:
                          "Hello there. Yes all of our products are still available"),
                  ChatMessage(
                      isSent: true,
                      message:
                          "Nice. thanks for answering i will look for products now"),
                  ChatMessage(
                      isSent: false,
                      message: "Thank you for considering our company"),
                  ChatMessage(
                      isSent: false,
                      message:
                          "If you had anymore question feel free to approach us"),
                  ChatMessage(isSent: true, message: "Thanks I will"),
                  // Add more messages here
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Send Failed"),
                          content: const Text("No Internet Connection"),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final bool isSent;
  final String message;

  const ChatMessage({Key? key, required this.isSent, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isSent ? Color.fromRGBO(2, 8, 75, 1) : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message,
          style: TextStyle(
              color: isSent ? Color.fromRGBO(207,178,135, 1) : Colors.black),
        ),
      ),
    );
  }
}

//order view order class
class OrderComplete extends StatelessWidget {
  const OrderComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('OrderComplete.png', fit: BoxFit.cover, height: 130),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.local_shipping, color: Colors.blue),
                    title: Text('Shipping Information'),
                    subtitle:
                        Text('Standard Local - SPX EXPRES = SPADJPAWJD0390248'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View'),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => TOC()));
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.pin_drop, color: Colors.green),
                    title: Text('Delivery Address'),
                    subtitle: Text('Neil Joaquin Bonggo - Calamba, Laguna'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Copy'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Copied"),
                                content: const Text("Delivery Address copied"),
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
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Card.filled(
                child: ListTile(title: Text('Payment Method - Credit Card'))),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.redeem_rounded, color: Colors.blue),
                    title: Text('Eagle Portland Corporation'),
                    subtitle: Text('1x Eagle Portland Cement - P250'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View Product Page'),
                        onPressed: () {
                          Navigator.pop(context);
                        }, //Product Page
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.payments, color: Colors.orange),
                    title: Text('Order Total- P400'),
                    subtitle: Text(
                        'Order Complete - Rating will be availble shortly'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View E-Invoice'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("ORDER ID - 27982476284682"),
                                content: const Text(
                                    "Order Time: 27-06-2024 - 22:51---"
                                    "Payment Time: 29-06-2024 - 12:51 ---"
                                    "Ship Time: 28-06-2024 - 13:51 ---"
                                    "Completed Time: 01-06-2024 - 25:51 ---"),
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
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Card.filled(child: ListTile(title: Text('Thank You for Ordering'))),
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

class ShippedOut extends StatelessWidget {
  const ShippedOut({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('OTW.png', fit: BoxFit.cover, height: 130),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.local_shipping, color: Colors.blue),
                    title: Text('Shipping Information'),
                    subtitle:
                        Text('Standard Local - SPX EXPRES = SPADJPAWJD0390248'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View'),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => TOTW()));
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.pin_drop, color: Colors.green),
                    title: Text('Delivery Address'),
                    subtitle: Text('Jose Leandro Luna - San Jose, Batangas'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Copy'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Copied"),
                                content: const Text("Delivery Address copied"),
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
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Card.filled(
                child:
                    ListTile(title: Text('Payment Method - Cash on Delivery'))),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.redeem_rounded, color: Colors.blue),
                    title: Text('Goulds Water Technology'),
                    subtitle: Text('Goulds Shallow Water Pump - P21,499'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View Product Page'),
                        onPressed: () {
                          Navigator.pop(context);
                        }, //Product Page
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.payments, color: Colors.orange),
                    title: Text('Order Total- P23,000'),
                    subtitle: Text('Please Pay Order upon Delivering'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View E-Invoice'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("ORDER ID - 27982476284682"),
                                content: const Text(
                                    "Order Time: 27-06-2024 - 22:51---"
                                    "Payment Time: 29-06-2024 - 12:51 ---"
                                    "Ship Time: 28-06-2024 - 13:51 ---"
                                    "Completed Time: 01-06-2024 - 25:51 ---"),
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
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Card.filled(child: ListTile(title: Text('Thank You for Ordering'))),
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

class PendingPayment extends StatelessWidget {
  const PendingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('PendingPayment.png', fit: BoxFit.cover, height: 130),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.local_shipping, color: Colors.blue),
                    title: Text('Shipping Information'),
                    subtitle:
                        Text('Standard Local - SPX EXPRES = SPADJPAWJD0390248'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View'),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => TAWP()));
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.pin_drop, color: Colors.green),
                    title: Text('Delivery Address'),
                    subtitle: Text('Jhon Chrisbert Alejaga - Taal, Batangas'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Copy'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Copied"),
                                content: const Text("Delivery Address copied"),
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
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Card.outlined(
                child:
                    ListTile(title: Text('Payment Method - GCash - FAILED'))),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.redeem_rounded, color: Colors.blue),
                    title: Text('Robart Construction Supplies'),
                    subtitle: Text('2x Lucky Blueline PVC - P202'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View Product Page'),
                        onPressed: () {
                          Navigator.pop(context);
                        }, //Product Page
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.payments, color: Colors.orange),
                    title: Text('Order Total- P300'),
                    subtitle: Text('Awating Payment Method'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View E-Invoice'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("ORDER ID - 27982476284682"),
                                content: const Text(
                                    "Order Time: 27-06-2024 - 22:51---"
                                    "Payment Time: 29-06-2024 - 12:51 ---"
                                    "Ship Time: Standby on Logistic Area"
                                    "Completed Time: Order Not Delivered Yet"),
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
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Card.filled(child: ListTile(title: Text('Thank You for Ordering'))),
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

class RateOrder extends StatelessWidget {
  const RateOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('OrderComplete.png', fit: BoxFit.cover, height: 130),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.local_shipping, color: Colors.blue),
                    title: Text('Shipping Information'),
                    subtitle:
                        Text('Standard Local - SPX EXPRES = SPADJPAWJD0390248'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TRateOrder()));
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.pin_drop, color: Colors.green),
                    title: Text('Delivery Address'),
                    subtitle: Text('Marc Lei - Bauan, Batangas'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Copy'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Copied"),
                                content: const Text("Delivery Address copied"),
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
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Card.filled(
                child: ListTile(title: Text('Payment Method - Debit Card'))),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.redeem_rounded, color: Colors.blue),
                    title: Text('Robart Construction Supplies'),
                    subtitle: Text('20x - Lucky Optimat PVC - P400'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View Product Page'),
                        onPressed: () {
                          Navigator.pop(context);
                        }, //Product Page
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.payments, color: Colors.orange),
                    title: Text('Order Total- P450'),
                    subtitle: Text(
                        'Order Complete. You can rate your order at the product page'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View E-Invoice'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("ORDER ID - 27982476284682"),
                                content: const Text(
                                    "Order Time: 27-06-2024 - 22:51---"
                                    "Payment Time: 29-06-2024 - 12:51 ---"
                                    "Ship Time: 28-06-2024 - 13:51 ---"
                                    "Completed Time: 01-06-2024 - 25:51 ---"),
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
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Card.filled(child: ListTile(title: Text('Thank You for Ordering'))),
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

class LostAtSea extends StatelessWidget {
  const LostAtSea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('LostAtSea.png', fit: BoxFit.cover, height: 130),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.local_shipping, color: Colors.blue),
                    title: Text('Shipping Information'),
                    subtitle:
                        Text('Local Plane - PAL Express = SPADJPAWJD0390248'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View'),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => TLost()));
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.pin_drop, color: Colors.green),
                    title: Text('Delivery Address'),
                    subtitle: Text('Leuan Santos - Mindoro'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('Copy'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Copied"),
                                content: const Text("Delivery Address copied"),
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
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Card.filled(
                child: ListTile(title: Text('Payment Method - Pay Maya'))),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.redeem_rounded, color: Colors.blue),
                    title: Text('Eagle Portland Corporation'),
                    subtitle: Text('3x Eagle Portland Cement - P750'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View Product Page'),
                        onPressed: () {
                          Navigator.pop(context);
                        }, //Product Page
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.payments, color: Colors.orange),
                    title: Text('Order Total- P800'),
                    subtitle: Text('Order Lost in the West Philippine Sea'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('View E-Invoice'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("ORDER ID - 27982476284682"),
                                content: const Text(
                                    "Order Time: 27-06-2024 - 22:51---"
                                    "Payment Time: 29-06-2024 - 12:51 ---"
                                    "Ship Time: 28-06-2024 - 13:51 ---"
                                    "Completed Time: Failed"),
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
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Card.filled(child: ListTile(title: Text('Thank You for Ordering'))),
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

class TOC extends StatelessWidget {
  const TOC({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('TOrderComp.png', fit: BoxFit.cover, height: 500),
            const SizedBox(height: 10),
            Card.filled(
                child: ListTile(
                    title: Text(
                        'Order Process are always tracked. Delays may occur'))),
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

class TOTW extends StatelessWidget {
  const TOTW({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('TOTW.png', fit: BoxFit.cover, height: 500),
            const SizedBox(height: 10),
            Card.filled(
                child: ListTile(
                    title: Text(
                        'Order Process are always tracked. Delays may occur'))),
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

class TAWP extends StatelessWidget {
  const TAWP({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('TAWP.png', fit: BoxFit.cover, height: 500),
            const SizedBox(height: 10),
            Card.filled(
                child: ListTile(
                    title: Text(
                        'Order Process are always tracked. Delays may occur'))),
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

class TRateOrder extends StatelessWidget {
  const TRateOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('TRateOrder.png', fit: BoxFit.cover, height: 500),
            const SizedBox(height: 10),
            Card.filled(
                child: ListTile(
                    title: Text(
                        'Order Process are always tracked. Delays may occur'))),
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

class TLost extends StatelessWidget {
  const TLost({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('TLost.png', fit: BoxFit.cover, height: 500),
            const SizedBox(height: 10),
            Card.filled(
                child: ListTile(
                    title: Text(
                        'Order Process are always tracked. Delays may occur'))),
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
