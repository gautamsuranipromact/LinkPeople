import 'package:flutter/material.dart';
import 'package:link_people/utils/Extensions/String_extensions.dart';

import 'Constants.dart';

const scaffoldDarkColor = Color(0xFF12181B);

const textPrimaryColor = Color(0xFF2E3033);
const textSecondaryColor = Color(0xFF757575);
const viewLineColor = Color(0xFFEAEAEA);
const transparentColor = Color(0x00000000);
const headerColor = Color(0xFF004DB8);
const coverColor = Color(0x8000275D);
const orangeColor = Color(0xFFFF661C);
const greyColor = Color(0xFFC4C4C4);
const lightBlackColor = Color(0xFF00275D);
const lightGreyColor = Color(0xFF93A7C2);
const linkColor = Color(0xFF006FCE);
const linkedinColor = Color(0xFF0678B6);
const facebookColor = Color(0xFF4B69B1);
const twitterColor = Color(0xFF37B1E2);

const whiteColor = Colors.white;
const blackColor = Colors.black;
Color transparentBlue = coverColor.withOpacity(50);
Color shadowColorGlobal = Colors.grey.withOpacity(0.4);
Color appBarBackgroundColorGlobal = Colors.white;
Color appButtonBackgroundColorGlobal = Colors.white;
Color defaultAppButtonTextColorGlobal = textPrimaryColorGlobal;

Color getColorFromHex(String hexColor, {Color? defaultColor}) {
  if (hexColor.validate().isEmpty) {
    if (defaultColor != null) {
      return defaultColor;
    } else {
      throw ArgumentError('Can not parse provided hex $hexColor');
    }
  }

  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
