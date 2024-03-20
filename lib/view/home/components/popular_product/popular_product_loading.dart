import 'package:flutter/material.dart';
import 'package:test/view/home/components/popular_product/popular_product_loading_card.dart';

class PopularProductLoading extends StatelessWidget {
  const PopularProductLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => PopularProductLoadingCard()),
    );
  }
}
