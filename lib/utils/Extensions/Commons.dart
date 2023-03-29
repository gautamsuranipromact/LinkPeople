import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';
import 'package:link_people/utils/Extensions/string_extensions.dart';
import '../../main.dart';
import '../AppColors.dart';

bool hasMatch(String? s, String p) {
  return (s == null) ? false : RegExp(p).hasMatch(s);
}

get getContext => navigatorKey.currentState?.overlay?.context;

void finish(BuildContext context, [Object? result]) {
  if (Navigator.canPop(context)) Navigator.pop(context, result);
}

/// Hide soft keyboard
void hideKeyboard(context) => FocusScope.of(context).requestFocus(FocusNode());

/// Custom scroll behaviour widget
class SBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

extension BooleanExtensions on bool? {
  /// Validate given bool is not null and returns given value if null.
  bool validate({bool value = false}) => this ?? value;
}

extension DoubleExtensions on double? {
  /// Validate given bool is not null and returns given value if null.
  double validate({double value = 0.0}) => this ?? value;
}

toast(String? value, {ToastGravity? gravity, length = Toast.LENGTH_SHORT, Color? bgColor, Color? textColor}) {
  Fluttertoast.showToast(
    msg: value.validate(),
    toastLength: length,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: bgColor,
    textColor: textColor,
    fontSize: 16.0,
  );
}

InputDecoration inputDecoration(BuildContext context, {String? label, Widget? prefixIcon, helperText}) {
  return InputDecoration(
      alignLabelWithHint: true,
      labelText: label ?? "Sample Text",
      labelStyle: secondaryTextStyle(),
      iconColor:textSecondaryColorGlobal ,
      helperText: helperText,
      helperStyle: secondaryTextStyle(size: 12));
}

Widget dotIndicator(list, i, {bool isPersonal = false}) {
  return SizedBox(
    height: 16,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        list.length,
        (ind) {
          return Container(
            height: 30,
            width: 10,
            margin: EdgeInsets.all(3.5),
            decoration: BoxDecoration(
                color: i == ind
                    ? appStore.isDarkMode == true
                        ? Colors.white
                        : grey2
                    : appStore.isDarkMode == true
                        ? Colors.black
                        : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(width: 1,color: grey2)),
          );
        },
      ),
    ),
  );
}
