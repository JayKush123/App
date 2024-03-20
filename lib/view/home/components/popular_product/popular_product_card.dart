import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test/constant/constants.dart';
import 'package:test/model/product.dart';

class PopularProductCard extends StatelessWidget {
  final Product product;
  const PopularProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          margin: EdgeInsets.all(10),
          width: 120,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 0.9,
                child: CachedNetworkImage(
                  imageUrl: Constants.rootUrl + product.image,
                  placeholder: (context, url) => Shimmer.fromColors(
                      child: Container(
                        color: Colors.grey,
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                      ),
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white),
                  errorWidget: (context, url, error) => Center(
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Text(
                  product.name,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
