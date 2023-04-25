import 'package:flutter/material.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../main.dart';
import 'AppColors.dart';

class CustomTheme extends StatelessWidget {
  final Widget? child;

  CustomTheme({required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appStore.isDarkMode
          ? ThemeData.dark().copyWith(
              backgroundColor: context.scaffoldBackgroundColor,
              colorScheme:
                  ColorScheme.fromSwatch().copyWith(secondary: primaryColor),
            )
          : ThemeData.light(),
      child: child!,
    );
  }
}
