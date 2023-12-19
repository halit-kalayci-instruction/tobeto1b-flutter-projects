import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.imgUrl, required this.title});
  final String imgUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.network(imgUrl), Text(title)],
    );
  }
}
