import 'package:flutter/material.dart';
import 'package:test/view/home/components/popular_category.dart/popular_category_loading_card.dart';

class PopularCategoryLoading extends StatelessWidget {
  const PopularCategoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => PopularCategoryLoadingCard()),
    );
  }
}
