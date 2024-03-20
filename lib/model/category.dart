import 'dart:convert';

import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 2)
class AllCategory {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;

  AllCategory({required this.id, required this.name, required this.image});

  factory AllCategory.popularCategoryFromJson(Map<String, dynamic> data) =>
      AllCategory(id: data['id'], name: data['name'], image: data['icon']);
}

List<AllCategory> popularCategoryFromJson(String val) =>
    List<AllCategory>.from(json
        .decode(val)['data']['categories']
        .map((category) => AllCategory.popularCategoryFromJson(category)));
