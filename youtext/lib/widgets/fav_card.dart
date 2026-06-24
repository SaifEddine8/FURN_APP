import 'package:flutter/material.dart';
import 'package:youtext/constants/style.dart';
import 'package:youtext/model/product_model.dart';

class FavCard extends StatelessWidget {
  ProductModel item;
  FavCard({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.network(item.image,height: 120,width: 120,),
          Column(
            children: [
              Text(item.name,style: StyleClass.listTitle,),
              Text(item.price.toString())
          
            ],
          ),
        ],
      ),
    );
  }
}