import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.boxFit,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular((width ?? 250) / 2),
      child: Image.asset(
        imageUrl,
        width: width ?? 250.0,
        height: height ?? 250.0,
        fit: boxFit ?? BoxFit.fitWidth,
      ),
    );
  }
}