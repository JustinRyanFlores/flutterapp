import 'package:flutter/material.dart';
import 'package:test_dev/main.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SETTINGS',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(2, 8, 75, 1),
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.security, color: Color.fromRGBO(2, 8, 75, 1)),
              title: Text('Account and Security'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.home, color: Color.fromRGBO(2, 8, 75, 1)),
              title: Text('My Addresses'),
              onTap: () {},
            ),
            ListTile(
              leading:
                  Icon(Icons.credit_card, color: Color.fromRGBO(2, 8, 75, 1)),
              title: Text('Bank Accounts/Cards'),
              onTap: () {},
            ),
            SizedBox(height: 16),
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(2, 8, 75, 1),
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.chat, color: Color.fromRGBO(2, 8, 75, 1)),
              title: Text('Chat Settings'),
              onTap: () {},
            ),
            ListTile(
              leading:
                  Icon(Icons.notifications, color: Color.fromRGBO(2, 8, 75, 1)),
              title: Text('Notification Settings'),
              onTap: () {},
            ),
            ListTile(
              leading:
                  Icon(Icons.privacy_tip, color: Color.fromRGBO(2, 8, 75, 1)),
              title: Text('Privacy Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.language, color: Color.fromRGBO(2, 8, 75, 1)),
              title: Text('Language'),
              onTap: () {},
            ),
            SizedBox(height: 16),
            Text(
              'Support',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(2, 8, 75, 1),
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.help, color: Color.fromRGBO(2, 8, 75, 1)),
              title: Text('Help Center'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.policy, color: Color.fromRGBO(2, 8, 75, 1)),
              title: Text('Hardware Policies'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info, color: Color.fromRGBO(2, 8, 75, 1)),
              title: Text('About'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Color.fromRGBO(2, 8, 75, 1)),
              title: Text('Account Deletion'),
              onTap: () {},
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(2, 8, 75, 1),
                  foregroundColor: Color.fromRGBO(207, 178, 135, 1)),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
