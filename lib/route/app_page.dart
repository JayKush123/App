import 'package:get/get.dart';
import 'package:test/route/app_route.dart';
import 'package:test/view/dashboard/dashboard_binding.dart';
import 'package:test/view/dashboard/dashboard_screen.dart';

class AppPage {
  static var list = [
    GetPage(name: AppRoute.dashboard, page: () => DashboardScreen(),binding: DashboardBinding())
  ];
}
