import 'package:flutter/material.dart';
import 'package:youtext/constants/style.dart';
import 'package:youtext/db/product_db.dart';
import 'package:youtext/widgets/card_of_category.dart';
import 'package:youtext/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Discover the best\nfurniture",style:StyleClass.pageTitle),
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage("https://img.magnific.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4841.jpg?semt=ais_hybrid&w=740&q=80"),
                
              )
            ],
            
          ),
          SizedBox(height: 30),
          Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15)
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              hintText: "Search furniture",
              suffixIcon: Icon(Icons.filter_list)
            ),

          ),
          
          ),
          SizedBox(height: 20),
          Text("Categories",style:StyleClass.listTitle),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemExtent: 100,
              itemBuilder: (context, index) => CardOfCategory(data: categories[index]),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 5,
            child: GridView.builder(
              
              itemCount: products.length,
              
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,crossAxisSpacing: 5,mainAxisExtent: 220 ),
              itemBuilder:(context,index)=>
              ProductCard(data:products[index],changeStatus: (){
                
              }, ) ,
             
            ),
          )
        ],
      ),
    );
  }
}