import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'Extensions/Constants.dart';
import 'Extensions/decorations.dart';
import 'Extensions/text_styles.dart';

appButton(BuildContext context, String text, {onTap}) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Container(
      alignment: Alignment.center,
      height: 45,
      width: context.width(),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: boxDecorationWithShadowWidget(backgroundColor: primaryColor, borderRadius: radius(30)),
      child: Text(text, style: boldTextStyle(color: Colors.white)),
    ),
  );
}

appBarCommon(BuildContext context, title, onTap, {List<Widget>? action, bottom, centerWidget, leading, elevation}) {
  return AppBar(
    backgroundColor: context.scaffoldBackgroundColor,
    elevation: elevation ?? 0.5,
    iconTheme: IconThemeData(color: textSecondaryColorGlobal),
    leading: leading ??
        BackButton(
          color: textSecondaryColorGlobal,
          onPressed: () {
            onTap();
          },
        ),
    titleSpacing: 0,
    titleTextStyle: boldTextStyle(size: 18),
    title: title != null && title.toString().isNotEmpty ? Text(title, style: boldTextStyle()) : centerWidget,
    actions: action,
    bottom: bottom,
  );
}

InputDecoration outlineInputDecoration(BuildContext context, {String? label, prefixIcon}) {
  return InputDecoration(
    hintText: label,
    prefix: prefixIcon,
    contentPadding: EdgeInsets.all(8),
    labelStyle: primaryTextStyle(color: textSecondaryColorGlobal),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(defaultRadius), borderSide: BorderSide(color: Colors.transparent)),
    focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(defaultRadius), borderSide: BorderSide(color: context.theme.colorScheme.error)),
    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(defaultRadius), borderSide: BorderSide(color: Colors.transparent)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(defaultRadius), borderSide: BorderSide(color: Colors.transparent)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(defaultRadius), borderSide: BorderSide(color: Colors.transparent)),
    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(defaultRadius), borderSide: BorderSide(color: context.theme.colorScheme.error)),
  );
}

component(BuildContext context, text, subtext, {color, size, subSize, textColor, bool isIcon = true}) {
  return Container(
    decoration: BoxDecoration(border: Border.all(width: 0.03), color: color ?? context.scaffoldBackgroundColor),
    width: context.width(),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(text, style: boldTextStyle(size: size ?? 14)),
              Text(subtext, style: primaryTextStyle(size: subSize ?? 14, color: textColor ?? textSecondaryColorGlobal)),
            ],
          ),
        ),
        Visibility(visible: isIcon, child: Icon(Icons.arrow_forward, color: textSecondaryColorGlobal, size: 20))
      ],
    ),
  );
}

void showYearPicker(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Container(
          child: CupertinoDatePicker(
            minimumYear: DateTime.now().year,
            minuteInterval: 1,
            backgroundColor: context.cardColor,
            initialDateTime: DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime dateTime) {
              print("dateTime: $dateTime");
            },
          ),
        );
      });
}
