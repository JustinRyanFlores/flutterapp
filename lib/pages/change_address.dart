import 'package:flutter/material.dart';

class ChangeAddress extends StatefulWidget {
  const ChangeAddress({super.key});

  @override
  _ChangeAddressState createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  String? _selectedAddress;

  void _selectAddress(String address) {
    setState(() {
      _selectedAddress = address;
    });
    // Handle address selection if needed (e.g., navigate back or update state)
    Navigator.pop(context, _selectedAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADDRESS SELECTION',
         style: TextStyle(color:Color.fromRGBO(207,178,135, 1),fontSize: 18,fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Color.fromRGBO(207,178,135, 1) ),
        backgroundColor:Color.fromRGBO(2, 8, 75, 1),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select a new delivery address:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 20.0),
              AddressCard(
                title: '123 Mabini Street, Batangas City',
                description: 'Near Batangas City Sports Complex, Batangas',
                isSelected:
                    _selectedAddress == '123 Mabini Street, Batangas City',
                onTap: () {
                  _selectAddress('Address 1');
                },
              ),
              SizedBox(height: 10.0),
              AddressCard(
                title: '456 Rizal Avenue, Batangas City',
                description: 'Close to Batangas City Hall, Batangas',
                isSelected:
                    _selectedAddress == '456 Rizal Avenue, Batangas City',
                onTap: () {
                  _selectAddress('Address 2');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const AddressCard({
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          leading: CircleCheckbox(
            isSelected: isSelected,
          ),
          title: Text(title),
          subtitle: Text(description),
        ),
      ),
    );
  }
}

class CircleCheckbox extends StatelessWidget {
  final bool isSelected;

  const CircleCheckbox({
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Color.fromARGB(255, 80, 51, 7) : Colors.transparent,
        border: Border.all(
          color: Color.fromRGBO(2, 8, 75, 1),
          width: 2.0,
        ),
      ),
      child: isSelected
          ? Icon(
              Icons.check,
              color: Colors.white,
              size: 16.0,
            )
          : null,
    );
  }
}
