import 'package:flutter/material.dart';
import 'package:test/component/main_header.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [MainHeader(), Expanded(child: Container())],
    ));
  }
}
