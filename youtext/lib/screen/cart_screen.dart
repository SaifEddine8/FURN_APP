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
         child: SingleChildScrollView(
           child: Column(
            spacing: 10,
            crossAxisAlignment: .center,
            children: [
              Text("The Product Joint",style: StyleClass.pageTitle,),
              Text("YOUR CART",style: TextStyle(
                color: ColorsClass.primaryColor
              ),),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.jointItems.length,
                itemBuilder: (context,index)=>
                ProductCardIncart(item: widget.jointItems[index],refresh: () { setState(() {
                  widget.jointItems.removeAt(index);
                });},)
                ),
              // ProductCardIncart(item: widget.jointItems[0])
              
              Row(
                children: [
                  Icon(Icons.edit_note),
                  Text("instractions",style: StyleClass.listTitle,),
                ],
              ),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: "e.g. i want specific service"
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                     Text("Promo Code",style: StyleClass.listTitle,),
                     Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              hintText: "Enter Code"
                            ),
                            
                          ),
                        ),

                        ElevatedButton(onPressed: (){}, child: Text("Apply",
                        style: TextStyle(
                          color: Colors.white
                        ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsClass.primaryColor
                        )
                        )
                           
                      ],
                     )

                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text("Subtotal"),Text(
                            "\$${
                              widget.jointItems.fold(0.0, (sum,item)=>sum+item.price)
                            }",style: TextStyle(fontWeight: .bold),
                  
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text("Delivery Free"),Text(
                            "\$3",style: TextStyle(fontWeight: .bold),
                  
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text("Service Free"),Text(
                            "\$1.5",style: TextStyle(fontWeight: .bold),
                  
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )

              
            ],
                 ),
         ),
       );
    
  }
}