import 'package:flutter/material.dart';
import 'package:shoping_app/widgets/Appbarwigtes.dart';
import 'package:shoping_app/widgets/CategoriesItems.dart';
import 'package:shoping_app/widgets/Itemsdetails.dart';

class HomeContentPage extends StatelessWidget {
  const HomeContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Your widgets go here
        const AppbarWidgets(),
        Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(34),
              topRight: Radius.circular(34),
            ),
          ),
          child: const Column(
            children: [
              CategoriesItems(),
              Itemsdetails(),
            ],
          ),
        ),
      ],
    );
  }
}
