import 'package:flutter/material.dart';
import 'package:youtext/constants/colors.dart';
import 'package:youtext/db/product_db.dart';
import 'package:youtext/model/cart_item_model.dart';
import 'package:youtext/model/product_model.dart';
import 'package:youtext/widgets/item_colors.dart';

class ProductCardIncart extends StatefulWidget {
CartItemModel data;  //VoidCallback refresh;
  VoidCallback remove;
  VoidCallback add;
  VoidCallback sub;


  ProductCardIncart({
    super.key,
    required this.data,
    // required this.refresh,
    required this.remove,
    required this.add,
    required this.sub
  });

  @override
  State<ProductCardIncart> createState() => _ProductCardIncartState();
}

class _ProductCardIncartState extends State<ProductCardIncart> {
  @override

  Widget build(BuildContext context) {
          double w = MediaQuery.of(context).size.width;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: .spaceAround,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Image.network(
                    widget.data.item.image,
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
            Column(
              spacing: 8,
              children: [
                Text(widget.data.item.name),
                SizedBox(
                  width: w*0.25,
                  child: Row(
                    mainAxisAlignment: .spaceAround,
                    children: [
                      Text(widget.data.item.subDescription),
                      ItemColors.colorItem(c: widget.data.selectedColor, isSelectedColor:false )
                    ],
                  ),
                ),
                Row(
                  spacing: 16,
                  children: [
                    InkWell(
                      onTap: widget.sub,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Icon(
                          Icons.minimize,
                          color: ColorsClass.primaryColor,
                          size: 15,
                        ),
                      ),
                    ),
                    Text("${widget.data.quantity}"),
                    InkWell(
                      onTap: widget.add,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: ColorsClass.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add, color: Colors.white, size: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "\$${widget.data.item.price}",
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorsClass.primaryColor,
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: widget.remove,
                  child: Icon(Icons.remove_shopping_cart_sharp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
