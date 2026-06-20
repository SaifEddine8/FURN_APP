import 'package:flutter/material.dart';
import 'package:youtext/screen/cart_screen.dart';
import 'package:youtext/screen/favorite_screen.dart';
import 'package:youtext/screen/home_screen.dart';
import 'package:youtext/screen/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index=0;
  Map<String,Icon> itemsList={
    'Home':Icon(Icons.home),
    'Favorites':Icon(Icons.favorite),
    'Cart':Icon(Icons.card_travel),
    'Profile':Icon(Icons.person)
  };
  List<Widget> screens=[
   HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[index]),
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xcd2f4b4e),
        unselectedItemColor: Colors.grey,
        items: itemsList.entries.map((i)=>
        BottomNavigationBarItem(
          backgroundColor: Colors.white,

          icon:i.value,
          label:i.key
        )
        ).toList(),
       currentIndex: index,
       onTap:(value)=>
       setState((){
        index=value;
       })
      ),
    );
  }
}