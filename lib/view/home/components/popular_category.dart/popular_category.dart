import 'package:flutter/material.dart';
import 'package:test/model/category.dart';
import 'package:test/view/home/components/popular_category.dart/popular_category_card.dart';

class PopularCategory extends StatelessWidget {
  final List<AllCategory> categories;
  const PopularCategory({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => PopularCategoryCard(category: categories[index],)),
    );
  }
}
