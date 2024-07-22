import 'package:flutter/material.dart';
import 'package:test_dev/pages/check_out.dart';

void main() {
  runApp(const MaterialApp(
    home: Cart(),
  ));
}

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  // List of cart items
  final List<CartItemData> cartItems = [
    CartItemData(
      storeName: '',
      productName: 'HUU Trim Rib',
      productPrice: '₱ 251',
      productImage: 'ceilingtype.jpg',
      variations: ['Corrugated', 'Rib Type', 'Trim Rib'],
      variationImages: ['corrugated.png', 'ribtype.png', 'ceilingtype.jpg'],
      selectedVariation: 'Trim Rib',
    ),
    CartItemData(
      storeName: 'HUU',
      productName: 'HUU Corrugated',
      productPrice: '₱1,398',
      productImage: 'corrugated.png',
      variations: ['Corrugated', 'Rib Type', 'Trim Rib'],
      variationImages: ['corrugated.png', 'ribtype.png', 'ceilingtype.jpg'],
      selectedVariation: 'Corrugated',
    ),
    CartItemData(
      storeName: 'Carpasteel',
      productName: 'Carpasteel Ribtype',
      productPrice: '₱1,998',
      productImage: 'ribtype.png',
      variations: ['Corrugated', 'Rib Type', 'Trim Rib'],
      variationImages: ['corrugated.png', 'ribtype.png', 'ceilingtype.jpg'],
      selectedVariation: '50ml bottle',
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
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: cartItems.isEmpty
          ? const Center(
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
                                padding: const EdgeInsets.all(33.0),
                                color: Colors.orange,
                                child: const ListTile(
                                  leading: Icon(Icons.find_in_page,
                                      color: Colors.white),
                                ),
                              ),
                              secondaryBackground: Container(
                                padding: const EdgeInsets.all(33.0),
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
                                  onVariationSelected: (String? value) {
                                    setState(() {
                                      item.selectedVariation = value!;
                                    });
                                  },
                                  onEdit: () {
                                    _showEditModal(context, item,
                                        (updatedItem) {
                                      setState(() {
                                        // Find the index of updatedItem in cartItems and update it
                                        int index = cartItems.indexOf(item);
                                        if (index != -1) {
                                          cartItems[index] = updatedItem;
                                        }
                                      });
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
                    activeColor: const Color.fromARGB(
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
              const Text(
                'Total: ',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '₱${calculateTotal()}',
                style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(
                        255, 105, 83, 42)), // Total price in specific color
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to checkout page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutPage()),
                  );
                },
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
          title: Text(
            'Remove ${item.productName}?',
            style: TextStyle(
              color: Colors.black, // Title text color
              fontSize: 18.0, // Title font size
              fontWeight: FontWeight.bold, // Title font weight
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Do you want to remove this product from your cart?',
                  style: TextStyle(
                    color: Colors.grey[800], // Content text color
                    fontSize: 16.0, // Content font size
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.redAccent, // Cancel button text color
                  fontSize: 16.0, // Cancel button font size
                ),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text(
                'Remove',
                style: TextStyle(
                  color: Colors.redAccent, // Remove button text color
                  fontSize: 16.0, // Remove button font size
                ),
              ),
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

  // Show a modal bottom sheet to edit item details
  void _showEditModal(BuildContext context, CartItemData item,
      Function(CartItemData) updateCartItem) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.productName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text('Select Variation:', style: TextStyle(fontSize: 16.0)),
                  SizedBox(height: 8.0),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: item.variations.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            width: 200, // Adjust as needed
                                            height: 200, // Adjust as needed
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(item
                                                    .variationImages[index]),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          item.variationImages[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.0),
                              ChoiceChip(
                                label: Text(
                                  item.variations[index],
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 105, 83, 42),
                                  ),
                                ),
                                selected: item.selectedVariation ==
                                    item.variations[index],
                                onSelected: (bool selected) {
                                  setState(() {
                                    item.selectedVariation =
                                        item.variations[index];
                                    item.productImage =
                                        item.variationImages[index];
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text('Quantity', style: TextStyle(fontSize: 16.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (item.quantity > 1) {
                              item.quantity--;
                            }
                          });
                        },
                      ),
                      Text(item.quantity.toString(),
                          style: TextStyle(fontSize: 18.0)),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            item.quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        updateCartItem(item); // Update item in main cart list
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 19, 13, 0),
                      ),
                      child: Text('Confirm', style: TextStyle(fontSize: 16.0)),
                    ),
                  ),
                ],
              ),
            );
          },
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
  String productImage;
  final List<String> variations;
  final List<String> variationImages;
  String selectedVariation;
  bool isChecked;
  int quantity;

  CartItemData({
    required this.storeName,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.variations,
    required this.variationImages,
    required this.selectedVariation,
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
  final ValueChanged<String?> onVariationSelected;
  final VoidCallback onEdit;

  const CartItem({
    required this.item,
    required this.isChecked,
    required this.onChanged,
    required this.onIncrement,
    required this.onDecrement,
    required this.onVariationSelected,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
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
                      fontSize: 14, color: Color.fromARGB(255, 105, 83, 42)),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: onEdit, // Call onEdit callback on tap
                  child: Row(
                    children: [
                      Text(
                        item.selectedVariation,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 105, 83, 42),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Color.fromARGB(255, 105, 83, 42),
                      ),
                    ],
                  ),
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
            value: isChecked,
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

// Checkout page widget
class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Checkout(),
      ),
    );
  }
}
