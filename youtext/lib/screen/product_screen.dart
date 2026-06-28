import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:youtext/constants/colors.dart';
import 'package:youtext/constants/style.dart';
import 'package:youtext/db/cart_db.dart';
import 'package:youtext/db/product_db.dart';
import 'package:youtext/model/cart_item_model.dart';
import 'package:youtext/model/product_model.dart';
import 'package:youtext/widgets/item_colors.dart';
  

class ProductScreen extends StatefulWidget {
  ProductModel item;
  ProductScreen({super.key, required this.item});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int selectedIndex = -1;
  late FToast fToast;
  Color ?itemColor;
@override
void initState() {
  super.initState();
  fToast = FToast();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    fToast.init(context);
  });
}
  @override
  Widget build(BuildContext context) {
    int index = products.indexOf(widget.item);
    

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {
                setState(() {
                  widget.item = widget.item.copyWith(isFav: !widget.item.isFav);
                  products[index] = widget.item;
                });
              },

              child: Icon(
                widget.item.isFav
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: .spaceBetween,

            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.item.image),
                  ),
                ),
                width: double.infinity,
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
                child: Text(
                  widget.item.description,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 16),
              Card(
                color: Color.fromARGB(255, 205, 222, 223),
                child: Container(
                  height: 80,
                  width: .infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "Color",
                          style: TextStyle(fontWeight: .bold, fontSize: 16),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: .horizontal,
                            itemCount: widget.item.colors.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                  itemColor=widget.item.colors[index];
                                });
                              },

                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: ItemColors.colorItem(
                                  c: widget.item.colors[index],
                                  isSelectedColor: selectedIndex == index
                                      ? true
                                      : false,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
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
                      InkWell(
                        onTap: ()  
                        {
                          if(itemColor==null ||selectedIndex==-1)
                          {
                            showSuccessToast(false);
                            return;


                          }
                          int index=cart.indexWhere((data)=>data.item==widget.item&&data.selectedColor==itemColor);
                        setState(() { 
                         
                          if(index!=-1)
                          {
                           cart[index]=cart[index].copyWith(quantity:cart[index].quantity+1 );
                           showSuccessToast(true);
                          }
                          else
                          {
                            cart.add(CartItemModel(item: widget.item, selectedColor: itemColor!));
                            showSuccessToast(true);
                          }
                          
                         
                        });
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            color: ColorsClass.primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: .center,
                            spacing: 16,
                            children: [
                              Text(
                                "ADD TO CART",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(
                                Icons.card_travel_outlined,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showSuccessToast(bool check) {
  Widget toast = Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    decoration: BoxDecoration(
      color:check? Colors.green:Colors.red,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(check?Icons.check:Icons.not_interested_sharp, color: Colors.white),
        SizedBox(width: 10),
        Text(

          check?"Added Successfully":"failed added",
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.CENTER, // أو BOTTOM
    toastDuration: Duration(seconds: 2),
  );
}

}



