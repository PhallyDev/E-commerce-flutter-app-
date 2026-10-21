import 'dart:async';

import 'package:ecommerce_fakeapi/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/productmodel.dart';

class HomeController extends GetxController {
  final RxList<Product> products = <Product>[].obs;
  final PageController pageController = PageController();
  final currentPage = 0.obs;
  final isLoading = true.obs;
  final errorMessage = RxnString();
  Timer? _timer;
  int get bannerCount => products.length;
  ApiService get apiService => ApiService(baseUrl: dotenv.env['api_key'] ?? '');

  @override
  void onInit() async {
    super.onInit();
    await fetchProducts();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (bannerCount < 2 || !pageController.hasClients) return;
      final nextPage = (currentPage.value + 1) % bannerCount;
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      currentPage.value = nextPage;
    });
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      final response = await apiService.callApi<ProductModel>(
        endpoint: 'products',
        fromJson: ProductModel.fromMap,
      );
      products.assignAll(response.products);
    } catch (error, stackTrace) {
      errorMessage.value = 'Could not load products. Please try again.';
      debugPrint('Failed to fetch products: $error\n$stackTrace');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
