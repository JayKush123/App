import 'package:hive/hive.dart'; 
import 'package:test/model/category.dart';

class LocalCategoryService {
  late Box<AllCategory> _popularCategoryBox;

  Future<void> init() async {
    _popularCategoryBox = await Hive.openBox<AllCategory>('PopularCategories');
  }

  Future<void> assignAllPopularCategories(
      {required List<AllCategory> popularCategories}) async {
    await _popularCategoryBox.clear();
    await _popularCategoryBox.addAll(popularCategories);
  }

  List<AllCategory> getPopularCategories() =>
      _popularCategoryBox.values.toList();
}
