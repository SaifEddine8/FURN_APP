import 'package:flutter/material.dart';
import 'package:youtext/constants/colors.dart';
import 'package:youtext/constants/style.dart';
import 'package:youtext/db/product_db.dart';
import 'package:youtext/model/product_model.dart';
import 'package:youtext/widgets/product_card_incart.dart';

class CartScreen extends StatefulWidget {
  List<ProductModel> jointItems;
  CartScreen({super.key, required this.jointItems});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          spacing: 10,
          crossAxisAlignment: .center,
          children: [
            Text("The Product Joint", style: StyleClass.pageTitle),
            Text(
              "YOUR CART",
              style: TextStyle(color: ColorsClass.primaryColor),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.jointItems.length,
              itemBuilder: (context, index) => ProductCardIncart(
                ontap: () {
                  int indexidb = products.indexOf(widget.jointItems[index]);
                  setState(() {
                    widget.jointItems[index] = widget.jointItems[index]
                        .copyWith(isSelect: !widget.jointItems[index].isSelect);
                    products[indexidb] = widget.jointItems[index];
                  });
                  widget.jointItems.removeAt(index);
                },
                item: widget.jointItems[index],
              ),
            ),

            // ProductCardIncart(item: widget.jointItems[0])
            Row(
              children: [
                Icon(Icons.edit_note),
                Text("instractions", style: StyleClass.listTitle),
              ],
            ),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: "e.g. i want specific service",
              ),
            ),
            SizedBox(
              height: h * 0.2,
              width: w,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text("Promo Code", style: StyleClass.listTitle),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          SizedBox(
                            width: w * 0.6,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                hintText: "Enter Code",
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Apply",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsClass.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                        Text("Subtotal"),
                        Text(
                          "\$${widget.jointItems.fold(0.0, (sum, item) => sum + item.price)}",
                          style: TextStyle(fontWeight: .bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text("Delivery Free"),
                        Text("\$3", style: TextStyle(fontWeight: .bold)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text("Service Free"),
                        Text("\$1.5", style: TextStyle(fontWeight: .bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


    //  Row(
    //                   children: [
    //                     TextField(
    //                       decoration: InputDecoration(
    //                         border: OutlineInputBorder(
    //                           borderRadius: BorderRadius.all(
    //                             Radius.circular(20),
    //                           ),
    //                         ),
    //                         hintText: "Enter Code",
    //                       ),
    //                     ),

    //                     ElevatedButton(
    //                       onPressed: () {},
    //                       child: Text(
    //                         "Apply",
    //                         style: TextStyle(color: Colors.white),
    //                       ),
    //                       style: ElevatedButton.styleFrom(
    //                         backgroundColor: ColorsClass.primaryColor,
    //                       ),
    //                     ),
    //                   ],
    //                 ),