import 'package:flutter/material.dart';
import 'package:shoping_app/pages/details.dart';

List Items = [
  {
    'images': 'images/1.png',
    'title': 'Sundal',
    'price': '100\$',
    'price_discount': '245\$',
    'isfavorte': false
  },
  {
    'images': 'images/2.png',
    'title': 'Watch',
    'price': '170\$',
    'price_discount': '250\$',
    'isfavorte': false
  },
  {
    'images': 'images/3.png',
    'title': 'Pc bag',
    'price': '80\$',
    'price_discount': '150\$',
    'isfavorte': false
  },
  {
    'images': 'images/4.png',
    'title': 'Shoping Bag',
    'price': '110\$',
    'price_discount': '200\$',
    'isfavorte': false
  },
  {
    'images': 'images/5.png',
    'title': 'women bag',
    'price': '100\$',
    'price_discount': '190\$',
    'isfavorte': false
  },
  {
    'images': 'images/6.png',
    'title': 'Sundal',
    'price': '100\$',
    'price_discount': '125\$',
    'isfavorte': false
  },
];

class Itemsdetails extends StatefulWidget {
  const Itemsdetails({super.key});

  @override
  State<Itemsdetails> createState() => _ItemsdetailsState();
}

class _ItemsdetailsState extends State<Itemsdetails> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 300),
      itemCount: Items.length,
      itemBuilder: (context, index) {
        double originalPrice =
            double.parse(Items[index]['price'].replaceAll('\$', ''));
        double discountPrice =
            double.parse(Items[index]['price_discount'].replaceAll('\$', ''));
        // Calculate the discount ratio
        double discountRatio = (originalPrice / discountPrice) * 100;
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Details(
                          data: Items[index],
                          cartItems: const [],
                        )));
          },
          child: Container(
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(5),
                      height: MediaQuery.sizeOf(context).height * 0.034,
                      width: MediaQuery.sizeOf(context).width * 0.09,
                      decoration: BoxDecoration(
                          color: const Color(0xFF4C53A5),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        '${discountRatio.toStringAsFixed(0)}%',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          Items[index]['isfavorte'] =
                              !Items[index]['isfavorte'];
                        });
                      },
                      icon: Icon(Items[index]['isfavorte']
                          ? Icons.favorite
                          : Icons.favorite_border),
                      color: Colors.red,
                    )
                  ],
                ),
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.24,
                    child: Image.asset(Items[index]['images'])),
                Text(
                  '${Items[index]['title']}',
                  style:
                      const TextStyle(fontSize: 20, color: Color(0xFF4C53A5)),
                ),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        '${Items[index]['price']}',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        '${Items[index]['price_discount']}',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        print('shoping presed');
                      },
                      icon: const Icon(Icons.shopping_cart_checkout_sharp),
                      color: Colors.black,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
