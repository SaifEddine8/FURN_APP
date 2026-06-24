import 'package:flutter/material.dart';
import 'package:youtext/constants/style.dart';
import 'package:youtext/db/product_db.dart';
import 'package:youtext/model/product_model.dart';
import 'package:youtext/widgets/card_of_category.dart';
import 'package:youtext/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=-1;
  String selectedCategory="All";
  String search="";
  @override
  
  Widget build(BuildContext context) {
    List<ProductModel> filterItem=products.where((item){
    final filterByCategory=selectedCategory=="All"|| selectedCategory==item.category;
    final searchByUser=item.name.toLowerCase().contains(search);
    return filterByCategory && searchByUser;
  }).toList();
    // selectedCategory=="All"?products:products.where(
    //   (item)=>
    //   item.category==selectedCategory
    // ).toList();

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
            onChanged: (value)=>
            setState(() {
              search=value.toLowerCase();
            })
            ,
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
          SizedBox(height: 20,),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemExtent: 100,
              itemBuilder: (context, index) => InkWell
              (
                onTap: ()=>
                setState(() {
                  selectedIndex=index;
                  selectedCategory=categories[index];
                  
                }),
                
                child: CardOfCategory(data: categories[index], c:selectedIndex==index?Color(0xcd2f4b4e):Colors.grey ,),
                ),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 7,
            child: GridView.builder(
              
              itemCount: filterItem.length,
              
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,crossAxisSpacing: 5,mainAxisExtent: 220 ),
              itemBuilder:(context,index)=>
              ProductCard(data:filterItem[index],changeStatus: (){
                int indexOfFilterList=products.indexOf(filterItem[index]);
                setState((){
                  products[indexOfFilterList]=products[indexOfFilterList].copyWith(isFav: !products[indexOfFilterList].isFav);
                });

              }, ) ,
             
            ),
          )
        ],
      ),
    );
  }
}