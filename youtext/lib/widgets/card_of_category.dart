import 'package:flutter/material.dart';

class CardOfCategory extends StatelessWidget {  
  final String data;
Color c;
  CardOfCategory({super.key, required this.data,required this.c});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child:  Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
           color: c,
          ),
          child: Center(child: Text(data)),
        ),
      
    );
  }
}