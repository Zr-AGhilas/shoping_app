import 'package:flutter/material.dart';

List CategoriesItem = [
  {'images': 'images/1.png', 'title': 'Sundal'},
  {'images': 'images/2.png', 'title': 'Watch'},
  {'images': 'images/3.png', 'title': 'Pc bag'},
  {'images': 'images/4.png', 'title': 'Shoping Bag'},
  {'images': 'images/5.png', 'title': 'women bag'},
  {'images': 'images/6.png', 'title': 'Sundal'},
  // {'images': 'images/7.jng', 'title': 'smart watch'},
];

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CategoriesItem.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: Colors.white),
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 05),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset(CategoriesItem[index]['images']),
                  Text(
                    '${CategoriesItem[index]['title']}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5)),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
