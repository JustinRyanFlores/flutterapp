import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  // List of cart items
  final List<CartItemData> cartItems = [
    CartItemData(
      storeName: 'HUU',
      productName: 'HUU Trim Rib',
      productPrice: '₱ 251',
      productImage: 'ceilingtype.jpg',
    ),
    CartItemData(
      storeName: 'HUU',
      productName: 'HUU Corrugated',
      productPrice: '₱1,398',
      productImage: 'corrugated.png',
      addOnDeals: [''],
    ),
    CartItemData(
      storeName: 'Carpasteel',
      productName: 'Carpasteel Ribtype',
      productPrice: '₱1,998',
      productImage: 'ribtype.png',
      addOnDeals: [''],
    ),
  ];

  // Variable to manage select all checkbox state
  bool selectAll = false;

  @override
  Widget build(BuildContext context) {
    // Group cart items by store name
    Map<String, List<CartItemData>> groupedItems = {};
    for (var item in cartItems) {
      if (!groupedItems.containsKey(item.storeName)) {
        groupedItems[item.storeName] = [];
      }
      groupedItems[item.storeName]!.add(item);
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title:
            const Text('Shopping Cart', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 19, 13, 0),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(fontSize: 18),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  // Display grouped items by store
                  ...groupedItems.entries.map((entry) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            entry.key,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Display each cart item
                        ...entry.value.map((item) => Dismissible(
                              key: Key(item.productName),
                              background: Container(
                                color: Colors.orange,
                                child: const ListTile(
                                  leading: Icon(Icons.find_in_page,
                                      color: Colors.white),
                                  trailing: Icon(Icons.more_vert,
                                      color: Colors.white),
                                ),
                              ),
                              secondaryBackground: Container(
                                color: Colors.red,
                                child: const ListTile(
                                  trailing:
                                      Icon(Icons.delete, color: Colors.white),
                                ),
                              ),
                              confirmDismiss: (direction) async {
                                if (direction == DismissDirection.endToStart) {
                                  // Handle delete item
                                  return true;
                                }
                                return null;
                              },
                              onDismissed: (direction) {
                                if (direction == DismissDirection.endToStart) {
                                  // Delete item from cart
                                  setState(() {
                                    cartItems.remove(item);
                                  });
                                }
                              },
                              child: Container(
                                color: Colors.grey[200],
                                child: CartItem(
                                  item: item,
                                  isChecked: item.isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      item.isChecked = value ?? false;
                                    });
                                  },
                                  onIncrement: () {
                                    setState(() {
                                      item.quantity++;
                                    });
                                  },
                                  onDecrement: () {
                                    setState(() {
                                      if (item.quantity > 1) {
                                        item.quantity--;
                                      } else {
                                        _showRemoveConfirmationDialog(item);
                                      }
                                    });
                                  },
                                ),
                              ),
                            )),
                      ],
                    );
                  }),
                ],
              ),
            ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: selectAll,
                    activeColor: Color.fromARGB(
                        255, 105, 83, 42), // Color when checkbox is checked
                    checkColor: Colors.white, // Color of the check icon
                    onChanged: (bool? value) {
                      setState(() {
                        selectAll = value ?? false;
                        // Update all items' checked state
                        for (var item in cartItems) {
                          item.isChecked = selectAll;
                        }
                      });
                    },
                  ),
                  const Text('All'),
                ],
              ),
              Text(
                'Total: ',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                '₱${calculateTotal()}',
                style: const TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(
                        255, 105, 83, 42)), // Total price in specific color
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 19, 13, 0),
                ),
                child: Text('Check Out (${getCheckedItemCount()})'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Calculate the total price of checked items
  double calculateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      if (item.isChecked) {
        total += item.quantity *
            double.parse(
                item.productPrice.replaceAll('₱', '').replaceAll(',', ''));
      }
    }
    return total;
  }

  // Get the count of checked items
  int getCheckedItemCount() {
    int count = 0;
    for (var item in cartItems) {
      if (item.isChecked) {
        count++;
      }
    }
    return count;
  }

  // Show a confirmation dialog before removing an item
  Future<void> _showRemoveConfirmationDialog(CartItemData item) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Remove ${item.productName}?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to remove this product from your cart?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 19, 13, 0),
                  )),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Remove',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 19, 13, 0),
                  )),
              onPressed: () {
                setState(() {
                  cartItems.remove(item); // Remove the item from the cart
                });
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
  }
}

// Data model for a cart item
class CartItemData {
  final String storeName;
  final String productName;
  final String productPrice;
  final String productImage;
  final String? voucher;
  final String? shipping;
  final List<String>? addOnDeals;
  bool isChecked;
  int quantity;

  CartItemData({
    required this.storeName,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    this.voucher,
    this.shipping,
    this.addOnDeals,
    this.isChecked = false,
    this.quantity = 1,
  });
}

// Widget to display individual cart item details
class CartItem extends StatelessWidget {
  final CartItemData item;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItem({
    required this.item,
    required this.isChecked,
    required this.onChanged,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              item.productImage,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(
                  item.productPrice,
                  style: const TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 105, 83, 42)),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: onDecrement,
                    ),
                    Text(item.quantity.toString()),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: onIncrement,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Checkbox(
            value: item.isChecked,
            onChanged: onChanged,
            activeColor: Color.fromARGB(
                255, 105, 83, 42), // Color when checkbox is checked
            checkColor: Colors.white, // Color of the check icon
          ),
        ],
      ),
    );
  }
}
