import 'package:flutter/material.dart';
import 'package:kmlinn_portfolio/widgets/image_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer';

class ButtonImage {
  final String name;
  final Uri url;
  final double height;
  final double width;

  ButtonImage({
    required this.name,
    required this.url,
    this.height = 70.0,
    this.width = 70.0,
  });

  Widget returnButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          if (!await launchUrl(url)) {
            throw 'Could not launch $url';
          }
          log("Direct to: $url");
        },
        child: Tooltip(
          message: url.toString(),
          child: ImageView(
            imageUrl: 'assets/images/$name.png',
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
