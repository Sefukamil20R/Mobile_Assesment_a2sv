import 'package:flutter/material.dart';
import 'package:mobileassignment/feature/glocery_products/presentaion%20layer/pages/burgerpage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => BurgerPage(), 
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/backimage.png', fit: BoxFit.cover),
          // column of texts saying welcome speedyshow alignment end 
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
            
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Welcome to', style: TextStyle(fontSize: 30 , color: Colors.white)),
                Text('SPEEDY CHOW', style: TextStyle(fontSize: 45 , color: Colors.white , fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}