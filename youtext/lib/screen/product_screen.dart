import 'package:flutter/material.dart';
import 'package:youtext/constants/style.dart';
import 'package:youtext/model/product_model.dart';

class ProductScreen extends StatefulWidget {
  ProductModel item;
  ProductScreen({super.key, required this.item});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: .spaceBetween,

            crossAxisAlignment: .start,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.item.image),
                  ),
                ),
                height: 200,
                //width: 100,
              ),

              //Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(widget.item.name, style: StyleClass.listTitle),
                    Row(
                      children: [
                        Text(widget.item.review.toString()),
                        Icon(Icons.star, color: Colors.amber, size: 16),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      widget.item.description,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Center(
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "\$${widget.item.price}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: .bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        color: Color(0xcd2f4b4e),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "ADD TO CART",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
