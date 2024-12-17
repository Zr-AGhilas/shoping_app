import 'package:flutter/material.dart';
import 'package:shoping_app/pages/homepage.dart';

class appbarcart extends StatelessWidget {
  const appbarcart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const homepage(),
                    ));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF4C53A5),
                size: 30,
              )),
          const Text(
            'Cart',
            style: TextStyle(fontSize: 23, color: Color(0xFF4C53A5)),
          ),
          PopupMenuButton(
            iconSize: 25,
            iconColor: const Color(0xFF4C53A5),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text('Optoin 1')),
                const PopupMenuItem(child: Text('Optoin 2')),
                const PopupMenuItem(child: Text('Optoin 3')),
              ];
            },
          )
        ],
      ),
    );
  }
}
