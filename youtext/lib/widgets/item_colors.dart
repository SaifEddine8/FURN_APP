import 'package:flutter/material.dart';

class ItemColors {
  

  static Widget colorItem({required Color c,required bool isSelectedColor})
  {
    return Container(
      height: 25,
      width: 25,
      decoration:
      
      BoxDecoration(
        color: c,
        border:isSelectedColor? Border.all(
          color: Colors.black,
          

        ):Border.all(
          color: Colors.transparent,
        

        ),
        shape: BoxShape.circle
      )
    );
  } 
}