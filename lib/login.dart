// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test_dev/main.dart';
import 'package:test_dev/main2.dart';
import 'package:test_dev/registration.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromRGBO(2, 8, 75, 1),
              height: 400.0,
              child: Center(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset('loading.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage2()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(2, 8, 75, 1),
                      foregroundColor: Color.fromRGBO(207, 178, 135, 1),
                    ),
                    child: Text('Login'),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromRGBO(2, 8, 75, 1),
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Color.fromRGBO(2, 8, 75, 1)),
                    ),
                    icon: Icon(Icons.login),
                    label: Text('Login with Gmail'),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Registration()),
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: Color.fromRGBO(2, 8, 75, 1)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
