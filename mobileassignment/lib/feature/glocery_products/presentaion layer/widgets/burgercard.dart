import 'package:flutter/material.dart';
import 'package:mobileassignment/feature/glocery_products/domain/entities/glocery_entitiy.dart';
import 'package:mobileassignment/feature/glocery_products/presentaion%20layer/pages/burger_detailspage.dart';

class BurgerCard extends StatelessWidget {
   final Product  product;
    BurgerCard({Key? key, required this.product});


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => BurgerDetailspage(product: product,)));

      },
      child: Card(
        elevation: 7.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with Heart Icon
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    height: 150.0,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  right: 8.0,
                  top: 8.0,
                  child: Container(
                    // width: 30.0,
                    // height: 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      
                    ),
                    child: Icon(
                      Icons.favorite_outline,
                      color: Colors.red,
                      size: 20.0,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    product.title, // Static title
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  // Rating
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20.0),
                      SizedBox(width: 4.0),
                      Text(
                        product.rating.toString(), // Static rating
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  // Price and Discount
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        product.discount.toString(), // Static price
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
      
                        ),
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        product.price.toString(), // Static discount
                        style: TextStyle(
                          fontSize: 16.0,
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
