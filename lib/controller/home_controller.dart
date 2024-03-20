import 'package:get/get.dart';
import 'package:test/model/ad_banner.dart';
import 'package:test/model/category.dart';
import 'package:test/model/product.dart';
import 'package:test/service/local_service/local_ad_banner.dart';
import 'package:test/service/local_service/local_category_service.dart';
import 'package:test/service/local_service/local_product_service.dart';
import 'package:test/service/remote_service/remote_banner_service.dart';
import 'package:test/service/remote_service/remote_popular_category_service.dart';
import 'package:test/service/remote_service/remote_popular_product_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<AllCategory> popularCategoryList =
      List<AllCategory>.empty(growable: true).obs;
  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;
  RxBool isPopularProductLoading = false.obs;
  final LocalAdBannerService _localAdBannerService = LocalAdBannerService();
  final LocalCategoryService _localCategoryService = LocalCategoryService();
  final LocalProductService _localProductService = LocalProductService();

  @override
  void onInit() async {
    await _localAdBannerService.init();
    await _localCategoryService.init();
    await _localProductService.init();
    getAdBanners();
    getPopularCategory();
    getPopularProduct();
    super.onInit();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);
      //assigning local ad banners before call api
      if (_localAdBannerService.getAdBanners().isNotEmpty) {
        bannerList.assignAll(_localAdBannerService.getAdBanners());
      }
      // call api result
      var result = await RemoteBannerService().get();
      if (result != null) {
        // assign api result
        bannerList.assignAll(addBannerListFromJson(result.body));
        // save api result to local db
        _localAdBannerService.assignAllAdBanners(
            adBanners: addBannerListFromJson(result.body));
      }
    } finally {
      isBannerLoading(false);
    }
  }

  void getPopularCategory() async {
    try {
      isPopularCategoryLoading(true);
      //assigning local ad banners before call api
      if (_localCategoryService.getPopularCategories().isNotEmpty) {
        popularCategoryList
            .assignAll(_localCategoryService.getPopularCategories());
      }
      var result = await RemotePopularCategoryService().get();
      if (result != null) {
        // assign api result
        popularCategoryList.assignAll(popularCategoryFromJson(result.body));
        // save api result to local db
        _localCategoryService.assignAllPopularCategories(
            popularCategories: popularCategoryFromJson(result.body));
      }
    } finally {
      isPopularCategoryLoading(false);
    }
  }

  void getPopularProduct() async {
    try {
      isPopularProductLoading(true);
      if (_localProductService.getPopularProducts().isNotEmpty) {
        popularProductList.addAll(_localProductService.getPopularProducts());
      }
      var result = await RemotePopularProductService().getProduct();
      if (result != null) {
        popularProductList.assignAll(popularProductFromJson(result.body));
        _localProductService.assignAllPopularProducts(
            popularProducts: popularProductFromJson(result.body));
      }
    } finally {
      isPopularProductLoading(false);
    }
  }
}
