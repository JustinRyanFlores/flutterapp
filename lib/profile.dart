import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
