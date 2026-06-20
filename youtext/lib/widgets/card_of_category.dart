import 'package:flutter/material.dart';

class CardOfCategory extends StatelessWidget {  
  final String data;

  const CardOfCategory({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
         // color: Colors.amber,
        ),
        child: Center(child: Text(data)),
      ),
    );
  }
}