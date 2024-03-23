import 'package:flutter/material.dart';
import 'package:kmlinn_portfolio/widgets/image_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer';

import '../theme/app_theme.dart';
import '../widgets/text_pairs.dart';
import 'button_text.dart';

class ContainerCard {
  Widget type1({
    required String title,
    required String description,
    required String image,
    required String message,
    required Uri url,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppThemeData.cardGrey,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageView(
                  imageUrl: image,
                  height: 70.0,
                  width: 70.0,
                ),
                const SizedBox(height: 20.0),
                SelectableText(
                  title,
                  style: TextStyle(
                    fontSize:
                        AppThemeData.darkTheme.textTheme.titleMedium!.fontSize,
                    fontWeight: AppThemeData
                        .darkTheme.textTheme.headlineSmall!.fontWeight,
                    color: AppThemeData.textWhite,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            SelectableText(description,
                style: AppThemeData.darkTheme.textTheme.labelLarge),
            const SizedBox(height: 20.0),
            // ButtonTextSmall(
            //   text: 'View More >>',
            //   message: message,
            //   url: url,
            // ),
          ],
        ),
      ),
    );
  }

  Widget education({
    required String image,
    required String title,
    required List values,
    required String message,
    required Uri url,
    BoxFit? boxFit,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppThemeData.cardGrey,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageView(
                  imageUrl: 'assets/images/$image.png',
                  width: 70.0,
                  height: 70.0,
                  boxFit: boxFit ?? BoxFit.scaleDown,
                ),
                const SizedBox(height: 20.0),
                SelectableText(
                  title,
                  style: TextStyle(
                    fontSize:
                        AppThemeData.darkTheme.textTheme.titleMedium!.fontSize,
                    fontWeight: AppThemeData
                        .darkTheme.textTheme.headlineSmall!.fontWeight,
                    color: AppThemeData.textPrimary,
                  ),
                ),
                const SizedBox(height: 10.0),
                for (var i = 0; i < values.length; i += 3)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextPairs().experience(
                        title: values[i],
                        value1: values[i + 1],
                        value2: values[i + 2],
                        isThreeLines: false,
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 20.0),
            ButtonTextSmall(
              text: 'View More >>',
              message: message,
              url: url,
            ),
          ],
        ),
      ),
    );
  }

  Widget experience({
    required String image,
    required String title,
    required String role,
    required String years,
    required String values,
    required String message,
    required Uri url,
    required bool isButtonEnabled,
    BoxFit? boxFit,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppThemeData.cardGrey,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageView(
                  imageUrl: 'assets/images/$image.png',
                  width: 70.0,
                  height: 70.0,
                  boxFit: boxFit ?? BoxFit.scaleDown,
                ),
                const SizedBox(height: 20.0),
                SelectableText(
                  title,
                  style: TextStyle(
                    fontSize:
                        AppThemeData.darkTheme.textTheme.titleMedium!.fontSize,
                    fontWeight: AppThemeData
                        .darkTheme.textTheme.headlineSmall!.fontWeight,
                    color: AppThemeData.textPrimary,
                  ),
                ),
                const SizedBox(height: 10.0),
                TextPairs().experience(
                  title: role,
                  value1: years,
                  value2: values,
                  isThreeLines: true,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            isButtonEnabled
                ? ButtonTextSmall(
                    text: 'View More >>',
                    message: message,
                    url: url,
                  )
                : Text(
                    'See you soon with the link :)',
                    style: AppThemeData.darkTheme.textTheme.labelMedium,
                  ),
          ],
        ),
      ),
    );
  }

  Widget type4({
    required String image,
    required String title,
    required String message,
    required Uri url,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Tooltip(
          message: 'Visit $message',
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                if (!await launchUrl(url)) {
                  throw 'Could not launch $url';
                }
                log("Direct to: $url");
              },
              child: Text(
                message,
                style: TextStyle(
                  fontSize:
                      AppThemeData.darkTheme.textTheme.labelLarge!.fontSize,
                  fontWeight:
                      AppThemeData.darkTheme.textTheme.labelLarge!.fontWeight,
                  color: AppThemeData.textWhite,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
