class ProductModel {
final String name;
final String description;
final double price;
final String subDescription;
final double review;
final String image;
final bool isFav;
 ProductModel({
  required this.name,
  required this.description,
  required this.price,
  required this.subDescription,
  required this.review,
  required this.image,
  this.isFav=false


});
}