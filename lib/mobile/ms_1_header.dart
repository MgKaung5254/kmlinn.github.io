import 'package:flutter/material.dart';
import 'package:kmlinn_portfolio/widgets/image_view.dart';

import '../statics/data_values.dart';
import '../theme/app_theme.dart';
import '../widgets/social_profiles.dart';

class MS1Header extends StatelessWidget {
  const MS1Header({Key? key}) : super(key: key);

  List<Widget> headerData() {
    return [
      const ImageView(
        imageUrl: 'assets/images/logo.png',
        height: 250.0,
        width: 250.0,
      ),
      const SizedBox(height: 40.0),
      Column(
        children: [
          SelectableText(
            DataValues.headerGreetings,
            style: AppThemeData.darkTheme.textTheme.headlineSmall,
          ),
          SelectableText(
            DataValues.headerName,
            style: AppThemeData.darkTheme.textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          SelectableText(
            DataValues.headerTitle,
            style: AppThemeData.darkTheme.textTheme.titleLarge,
          ),
          const SizedBox(height: 20.0),
          const SocialProfiles(),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppThemeData.backgroundBlack,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: headerData(),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
