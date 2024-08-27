// // lib/data/models/cart_item_model.dart
// import 'package:mobileassignment/feature/glocery_products/data/models/productmodels.dart';
// import 'package:mobileassignment/feature/glocery_products/domain/entities/cartitem_entiity.dart';


// class CartItemModel extends CartItem {
//   const CartItemModel({
//     required ProductModel product,
//     required int quantity,
//   }) : super(
//           product: product,
//           quantity: quantity,
//         );

//   factory CartItemModel.fromJson(Map<String, dynamic> json) {
//     return CartItemModel(
//       product: ProductModel.fromJson(json['product']),
//       quantity: json['quantity'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'product': (product as ProductModel).toJson(),
//       'quantity': quantity,
//     };
//   }
// }
