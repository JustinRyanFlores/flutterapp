import 'package:flutter/material.dart';
import 'package:test_dev/pages/check_out.dart';
import 'package:test_dev/pages/store_page.dart';

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
      variations: ['Corrugated', 'Rib Type', 'Trim Rib'],
      variationImages: ['corrugated.png', 'ribtype.png', 'ceilingtype.jpg'],
      variationNames: ['HUU Corrugated', 'HUU Rib Type', 'HUU Trim Rib'],
      variationPrices: ['₱1,398', '₱1,998', '₱ 251'],
      selectedVariation: 'Trim Rib',
    ),
    CartItemData(
      storeName: 'HUU',
      productName: 'HUU Corrugated',
      productPrice: '₱1,398',
      productImage: 'corrugated.png',
      variations: ['Corrugated', 'Rib Type', 'Trim Rib'],
      variationImages: ['corrugated.png', 'ribtype.png', 'ceilingtype.jpg'],
      variationNames: ['HUU Corrugated', 'HUU Rib Type', 'HUU Trim Rib'],
      variationPrices: ['₱1,398', '₱1,998', '₱ 251'],
      selectedVariation: 'Corrugated',
    ),
    CartItemData(
      storeName: 'Carpasteel',
      productName: 'Carpasteel Ribtype',
      productPrice: '₱1,998',
      productImage: 'ribtype.png',
      variations: ['Corrugated', 'Rib Type', 'Trim Rib'],
      variationImages: ['corrugated.png', 'ribtype.png', 'ceilingtype.jpg'],
      variationNames: [
        'Carpasteel Corrugated',
        'Carpasteel Rib Type',
        'Carpasteel Trim Rib'
      ],
      variationPrices: ['₱1,398', '₱1,998', '₱ 251'],
      selectedVariation: 'Rib Type',
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
            const Text('Shopping Cart', style: TextStyle(color:Color.fromRGBO(207,178,135, 1))),
        backgroundColor: Color.fromRGBO(2, 8, 75, 1),
         iconTheme: const IconThemeData(color: Color.fromRGBO(207,178,135, 1)),
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ShopScreen(storeName: entry.key),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  entry.key,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.chevron_right,
                                    size: 16, color: Colors.grey),
                              ],
                            ),
                          ),
                        ),
                        // Display each cart item
                        ...entry.value.map((item) => Dismissible(
                              key: Key(item.productName),
                              background: Container(
                                padding: const EdgeInsets.all(55.0),
                                color: Colors.orange,
                                child: const ListTile(
                                  leading: Icon(Icons.find_in_page,
                                      color: Colors.white),
                                ),
                              ),
                              secondaryBackground: Container(
                                padding: const EdgeInsets.all(55.0),
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
                  if (getCheckedItemCount() == 0) {
                    _showNoItemsSelectedDialog();
                  } else {
                    // Navigate to checkout page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckoutPage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromRGBO(2, 8, 75, 1),
                ),
                child: Text('Check Out (${getCheckedItemCount()})'),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Show a dialog when no items are selected for checkout
  Future<void> _showNoItemsSelectedDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button to close dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text(
            'No Items Selected',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text(
                  'You have not selected any items for checkout.',
                  style: TextStyle(
                    color: Color.fromARGB(255, 73, 70, 70),
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(color: Color.fromARGB(255, 105, 83, 42)),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
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
            style: const TextStyle(
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
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: const Text(
                'Remove',
                style: TextStyle(
                  color: Colors.red, // Remove button text color
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

// Show a modal bottom sheet to edit the cart item
  void _showEditModal(BuildContext context, CartItemData item,
      Function(CartItemData) onUpdate) {
    String selectedVariation = item.selectedVariation;
    int selectedIndex = item.variations.indexOf(selectedVariation);

    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    item.productName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text('Select Variation:',
                      style: TextStyle(fontSize: 16.0)),
                  const SizedBox(height: 8.0),
                  SizedBox(
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
                                            width: 290,
                                            height: 290,
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
                                    image: DecorationImage(
                                      image: AssetImage(
                                          item.variationImages[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              ChoiceChip(
                                label: Text(
                                  item.variations[index],
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 105, 83, 42),
                                  ),
                                ),
                                selected:
                                    selectedVariation == item.variations[index],
                                onSelected: (bool selected) {
                                  setState(() {
                                    selectedVariation = item.variations[index];
                                    selectedIndex = index;

                                    // Update item with selected variation details
                                    item.productName =
                                        item.variationNames[selectedIndex];
                                    item.productPrice =
                                        item.variationPrices[selectedIndex];
                                    item.productImage =
                                        item.variationImages[selectedIndex];
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(
                                    color: Color.fromARGB(255, 105, 83, 42),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text('Price: ${item.variationPrices[selectedIndex]}',
                      style: TextStyle(fontSize: 16.0)),
                  const SizedBox(height: 20.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          item.selectedVariation = selectedVariation;
                          item.isChecked = true; // Check the checkbox
                        });
                        onUpdate(item);
                        Navigator.of(context).pop(); // Close the modal
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color.fromRGBO(2, 8, 75, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Text('Confirm',
                          style: TextStyle(fontSize: 16.0)),
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

class CartItem extends StatelessWidget {
  final CartItemData item;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final ValueChanged<String?> onVariationSelected;
  final VoidCallback onEdit;

  const CartItem({
    Key? key,
    required this.item,
    required this.isChecked,
    required this.onChanged,
    required this.onIncrement,
    required this.onDecrement,
    required this.onVariationSelected,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Product details and controls
            Expanded(
              child: Row(
                children: <Widget>[
                  // Product image
                  Image.asset(
                    '${item.productImage}',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8),
                  // Product details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(item.productName,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(item.productPrice,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 105, 83, 42))),
                        const SizedBox(height: 8),
                        // Place the TextButton below the product price
                        TextButton(
                          onPressed: onEdit,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                item.productName,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 105, 83, 42),
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Color.fromARGB(255, 105, 83, 42),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Quantity controls
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: onDecrement,
                            ),
                            Text('${item.quantity}'),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                onIncrement();
                                // Automatically check the checkbox when quantity is incremented
                                onChanged(true);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Checkbox on the right side
            Checkbox(
              value: isChecked,
              activeColor: Color.fromARGB(
                  255, 105, 83, 42), // Color when checkbox is checked
              checkColor: Colors.white, // Color of the check icon
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}

// Cart item data model
class CartItemData {
  final String storeName;
  String productName;
  String productPrice;
  String productImage;
  final List<String> variations;
  final List<String> variationImages;
  final List<String> variationNames;
  final List<String> variationPrices;
  String selectedVariation;
  int quantity;
  bool isChecked;

  CartItemData({
    required this.storeName,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.variations,
    required this.variationImages,
    required this.variationNames,
    required this.variationPrices,
    required this.selectedVariation,
    this.quantity = 1,
    this.isChecked = false,
  });
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

// Dummy StorePage class for demonstration purposes
class StorePage extends StatelessWidget {
  const StorePage({super.key, required String storeName});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Store(
          storeName: '',
        ),
      ),
    );
  }
}
