import 'package:flutter/material.dart';
import 'package:youtext/constants/colors.dart';
import 'package:youtext/constants/style.dart';
import 'package:youtext/model/product_model.dart';
import 'package:youtext/widgets/product_card_incart.dart';

class CartScreen extends StatefulWidget {
  List<ProductModel>jointItems;
   CartScreen({super.key,required this.jointItems});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return 
       Padding(
         padding: const EdgeInsets.all(16),
         child: SizedBox(
          height: .infinity,
          width: .infinity,
           child: Column(
            crossAxisAlignment: .center,
            children: [
              Text("The Product Joint",style: StyleClass.pageTitle,),
              Text("YOUR CART",style: TextStyle(
                color: ColorsClass.primaryColor
              ),),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.jointItems.length,
                  itemBuilder: (context,index)=>
                  ProductCardIncart(item: widget.jointItems[index],refresh: () { setState(() {
                    
                  });},)
                  ),
              )
              // ProductCardIncart(item: widget.jointItems[0])
              
            ],
                 ),
         ),
       );
    
  }
}