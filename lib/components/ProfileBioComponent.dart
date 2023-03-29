import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';
import 'package:styled_text/styled_text.dart';
import '../components/ProfileComponent.dart';
import '../utils/AppColors.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/decorations.dart';
class ProfileBio extends StatelessWidget {
  final String? name;

  ProfileBio(this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name ?? "Muskan Agarwal", style: boldTextStyle(size: 20)),
          Text("Android | Flutter Developer", style: primaryTextStyle()),
          SizedBox(height: 12),
          Text("Freelance,self-employed", style: primaryTextStyle(size: 14)),
          Text("Jodhpur, Rajasthan, India", style: secondaryTextStyle()),
          SizedBox(height: 12),
          Text("500+ connections", style: boldTextStyle(size: 14)),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
                        builder: (_) {
                          return Container(
                            padding: EdgeInsets.only(right: 16, left: 16, top: 20, bottom: 16),
                            decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: radiusCircular(16), topRight: radiusCircular(16))),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 5,
                                  width: 50,
                                  margin: EdgeInsets.only(bottom: 20),
                                  decoration: BoxDecoration(borderRadius: radius(), color: grey2),
                                ),
                                bottomSheetComponent(context, text: "Finding a new job", onTap: () {}, subtext: "Show recruit and other that you're open to work", isSubtext: true),
                                bottomSheetComponent(context, text: "Hiring", onTap: () {}, subtext: "Share that you're hiring and attract qualified candidate", isSubtext: true),
                                bottomSheetComponent(context, text: "Providing services", onTap: () {}, subtext: "Showcase service you offer so new clients can discover", isSubtext: true),
                              ],
                            ),
                          );
                        });
                  },
                  child: Container(
                    height: 34,
                    width: 140,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(22), color: primaryColor),
                    child: Text("Open to", style: boldTextStyle(color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: reactionColor),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Text("Add Section", style: primaryTextStyle(color: textSecondaryColorGlobal)),
                  height: 34,
                  width: 140,
                ),
              ),
              SizedBox(width: 8),
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(shape: BoxShape.circle, color: context.scaffoldBackgroundColor, border: Border.all(width: 0.8, color: textSecondaryColorGlobal)),
                child: Icon(Entypo.dots_three_horizontal, color: textSecondaryColorGlobal),
              ),
            ],
          ),
          SizedBox(height: 13),
          Container(
            width: context.width(),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(width: 1, color: context.dividerColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: StyledText(
                    textAlign: TextAlign.start,
                    text: "<blue>Show recruiters you’re open to work</blue> — you control who sees this\n<blue>Get Started</blue>",
                    tags: {
                      'blue': StyledTextTag(style: primaryTextStyle(color: primaryColor)),
                    },
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.clear, size: 14),
              ],
            ),
          )
        ],
      ),
    );
  }
}