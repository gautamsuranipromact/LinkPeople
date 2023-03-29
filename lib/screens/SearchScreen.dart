import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import '../utils/AppDataProvider.dart';
import '../utils/Extensions/AppTextField.dart';
import '../utils/Extensions/text_styles.dart';
import 'QRCodeScreen.dart';

class SearchScreen extends StatefulWidget {
  final String? text;

  SearchScreen({this.text});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  List<String> list = ['#hiring', '#jobadvice', 'Covid', 'great resignation'];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    if (widget.text != null) controller.text = widget.text!;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.dividerColor,
      appBar: AppBar(
        backgroundColor: context.scaffoldBackgroundColor,
        leading: BackButton(color: textSecondaryColorGlobal),
        titleSpacing: 0,
        leadingWidth: 30,
        elevation: 1.5,
        title: AppTextField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          textFieldType: TextFieldType.OTHER,
          textStyle: primaryTextStyle(),
          cursorHeight: 20,
          cursorColor: Colors.black,
          decoration: outlineInputDecoration(context, label: "Search"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              QRCodeScreen().launch(context);
            },
            icon: Icon(MaterialCommunityIcons.qrcode_scan, color: textSecondaryColorGlobal, size: 22),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: context.scaffoldBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(8.0), child: Text('Try searching for', style: secondaryTextStyle())),
                  SizedBox(height: 8),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            controller.text = list[i];
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.search, size: 18, color: textSecondaryColorGlobal),
                                SizedBox(width: 8),
                                Expanded(child: Text(list[i], style: secondaryTextStyle())),
                                Icon(Feather.arrow_up_left, size: 18, color: textSecondaryColorGlobal),
                              ],
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              color: context.scaffoldBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                    child: Text("Today's news and views", style: primaryTextStyle()),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    primary: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: newsList.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(thickness: 1);
                    },
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(newsList[i].name.toString(), style: boldTextStyle()),
                                  SizedBox(height: 8),
                                  Text(newsList[i].subtext.toString(), style: secondaryTextStyle()),
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            Image.asset(newsList[i].img.toString(), height: 100, width: 100)
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
