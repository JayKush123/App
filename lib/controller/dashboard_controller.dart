import 'package:get/get.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;

  updateIndex(int index) {
    tabIndex = index;
    update();
  }
}
