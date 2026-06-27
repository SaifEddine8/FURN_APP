import 'package:flutter/material.dart';
import 'package:youtext/constants/style.dart';
import 'package:youtext/model/product_model.dart';
import 'package:youtext/screen/product_screen.dart';

class ProductCard extends StatelessWidget {
  ProductModel data;
  VoidCallback changeStatus;
  VoidCallback refresh;
  ProductCard({
    super.key,
    required this.data,
    required this.changeStatus,
    required this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductScreen(item: data)),
        );
        refresh();
      },
      child: Card(
        child: Column(
          children: [
            Image.network(
              data.image,
              height: 100,
              width: .infinity,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        data.name,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Row(
                        children: [
                          Text(
                            data.review.toString(),
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(color: Colors.grey),
                          ),
                          Icon(Icons.star, color: Colors.amber, size: 15),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "\$ ${data.price.toString()}",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      IconButton(
                        onPressed: changeStatus,
                        icon: Icon(
                          data.isFav
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
