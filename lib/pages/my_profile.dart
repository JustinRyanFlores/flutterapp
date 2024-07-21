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
        title: const Text('Edit Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                // Implement save functionality
              },
            ),
          ),
        ],
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
        // Profile Image Container
        Center(
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
              // Example image decoration, you can replace this with your logic
              image: const DecorationImage(
                image: AssetImage('sampleprofile.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Username
        TextFormField(
          style: TextStyle(
            color: Colors.black, // Text color
          ),
          cursorColor: Colors.blue, // Cursor color
          decoration: const InputDecoration(
            labelText: 'Username',
            labelStyle: TextStyle(
              color: Colors.grey, // Label color
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey), // Underline color
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.blue), // Focused underline color
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Name
        TextFormField(
          style: TextStyle(
            color: Colors.black, // Text color
          ),
          cursorColor: Colors.blue, // Cursor color
          decoration: const InputDecoration(
            labelText: 'Name',
            labelStyle: TextStyle(
              color: Colors.grey, // Label color
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey), // Underline color
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.blue), // Focused underline color
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Bio
        TextFormField(
          style: TextStyle(
            color: Colors.black, // Text color
          ),
          cursorColor: Colors.blue, // Cursor color
          maxLines: 3,
          decoration: InputDecoration(
            labelText: 'Bio',
            labelStyle: TextStyle(
              color: Colors.grey, // Label color
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey), // Underline color
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.blue), // Focused underline color
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
                color: Colors.black, // Text color
              ),
              cursorColor: Colors.blue, // Cursor color
              decoration: const InputDecoration(
                labelText: 'Gender',
                labelStyle: TextStyle(
                  color: Colors.grey, // Label color
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blueGrey), // Underline color
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blue), // Focused underline color
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
                color: Colors.black, // Text color
              ),
              cursorColor: Colors.blue, // Cursor color
              decoration: const InputDecoration(
                labelText: 'Birthday',
                labelStyle: TextStyle(
                  color: Colors.grey, // Label color
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blueGrey), // Underline color
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blue), // Focused underline color
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Phone Number
        TextFormField(
          style: TextStyle(
            color: Colors.black, // Text color
          ),
          cursorColor: Colors.blue, // Cursor color
          decoration: const InputDecoration(
            labelText: 'Phone Number',
            labelStyle: TextStyle(
              color: Colors.grey, // Label color
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey), // Underline color
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.blue), // Focused underline color
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Email
        TextFormField(
          style: TextStyle(
            color: Colors.black, // Text color
          ),
          cursorColor: Colors.blue, // Cursor color
          decoration: const InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(
              color: Colors.grey, // Label color
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey), // Underline color
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.blue), // Focused underline color
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Password
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
                color: Colors.black,
              ),
              cursorColor: Colors.blue,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Implement save functionality
          },
          child: const Text('Save Changes'),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      // Customize the theme of the date picker dialog
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            // Change colors here
            primaryColor: Colors.blue, // Headings and buttons
            hintColor:
                const Color.fromARGB(255, 33, 243, 86), // Selection color
            colorScheme: ColorScheme.light(primary: Colors.blue),
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
            borderRadius: BorderRadius.circular(10.0), // Smaller box radius
          ),
          title: const Text(
            'Select Gender',
            style: TextStyle(fontSize: 20), // Larger text size
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text(
                  'Male',
                  style: TextStyle(fontSize: 18), // Larger text size
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
                  style: TextStyle(fontSize: 18), // Larger text size
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
                  style: TextStyle(fontSize: 18), // Larger text size
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
                borderRadius: BorderRadius.circular(10.0), // Smaller box radius
              ),
              title: const Text(
                'Edit Password',
                style: TextStyle(fontSize: 20), // Larger text size
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
                        borderSide: BorderSide(
                            color: Colors.blueGrey), // Underline color
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue), // Focused underline color
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
                        borderSide: BorderSide(
                            color: Colors.blueGrey), // Underline color
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue), // Focused underline color
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
                      style: const TextStyle(color: Colors.red), 'Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: const Text(
                      style: const TextStyle(color: Colors.red), 'Save'),
                  onPressed: () {
                    if (_passwordController.text ==
                        _confirmPasswordController.text) {
                      setState(() {
                        _password = _passwordController.text;
                        _passwordFieldController.text =
                            _passwordController.text;
                        _passwordError = ''; // Clear error message
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
