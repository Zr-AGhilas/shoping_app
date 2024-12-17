import 'package:flutter/material.dart';
import 'package:shoping_app/pages/cartpage.dart';

class itemnavigatoinbar extends StatelessWidget {
  final data;
  final VoidCallback onaddtocart;
  final List cartitemslist;

  const itemnavigatoinbar({
    super.key,
    required this.data,
    required this.onaddtocart,
    required this.cartitemslist,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // Your existing UI code here...
      padding: const EdgeInsets.all(0),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                '$data',
                style: const TextStyle(
                    fontSize: 25,
                    color: Color(0xFF4C53A5),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: ElevatedButton.icon(
                onPressed: () {
                  onaddtocart();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => cartpage(
                        cartItems: cartitemslist,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart_checkout_sharp),
                label: const Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
