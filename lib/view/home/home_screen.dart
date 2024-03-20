import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test/component/main_header.dart';
import 'package:test/controller/controllers.dart';
import 'package:test/view/home/components/carousel_slider/carousel_loading.dart';
import 'package:test/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:test/view/home/components/popular_category.dart/popular_category.dart';
import 'package:test/view/home/components/popular_category.dart/popular_category_loading.dart';
import 'package:test/view/home/components/popular_product/popular_product.dart';
import 'package:test/view/home/components/popular_product/popular_product_loading.dart';
import 'package:test/view/home/components/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        MainHeader(),
        Expanded(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Obx(() {
                if (homeController.bannerList.isNotEmpty) {
                  return CarouselSliderView(
                    bannerList: homeController.bannerList,
                  );
                } else {
                  return CarouselLoading();
                }
              }),
              SectionTitle(title: "Popular Category"),
              Obx(() {
                if (homeController.popularCategoryList.isNotEmpty) {
                  return PopularCategory(
                    categories: homeController.popularCategoryList,
                  );
                } else {
                  return PopularCategoryLoading();
                }
              }),
              SectionTitle(title: "Popular Product"),
              Obx(() {
                if (homeController.popularProductList.isNotEmpty) {
                  return PopularProduct(
                    popularProducts: homeController.popularProductList,
                  );
                } else {
                  return PopularProductLoading();
                }
              }),
            ],
          ),
        ))
      ],
    ));
  }
}
