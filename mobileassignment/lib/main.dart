import 'package:flutter/material.dart';
import 'package:mobileassignment/app.dart';
import 'package:mobileassignment/service_locator.dart';

Future<void> main() async

{ 
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp( EcommerceApp());
}