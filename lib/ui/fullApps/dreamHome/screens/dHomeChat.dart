import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import '../helper/DHomeconstant.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/models/DHomeChatModel.dart';

import '../helper/DHomeColors.dart';
import '../helper/DHomeString.dart';

class DHomeChat extends StatefulWidget {
  final String? title, profile, imgurl, hash;

  const DHomeChat({
    Key? key,
    this.title,
    this.profile,
    this.imgurl,
    this.hash,
  }) : super(key: key);

  @override
  DHomeChatState createState() => DHomeChatState();
}

class DHomeChatState extends State<DHomeChat> {
  String gender = DHomeString.maleText;

  @override
  void initState() {
    super.initState();
  }

  Widget notificationView() {
    return Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: ListView.builder(
          itemCount: dHomeChatList.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .05,
            bottom: 10,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                ),
                child: dHomeChatList[index].messageType == "receiver"
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            index.isEven
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: OctoImage(
                                      image: CachedNetworkImageProvider(
                                          widget.imgurl!),
                                      placeholderBuilder:
                                          OctoPlaceholder.blurHash(
                                        widget.hash!,
                                      ),
                                      errorBuilder: OctoError.icon(
                                          color: DHomeColors.black),
                                      fit: BoxFit.scaleDown,
                                      height: 38,
                                      width: 38,
                                    ),
                                  )
                                : Container(),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * .4),
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  color: const Color(0xff5a5a68),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                dHomeChatList[index].messageContent!,
                                style: const TextStyle(
                                    fontSize: 12, color: DHomeColors.white),
                              ),
                            ),
                          ])
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                            index.isEven
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: OctoImage(
                                      image: const CachedNetworkImageProvider(
                                          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fchat_4.png?alt=media&token=6add2012-7058-4fbc-91e5-eaa57d3566ba"),
                                      placeholderBuilder:
                                          OctoPlaceholder.blurHash(
                                        "L4CGJkVBPByF00IB~qx]KjJDgNrV",
                                      ),
                                      errorBuilder: OctoError.icon(
                                          color: DHomeColors.black),
                                      fit: BoxFit.scaleDown,
                                      height: 38,
                                      width: 38,
                                    ),
                                  )
                                : Container(),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * .3),
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  color: DHomeColors.bgColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                dHomeChatList[index].messageContent!,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ]));
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return navigationPage() as Future<bool>;
      },
      child: Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.only(bottom: 20),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: SvgPicture.asset(
                        DHomeConstant.getSvgImagePath("chat.attached.svg"))),
                Expanded(
                    flex: 4,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: DHomeColors.bgColor),
                      child: TextFormField(
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          prefixIcon: SvgPicture.asset(
                            DHomeConstant.getSvgImagePath("chat.emoji.svg"),
                            fit: BoxFit.scaleDown,
                          ),
                          suffixIcon: SvgPicture.asset(
                              DHomeConstant.getSvgImagePath("chat.send.svg")),
                          border: InputBorder.none,
                          hintText: "Type Message",
                          hintStyle: const TextStyle(
                              fontSize: 12, color: Colors.black),
                          //border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    )),
              ],
            )),
        body: Stack(
          children: [
            AppBar(
                toolbarHeight: 133,
                backgroundColor: DHomeColors.bgColor,
                leadingWidth: 70,
                centerTitle: true,
                title: Text(
                  widget.title!,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    DHomeConstant.getSvgImagePath("back_arrow.svg"),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                flexibleSpace: Container(
                    padding: const EdgeInsets.only(top: 85, right: 20),
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ))),
            notificationView(),
          ],
        ),
      ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
