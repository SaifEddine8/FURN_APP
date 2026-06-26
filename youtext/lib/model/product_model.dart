import 'dart:ui';

class ProductModel {
final String name;
final String description;
final double price;
final String subDescription;
final double review;
final String image;
final String category;
final bool isFav;
final List<Color>colors;
final bool isSelect;
 ProductModel({
  required this.name,
  required this.description,
  required this.price,
  required this.subDescription,
  required this.review,
  required this.image,
  required this.category,

  this.isFav=false,
  required this.colors,
  this.isSelect=false,


});


ProductModel copyWith(
  {String? name,String? description,String? subDescription,double? price,double? review,String? image,bool? isFav,String? category,List<Color>?colors,bool? isSelect}
){
  return ProductModel(
   name: name??=this.name,
   description: description??=this.description,
   subDescription: subDescription??=this.subDescription,
   price: price??=this.price,
   review: review??=this.review,
   image: image??=this.image,
   isFav: isFav??=this.isFav,
   category: category??=this.category,
   colors: colors??=this.colors,
   isSelect: isSelect??this.isSelect
  );
  

}
}