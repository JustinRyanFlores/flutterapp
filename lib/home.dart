import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:test_dev/message.dart';
import 'pages/cart.dart';
import 'pages/item_details.dart';
import 'pages/search_page.dart';




void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

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
  void initState() {
    super.initState();
    _autoSwipe();
  }

  void _autoSwipe() {
    Future.delayed(Duration(seconds: 20), () {
      if (_pageController.hasClients) {
        int nextPage = (_currentPage + 1) % 3;
        _pageController
            .animateToPage(
          nextPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        )
            .then((_) {
          if (mounted) {
            setState(() {
              _currentPage = nextPage;
            });
            _autoSwipe();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchPage()),
                        ),
                      ),
                      const SizedBox(width: 10.0),
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
                        onPressed: () => {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 5.0),
            ],
          ),
          actions: [
            IconButton(
              icon:
                  const Icon(Icons.shopping_cart_outlined, color: Color.fromRGBO(207, 178, 135, 1)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chat_outlined, color: Color.fromRGBO(207, 178, 135, 1)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Message()),
              ),
            ),
          ],
          backgroundColor: Color.fromRGBO(2, 8, 75, 1),
          
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    child: PageView.builder(
                      itemCount: 3,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Image.asset(
                          'ad$index.png',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 16.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return AnimatedContainer(
                          duration: Duration(seconds: 5),
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          height: 8.0,
                          width: _currentPage == index ? 12.0 : 8.0,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.grey
                                : Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Roofing Materials',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap:
                      true, // Ensures the ListView takes only the required height
                  physics: AlwaysScrollableScrollPhysics(), // Enable scrolling
                  children: const [
                    ItemCard(
                      imagePath: 'trimrib.png',
                      title: 'HUU Trim Rib',
                      price: '251.00 PHP',
                    ),
                    ItemCard(
                      imagePath: 'corrugated.png',
                      title: 'HUU Corrugated',
                      price: '334.00 PHP',
                    ),
                    ItemCard(
                      imagePath: 'ribtype.png',
                      title: 'Seymour Ribtype',
                      price: '1,533.00 PHP',
                    ),
                    ItemCard(
                      imagePath: 'ceilingtype.jpg',
                      title: 'PVC Ceiling Panel',
                      price: '390.00 PHP',
                    ),
                    ItemCard(
                      imagePath: 'longspan.jpg',
                      title: 'Longspan Ribtype',
                      price: '560.00 PHP',
                    ),
                    // Add more ItemCard widgets as needed
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hardware',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap:
                      true, // Ensures the ListView takes only the required height
                  physics: AlwaysScrollableScrollPhysics(), // Enable scrolling
                  children: const [
                    ItemCard(
                      imagePath: 'wrench.png',
                      title: 'Lotus Wrench Cp 8',
                      price: '398.00 PHP',
                    ),
                    ItemCard(
                      imagePath: 'drill.png',
                      title: 'KCT Hammer Drill',
                      price: '3,999.00 PHP',
                    ),
                    ItemCard(
                      imagePath: 'hammer.png',
                      title: 'Pein Hammer 16oz',
                      price: '308.00 PHP',
                    ),
                    ItemCard(
                      imagePath: 'chopsaw.png',
                      title: 'Chopesaw 2 4KW',
                      price: '10,994.00 PHP',
                    ),
                    ItemCard(
                      imagePath: 'screw.jpg',
                      title: 'Gypsum Screw 1 in',
                      price: '0.45 PHP',
                    ),
                    // Add more ItemCard widgets as needed
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverStaggeredGrid.countBuilder(
              crossAxisCount: 2,
              itemCount: staggeredItems.length,
              itemBuilder: (BuildContext context, int index) {
                final item = staggeredItems[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetails(
                          imagePath: item['imagePath']!,
                          title: item['title']!,
                          price: item['price']!,
                        ),
                      ),
                    );
                  },
                  child: StaggeredItemCard(
                    imagePath: item['imagePath']!,
                    title: item['title']!,
                    price: item['price']!,
                  ),
                );
              },
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.extent(1, 250), // Adjust height as needed
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaleContainer(String imagePath) {
    return Container(
      color: const Color.fromARGB(255, 105, 42, 42),
      child: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;

  const ItemCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetails(
              title: title,
              imagePath: imagePath,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                price,
                style: const TextStyle(
                  color: Color.fromARGB(255, 155, 151, 151),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StaggeredItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;

  const StaggeredItemCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetails(
              title: title,
              imagePath: imagePath,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                price,
                style: const TextStyle(
                  color: Color.fromARGB(255, 155, 151, 151),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
