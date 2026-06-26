import 'package:flutter/material.dart';
import 'package:youtext/constants/colors.dart';
import 'package:youtext/db/product_db.dart';
import 'package:youtext/model/product_model.dart';

class ProductCardIncart extends StatefulWidget {
  ProductModel item;
  VoidCallback refresh;
   ProductCardIncart({super.key,required this.item,required this.refresh});

  @override
  State<ProductCardIncart> createState() => _ProductCardIncartState();
}

class _ProductCardIncartState extends State<ProductCardIncart> {
  @override
  int quant=1;
  Widget build(BuildContext context) {
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
                    widget.item.image,
                    width: 100,
                    height: 100,
                    
                    
                    
                    
                    ),
                )
              ],
            ),
            Column(
              spacing: 8,
              children: [
               
                   Text(widget.item.name),
                   Text(widget.item.subDescription),
                   Row(
                    spacing: 16,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle
                          
                        ),
                        child: Icon(Icons.minimize,color: ColorsClass.primaryColor,size: 15,),
                      ),
                      Text("$quant"),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: ColorsClass.primaryColor,
                          shape: BoxShape.circle
                        ),
                        child: Icon(Icons.add,color: Colors.white,size: 15,),
                      )
                   
                   
                    ],
                   )
                   
                

              ],
            ),
            Column(
              children: [
                Text("\$${widget.item.price}",style: TextStyle(
                  fontSize: 16,
                  color: ColorsClass.primaryColor
                ),),
                SizedBox(height: 30,),
                InkWell
                (
                  onTap:()
                  
      
                  {
                    int index=products.indexOf(widget.item);
                    
                    setState(() {
                    widget.item=widget.item.copyWith(isSelect: !widget.item.isSelect);
                    products[index]=widget.item;
                    
                  }
                  );
                  widget.refresh();
                  }
                  ,
                  child: Icon(Icons.remove_shopping_cart_sharp,))

              ],
            )
        
          ],
        ),
      ),
    );
  }
}