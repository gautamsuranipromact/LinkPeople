import 'package:flutter/material.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';
import '../screens/ViewPeopleScreen.dart';

class NetworkItem extends StatefulWidget {
  final String? image;
  final String? name;
  final String? profession;
  final int? mutual;
  final bool? isFull;

  NetworkItem({
    Key? key,
    this.image,
    this.name,
    this.profession,
    this.mutual,
    this.isFull = false,
  });

  @override
  _NetworkItemState createState() => _NetworkItemState();
}

class _NetworkItemState extends State<NetworkItem> {
  bool? isConnect = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ViewPeopleScreen().launch(context);
      },
      child: Container(
        width: context.width() / 2,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), border: Border.all(color: context.dividerColor, width: 1.5)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Container(
                decoration: BoxDecoration(color: context.scaffoldBackgroundColor),
                height: 120,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        child: Container(
                            decoration: BoxDecoration(color: context.dividerColor, image: DecorationImage(fit: BoxFit.fill, image: AssetImage("Images/bg.png"))), height: 60, width: context.width()),
                      ),
                    ),
                    Positioned.fill(
                      top: 22,
                      bottom: 4,
                      child: Container(
                        decoration: BoxDecoration(color: context.dividerColor, shape: BoxShape.circle, image: DecorationImage(image: AssetImage(widget.image.toString()))),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(widget.name.toString(), style: boldTextStyle()),
                  SizedBox(height: 6),
                  Text(widget.profession.toString(), style: secondaryTextStyle(size: 14), maxLines: 2, textAlign: TextAlign.center),
                  SizedBox(height: 8),
                ],
              ),
            ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.link, color: grey2, size: 16),
                Text("7 mutual connections", style: secondaryTextStyle(size: 12), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ],
            ),
            GestureDetector(
              onTap: () {
                isConnect = true;
                setState(() {});
              },
              child: Container(
                width: context.width(),
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: EdgeInsets.symmetric( vertical: 6),
                decoration: BoxDecoration(border: Border.all(color: isConnect == false ? primaryColor : textSecondaryColorGlobal, width: 0.8), borderRadius: BorderRadius.circular(20)),
                child: isConnect == false
                    ? Text("Connect", style: primaryTextStyle(color: primaryColor))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check, size: 20, color: textSecondaryColorGlobal),
                          Text('pending', style: primaryTextStyle(color: textSecondaryColorGlobal)),
                        ],
                      ),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
