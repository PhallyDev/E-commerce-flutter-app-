import 'package:ecommerce_fakeapi/view/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  dotenv.get('api_key');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
    
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
            
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Homescreen() ,
    );
  }
}