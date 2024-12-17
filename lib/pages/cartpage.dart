import 'package:flutter/material.dart';
import 'package:shoping_app/widgets/appbarcart.dart';

class cartpage extends StatelessWidget {
  final List? cartItems; // Allow this to be nullable

  const cartpage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    // Ensure cartItems is not null by providing a default empty list
    final items = cartItems ?? [];

    return SafeArea(
      child: Scaffold(
        body: items.isEmpty
            ? const Center(child: Text('Your cart is empty'))
            : ListView(
                children: [
                  const appbarcart(),
                  ...items.map((item) => Card(
                        color: Colors.purple[200],
                        child: ListTile(
                          title: Text(item['title'] ?? 'Unknown Title'),
                          subtitle: Text(item['size'] ?? 'Unknown Title'),
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    item['image'] ?? 'assets/placeholder.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          trailing: Text('Quantity: ${item['quantity'] ?? 0}'),
                        ),
                      )),
                ],
              ),
      ),
    );
  }
}
