// ignore_for_file: unused_field, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _birthdayController = TextEditingController();
  DateTime? _selectedDate;
  String _selectedGender = '';
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _passwordFieldController = TextEditingController();
  String _password = '';
  String _passwordError = '';

  @override
  void dispose() {
    _birthdayController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MY PROFILE',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(60, 62, 90, 1),
              image: const DecorationImage(
                image: AssetImage('sampleprofile.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          style: TextStyle(
            color: Color.fromARGB(174, 0, 0, 0),
          ),
          cursorColor: Color.fromRGBO(2, 8, 75, 1),
          decoration: const InputDecoration(
            labelText: 'Username',
            labelStyle: TextStyle(
              color: Color.fromRGBO(60, 62, 90, 1),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(60, 62, 90, 1)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(2, 8, 75, 1)),
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Name
        TextFormField(
          style: TextStyle(
            color: Color.fromARGB(174, 0, 0, 0),
          ),
          cursorColor: Color.fromRGBO(2, 8, 75, 1),
          decoration: const InputDecoration(
            labelText: 'Name',
            labelStyle: TextStyle(
              color: Color.fromRGBO(60, 62, 90, 1),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(60, 62, 90, 1)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(2, 8, 75, 1)),
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Gender Selection
        InkWell(
          onTap: () {
            _showGenderPicker(context);
          },
          child: IgnorePointer(
            child: TextFormField(
              readOnly: true,
              controller: TextEditingController(text: _selectedGender),
              style: TextStyle(
                color: Color.fromARGB(174, 0, 0, 0),
              ),
              cursorColor: Color.fromRGBO(2, 8, 75, 1),
              decoration: const InputDecoration(
                labelText: 'Gender',
                labelStyle: TextStyle(
                  color: Color.fromRGBO(60, 62, 90, 1),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(60, 62, 90, 1)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(2, 8, 75, 1)),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Birthday with DatePicker
        InkWell(
          onTap: () {
            _selectDate(context);
          },
          child: IgnorePointer(
            child: TextFormField(
              controller: _birthdayController,
              style: TextStyle(
                color: Color.fromARGB(174, 0, 0, 0),
              ),
              cursorColor: Color.fromRGBO(2, 8, 75, 1),
              decoration: const InputDecoration(
                labelText: 'Birthday',
                labelStyle: TextStyle(
                  color: Color.fromRGBO(60, 62, 90, 1),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(60, 62, 90, 1)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(2, 8, 75, 1)),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Phone Number
        TextFormField(
          style: TextStyle(
            color: Color.fromARGB(174, 0, 0, 0),
          ),
          cursorColor: Color.fromRGBO(2, 8, 75, 1),
          decoration: const InputDecoration(
            labelText: 'Phone Number',
            labelStyle: TextStyle(
              color: Color.fromRGBO(60, 62, 90, 1),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(60, 62, 90, 1)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(2, 8, 75, 1)),
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Email
        TextFormField(
          style: TextStyle(
            color: Color.fromARGB(174, 0, 0, 0),
          ),
          cursorColor: Color.fromRGBO(2, 8, 75, 1),
          decoration: const InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(
              color: Color.fromRGBO(60, 62, 90, 1),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(60, 62, 90, 1)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(2, 8, 75, 1)),
            ),
          ),
        ),
        const SizedBox(height: 12),

        InkWell(
          onTap: () {
            _showPasswordEditDialog(context);
          },
          child: IgnorePointer(
            child: TextFormField(
              readOnly: true,
              obscureText: true,
              controller: _passwordFieldController,
              style: TextStyle(
                color: Color.fromARGB(174, 0, 0, 0),
              ),
              cursorColor: Color.fromRGBO(2, 8, 75, 1),
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Color.fromRGBO(60, 62, 90, 1),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(60, 62, 90, 1)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(2, 8, 75, 1)),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(2, 8, 75, 1),
            foregroundColor: Color.fromRGBO(207, 178, 135, 1),
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
          child: const Text('Save Changes'),
        )
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color.fromRGBO(2, 8, 75, 1),
            hintColor: const Color.fromARGB(255, 33, 243, 86),
            colorScheme:
                ColorScheme.light(primary: Color.fromRGBO(2, 8, 75, 1)),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _birthdayController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _showGenderPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: const Text(
            'Select Gender',
            style: TextStyle(fontSize: 20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text(
                  'Male',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  setState(() {
                    _selectedGender = 'Male';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Female',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  setState(() {
                    _selectedGender = 'Female';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  'Other',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  setState(() {
                    _selectedGender = 'Other';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPasswordEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String localPasswordError = '';

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: const Text(
                'Edit Password',
                style: TextStyle(fontSize: 20),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'New Password',
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(60, 62, 90, 1)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(2, 8, 75, 1)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(60, 62, 90, 1)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(2, 8, 75, 1)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (localPasswordError.isNotEmpty)
                    Text(
                      localPasswordError,
                      style: const TextStyle(color: Colors.red),
                    ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                      style:
                          const TextStyle(color: Color.fromRGBO(2, 8, 75, 1)),
                      'Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: const Text(
                      style:
                          const TextStyle(color: Color.fromRGBO(2, 8, 75, 1)),
                      'Save'),
                  onPressed: () {
                    if (_passwordController.text ==
                        _confirmPasswordController.text) {
                      setState(() {
                        _password = _passwordController.text;
                        _passwordFieldController.text =
                            _passwordController.text;
                        _passwordError = '';
                      });
                      Navigator.pop(context);
                    } else {
                      setState(() {
                        localPasswordError = 'Passwords do not match';
                      });
                    }
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
