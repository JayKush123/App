import 'package:get/get.dart';
import 'package:test/controller/dashboard_controller.dart';
import 'package:test/controller/home_controller.dart';
import 'package:test/controller/product_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(ProductController());
  }
}
