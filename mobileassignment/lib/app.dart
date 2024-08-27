import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileassignment/feature/glocery_products/presentaion%20layer/bloc/product_bloc.dart';
import 'package:mobileassignment/feature/glocery_products/presentaion%20layer/bloc/product_event.dart';
import 'package:mobileassignment/feature/glocery_products/presentaion%20layer/pages/burgerpage.dart';
import 'package:mobileassignment/feature/glocery_products/presentaion%20layer/pages/splashscreen.dart';
import 'package:mobileassignment/service_locator.dart';


class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GroceryBloc>(
          create: (context) => GroceryBloc(
            getAllProductsusecase: locator(),
            getProductById: locator(),
          )..add(LoadAllGroceriesEvent()),
          
        ),
     
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        
      ),
    );
  }
}
