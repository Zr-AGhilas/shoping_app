import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class AppbarWidgets extends StatefulWidget {
  const AppbarWidgets({super.key});

  @override
  State<AppbarWidgets> createState() => _AppbarWidgetsState();
}

class _AppbarWidgetsState extends State<AppbarWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          const Icon(
            Icons.sort,
            color: Color(0xFF4C53A5),
            size: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'ZR Shop',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF4C53A5),
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          badges.Badge(
            badgeContent: const Text('3'),
            child: const Icon(Icons.settings),
            onTap: () {
              // Add your logic here
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Dialog Title'),
                    content: const Text('This is the content of the dialog.'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
