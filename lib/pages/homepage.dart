import 'package:flutter/material.dart';
import 'package:shoping_app/pages/HomeContentPage.dart';
import 'package:shoping_app/pages/Library%20Page.dart';
import 'package:shoping_app/pages/cartpage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int _currentIndex = 0;
  final List cartItems = [];

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeContentPage(),
      const cartpage(
        cartItems: null,
      ), // Pass cartItems to cartpage
      LibraryPage(),
    ];
  }

  void ontap_(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Colors.transparent,
        color: const Color(0xFF4C53A5),
        items: const <Widget>[
          Icon(Icons.home, color: Colors.white, size: 30),
          Icon(Icons.shopping_cart, color: Colors.white, size: 30),
          Icon(Icons.library_books_outlined, color: Colors.white, size: 30),
        ],
        onTap: ontap_,
      ),
      body: _pages[_currentIndex],
    );
  }
}
