import 'package:flutter/material.dart';
import 'package:mobileassignment/feature/glocery_products/domain/entities/glocery_entitiy.dart';

class BurgerDetailspage extends StatefulWidget {
  final Product product;
  const BurgerDetailspage({super.key,required this.product});

  @override
  State<BurgerDetailspage> createState() => _BurgerDetailspageState();
}

class _BurgerDetailspageState extends State<BurgerDetailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      // Image Card
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              widget.product.imageUrl, // Image URL
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 250,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                      ),
                      // Back Button
                      Positioned(
                        top: 10,
                        left: 10,
                        child: FloatingActionButton.small(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          shape: CircleBorder(),
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.arrow_back_rounded, color: Colors.black),
                        ),
                      ),
                      // Heart Icon
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Additional content below the image
                   Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.0),
                        Text(
                          widget.product.title, // Static title
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.discount.toString(), // Static price
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              widget.product.price.toString(), // Static discount
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 20.0),
                                SizedBox(width: 4.0),
                                Text(
                                  widget.product.rating.toString() ,// Static rating
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                            Row(children: [
                              Text(
                                'see all review',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  decoration: TextDecoration.underline, 
                                  color: Colors.grey, // Underline and grey color
                                ),
                              ),
                            ])
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Text(
                            widget.product.description),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'see more',
                              style: TextStyle(
                                fontSize: 12.0,
                                decoration: TextDecoration.underline, 
                                color: Colors.grey, // Underline and grey color
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Additional options:',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Add Cheese'),
                                Row(
                                  children: [
                                    Text('+ £0.50'),
                                    SizedBox(width: 8),
                                    Icon(Icons.check_box_outline_blank, size: 20.0),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Add Bacon'),
                                Row(
                                  children: [
                                    Text('+ £1.00'),
                                    SizedBox(width: 8),
                                    Icon(Icons.check_box_outline_blank, size: 20.0),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Add Meat'),
                                Row(
                                  children: [
                                    Text('+ 1.50'),
                                    SizedBox(width: 8),
                                    Icon(Icons.check_box_outline_blank, size: 20.0),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 140.0), // Add space to push content above the bottom menu
                      ],
                    ),
                  ),
                ],

              ),
            ),
            // Bottom Menu Container
            Positioned(
              bottom: 0,
              left: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Remove button with circle background
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Text(
                          '1', // Display the quantity
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(width: 16.0),
                        // Add button with circle background
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              // Increase quantity action
                            },
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add to basket action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Red background color
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      ),
                      icon: Icon(Icons.shopping_basket, color: Colors.white),
                      label: Text(
                        'Add to Basket',
                        style: TextStyle(color: Colors.white),
                      ),
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
