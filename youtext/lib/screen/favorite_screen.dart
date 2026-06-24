import 'package:flutter/material.dart';
import 'package:youtext/model/product_model.dart';
import 'package:youtext/widgets/fav_card.dart';
import 'package:youtext/widgets/product_card.dart';

class FavoriteScreen extends StatefulWidget {
  List<ProductModel>favList;
   FavoriteScreen({super.key,required this.favList});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index)=>FavCard(item: widget.favList[index]),itemCount: widget.favList.length,);
  }
}