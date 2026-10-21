import 'package:ecommerce_fakeapi/view/homewidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/appcolors.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar, body: _buildBody);
  }

  AppBar get _buildAppBar {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: Text("Home screen"),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: SizedBox(
          height: Get.height * 0.05,
          width: double.infinity,

          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: AppColors.surface,
            ),
          ),
        ),
      ),
    );
  }

  // ignore: strict_top_level_inference
  get _buildBody {
    return HomeWidget();
  }
}
