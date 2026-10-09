import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
   Homescreen({super.key,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home ')),
      body: Center(child: Text('Welcome to the Home Screen!')),
    );
  }
}
  