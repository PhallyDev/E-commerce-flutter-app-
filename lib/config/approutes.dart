import 'package:get/get.dart';
import 'package:ecommerce_fakeapi/view/homescreen.dart';
class Approutes {
  static const String homescreen = '/';
  static final  aproute =[
    GetPage(name: homescreen, page: () => Homescreen()  )
  ];
}
