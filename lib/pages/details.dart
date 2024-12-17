import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shoping_app/widgets/itemnavigatoinbar.dart';

class Details extends StatefulWidget {
  final data;
  final List cartItems;

  const Details({super.key, required this.data, required this.cartItems});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int _value = 0;
  int selectedsizeindex = -1;
  int selectedcolorindex = -1;

  void _increaseValue() {
    setState(() {
      _value++;
    });
  }

  void _decreaseValue() {
    setState(() {
      if (_value > 0) {
        _value--;
      }
    });
  }

  List<Color> clrs = [
    Colors.red,
    Colors.blue,
    const Color(0xFF4C53A5),
    Colors.amber,
    Colors.grey,
    Colors.white,
    Colors.green,
  ];

  void addtocart() {
    final selectedsize = selectedsizeindex == -1
        ? 'No size selected'
        : (37 + selectedsizeindex).toString();
    final selectedcolor = selectedcolorindex == -1
        ? 'No color selected'
        : clrs[selectedcolorindex].toString();

    setState(() {
      widget.cartItems.add({
        'title': widget.data['title'],
        'quantity': _value,
        'size': selectedsize,
        'color': selectedcolor,
        'image': widget.data['image'],
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 15),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.4,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                widget.data['images'],
              ),
            ),
            Arc(
              height: MediaQuery.sizeOf(context).height * 0.05,
              edge: Edge.TOP, // Arc at the top of the container
              arcType: ArcType.CONVEY, // Convex arc
              child: Container(
                width: double.infinity,
                color: Colors.white,
                // height: MediaQuery.sizeOf(context).height * 0.8,
                alignment: Alignment.center, // Center the text
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, bottom: 0, left: 20),
                          child: Text(
                            '${widget.data['title']}',
                            style: const TextStyle(
                              color: Color(0xFF4C53A5),
                              fontSize: 29,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0, left: 10),
                      child: Row(
                        children: [
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Color(0xFF4C53A5),
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(300),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: _decreaseValue,
                                    icon: const Icon(
                                      CupertinoIcons.minus,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '$_value', // Display the current value
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  height: 30,
                                  width: 30,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(300),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: _increaseValue,
                                    icon: const Icon(
                                      CupertinoIcons.plus,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        'here the descreptoin of the product , you can write any things with details',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Text(
                            'Size :',
                            style: TextStyle(fontSize: 25),
                          ),
                          Row(
                            children: [
                              for (int i = 37; i < 44; i++)
                                Container(
                                  height: 25, // Increased size
                                  width: 25, // Increased size
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: selectedsizeindex == i - 37
                                        ? const Color(0xFF4C53A5)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(200),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 6,
                                        spreadRadius: 4,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedsizeindex = i - 37;
                                      });
                                    },
                                    child: Text(
                                      i.toString(),
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 10),
                      child: Row(
                        children: [
                          const Text(
                            'Size :',
                            style: TextStyle(fontSize: 25),
                          ),
                          Row(
                            children: [
                              for (int i = 0; i < clrs.length; i++)
                                Container(
                                  height: 25, // Increased size
                                  width: 25, // Increased size
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: clrs[i],
                                    borderRadius: BorderRadius.circular(200),
                                    border: selectedcolorindex == i
                                        ? Border.all(
                                            color: Colors.black, width: 2)
                                        : null,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: clrs[i] == Colors.white
                                            ? Colors.black
                                            : clrs[i],
                                      ),
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedcolorindex = i;
                                      });
                                    },
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: itemnavigatoinbar(
        data: widget.data['price'],
        onaddtocart: addtocart,
        cartitemslist: widget.cartItems,
      ),
    );
  }
}
