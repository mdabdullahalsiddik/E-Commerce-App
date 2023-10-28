// ignore_for_file: file_names

import 'package:ecommace/pages/Cart%20Page/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommace/pages/Favorite%20Page/favorite_page.dart';
import 'package:ecommace/pages/Home%20Page/home_page.dart';
import 'package:ecommace/statics/all_colors.dart';

class ButtomNavigatorBarPage extends StatefulWidget {
  const ButtomNavigatorBarPage({super.key});

  @override
  State<ButtomNavigatorBarPage> createState() => _ButtomNavigatorBarPageState();
}

class _ButtomNavigatorBarPageState extends State<ButtomNavigatorBarPage> {
  int seletIndex = 0;

  List<Widget> pages = [
    const HomePage(),
    const CartPage(),
    const HomePage(),
    const FavoritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[seletIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: seletIndex,
        onTap: (index) {
          setState(
            () {
              seletIndex = index;
            },
          );
        },
        selectedIconTheme: const IconThemeData(color: AllColors.primarycolor),
        unselectedIconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.5),
        ),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_sharp),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}
