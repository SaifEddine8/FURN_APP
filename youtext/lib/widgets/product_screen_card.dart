import 'package:flutter/material.dart';
import 'package:youtext/constants/colors.dart';
import 'package:youtext/model/product_model.dart';

class ProductScreenCard extends StatefulWidget {
  ProductModel item;
   ProductScreenCard({super.key,required this.item});

  @override
  State<ProductScreenCard> createState() => _ProductScreenCardState();
}

class _ProductScreenCardState extends State<ProductScreenCard> {
  @override
  Widget build(BuildContext context) {
    return  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.item.image),
                  ),
                ),
                height: 250,
                width: double.infinity,
    );
              
  }
}