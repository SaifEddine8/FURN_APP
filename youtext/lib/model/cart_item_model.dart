import 'dart:ui';

import 'package:youtext/model/product_model.dart';

class CartItemModel {
final ProductModel item;
final Color selectedColor;
final int quantity;
CartItemModel({
  required this.item,
   this.quantity=1,
  required this.selectedColor
});


CartItemModel copyWith({
  ProductModel ?item,
 Color ?selectedColor,
 int ?quantity,
})
{
  return CartItemModel(
    item: item??this.item, selectedColor: selectedColor??this.selectedColor,quantity: quantity??this.quantity);

}

}