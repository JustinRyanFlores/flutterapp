// ignore_for_file: file_names, use_key_in_widget_constructors, use_super_parameters
import 'package:flutter/material.dart';
import 'tab1.dart';

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
            label: "Wishlist",
            icon: Icon(Icons.favorite_outline, color: Colors.black),
          ),
          BottomNavigationBarItem(
            label: "Categories",
            icon: Icon(Icons.grid_view, color: Colors.black),
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
        TabBarDemo(),
        WishlistTab(),
        CategoryTab(),
        NotificationTab(),
        ProfileTab(), 
      ],
    );
  }
}

//Home Tab
class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10.0), 
                    color: Colors.white, 
                  ),
                  child: Row(
                    
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 10.0), 
                        child: Icon(Icons.search),
                      ),
                      const SizedBox(
                          width:
                              10.0), 
                      const Expanded(
                        child: TextField(
                          
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none, 
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.camera_alt_outlined),
                        onPressed: () =>
                            {}, 
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                  width: 5.0), 
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              onPressed: () => {}, 
            ),
            IconButton(
              icon: const Icon(
                Icons.chat_outlined,
                color: Colors.white, 
              ),
              onPressed: () => {}, 
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 221, 183, 13),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.home, color: Colors.black, size: 100),
            Icon(Icons.list, size: 100),
            Icon(Icons.message, size: 100),
          ],
        ),
      ),
    );
  }
}

//Wishlist Tab
class WishlistTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),

         body: const Center(
          child: Tab1(),
        ),
    );
  }
}

//Categories Tab
class CategoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
    );
  }
}

//Notification Tab
class NotificationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
    );
  }
}

//Profile Tab
class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true, 
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 221, 183, 13),
          
          title: Row(
            children: [
              
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 20.0), 
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
                            Icons.storefront_outlined,
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
              padding: const EdgeInsets.only(bottom: 70.0), 
              child: IconButton(
                icon: const Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                ),
                onPressed: () => {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70.0), 
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
                onPressed: () => {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70.0, right: 5.0), 
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
      ),
    );
  }
}
