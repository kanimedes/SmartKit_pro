import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Model/BreakingNews.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Model/Comment.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Model/News.dart';
import 'Helper/Color.dart';
import 'Helper/Session.dart';
import 'Helper/String.dart';
import 'Image_Preview.dart';
import 'NewsTag.dart';

class NewsDetails extends StatefulWidget {
  final News? model;
  final int? index;
  Function? updateParent;
  final String? id;
  final bool? isFav;
  final bool? isDetails;
  final List<News>? news;
  final BreakingNewsModel? model1;
  final List<BreakingNewsModel>? news1;

  NewsDetails(
      {Key? key,
      this.model,
      this.index,
      this.updateParent,
      this.id,
      this.isFav,
      this.isDetails,
      this.news,
      this.model1,
      this.news1})
      : super(key: key);

  @override
  NewsDetailsState createState() => NewsDetailsState();
}

class NewsDetailsState extends State<NewsDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _curSlider = 0;
  final PageController pageController = PageController();
  bool isScroll = false;

  @override
  void initState() {
    super.initState();
  }

  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).colorScheme.fontColor),
      ),
      backgroundColor: isDark! ? colors.tempdarkColor : colors.bgColor,
      elevation: 1.0,
    ));
  }

  //page slider news list data
  Widget _slider1() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height,
        width: width,
        child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) async {
              setState(() {
                _curSlider = index;
              });
            },
            itemCount: widget.news1!.isEmpty ? 1 : widget.news1!.length + 1,
            itemBuilder: (context, index) {
              return index == 0
                  ? NewsSubDetails(
                      model1: widget.model1,
                      index: widget.index,
                      updateParent: widget.updateParent,
                      id: widget.id,
                      isDetails: widget.isDetails,
                    )
                  : NewsSubDetails(
                      model1: widget.news1![index - 1],
                      index: index - 1,
                      updateParent: widget.updateParent,
                      id: widget.news1![index - 1].id,
                      isDetails: widget.isDetails,
                    );
            }));
  }

  //page slider news list data
  Widget _slider() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height,
        width: width,
        child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) async {
              setState(() {
                _curSlider = index;
              });
            },
            itemCount: widget.news!.isEmpty ? 1 : widget.news!.length + 1,
            itemBuilder: (context, index) {
              return index == 0
                  ? NewsSubDetails(
                      model: widget.model,
                      index: widget.index,
                      updateParent: widget.updateParent,
                      id: widget.id,
                      isDetails: widget.isDetails,
                    )
                  : NewsSubDetails(
                      model: widget.news![index - 1],
                      index: index - 1,
                      updateParent: widget.updateParent,
                      id: widget.news![index - 1].id,
                      isDetails: widget.isDetails,
                    );
            }));
  }

  @override
  void dispose() {
    !isDark!
        ? SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark)
        : null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
        key: _scaffoldKey, body: !widget.isDetails! ? _slider1() : _slider());
  }
}

class NewsSubDetails extends StatefulWidget {
  final News? model;
  final int? index;
  final Function? updateParent;
  final String? id;
  final bool? isDetails;
  final BreakingNewsModel? model1;

  const NewsSubDetails(
      {Key? key,
      this.model,
      this.index,
      this.updateParent,
      this.id,
      this.isDetails,
      this.model1})
      : super(key: key);

  @override
  NewsSubDetailsState createState() => NewsSubDetailsState();
}

class NewsSubDetailsState extends State<NewsSubDetails> {
  List<String> allImage = [];
  String? profile;
  final bool _isNetworkAvail = true;
  int _fontValue = 15;
  String comTotal = "";
  bool comBtnEnabled = false;
  bool replyComEnabled = false;
  final TextEditingController _commentC = new TextEditingController();
  final TextEditingController _replyComC = new TextEditingController();
  TextEditingController reportC = new TextEditingController();
  final _pageController = PageController();
  int _curSlider = 0;
  bool comEnabled = false;
  bool isReply = false;
  int? replyComIndex;
  String? lanCode;
  ScrollController controller = new ScrollController();
  ScrollController controller1 = new ScrollController();

  @override
  void initState() {
    allImage.clear();
    if (widget.isDetails!) {
      allImage.add(widget.model!.image!);
      if (widget.model!.imageDataList!.isNotEmpty) {
        for (int i = 0; i < widget.model!.imageDataList!.length; i++) {
          allImage.add(widget.model!.imageDataList![i].otherImage!);
        }
      }
    } else {
      allImage.add(widget.model1!.image!);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  //set snackbar msg
  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).colorScheme.fontColor),
      ),
      backgroundColor: isDark! ? colors.tempdarkColor : colors.bgColor,
      elevation: 1.0,
    ));
  }

  imageView() {
    return SizedBox(
        height: deviceHeight! * 0.42,
        width: double.infinity,
        child: widget.isDetails!
            ? PageView.builder(
                itemCount: allImage.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _curSlider = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Image.asset(
                      allImage[index],
                      fit: BoxFit.fill,
                      height: deviceHeight! * 0.42,
                      width: double.infinity,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => ImagePreview(
                                index: index,
                                imgList: allImage,
                                isNetworkAvail: _isNetworkAvail),
                          ));
                    },
                  );
                })
            : Image.asset(
                widget.isDetails!
                    ? widget.model!.image!
                    : widget.model1!.image!,
                fit: BoxFit.fill,
                height: deviceHeight! * 0.42,
                width: double.infinity));
  }

  imageSliderDot() {
    return widget.isDetails!
        ? allImage.length <= 1
            ? Container()
            : Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: EdgeInsets.only(top: deviceHeight! / 2.6 - 23),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: map<Widget>(
                        allImage,
                        (index, url) {
                          return Container(
                              width: _curSlider == index ? 10.0 : 8.0,
                              height: _curSlider == index ? 10.0 : 8.0,
                              margin: EdgeInsets.symmetric(horizontal: 1.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _curSlider == index
                                    ? colors.bgColor
                                    : colors.bgColor.withOpacity((0.5)),
                              ));
                        },
                      ),
                    )))
        : Container();
  }

  backBtn() {
    return Positioned.directional(
        textDirection: Directionality.of(context),
        top: 30.0,
        start: 10.0,
        child: InkWell(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 35,
                    width: 35,
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SvgPicture.asset(
                      "assets/images/fullApps/modernNews/svg/back_icon.svg",
                      semanticsLabel: 'back icon',
                    ),
                  ))),
          onTap: () {
            Navigator.pop(context);
          },
        ));
  }

  videoBtn() {
    return widget.isDetails!
        ? widget.model!.contentType == "video_upload" ||
                widget.model!.contentType == "video_youtube" ||
                widget.model!.contentType == "video_other"
            ? Positioned.directional(
                textDirection: Directionality.of(context),
                top: 30.0,
                end: 10.0,
                child: InkWell(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            height: 35,
                            width: 35,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: SvgPicture.asset(
                              "assets/images/fullApps/modernNews/svg/video_icon.svg",
                              semanticsLabel: 'video icon',
                            ),
                          ))),
                  onTap: () {},
                ))
            : Container()
        : Container();
  }

  changeFontSizeSheet() {
    showModalBottomSheet<dynamic>(
        context: context,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setStater) {
            return Container(
                padding: EdgeInsetsDirectional.only(
                    bottom: 20.0, top: 5.0, start: 20.0, end: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              "assets/images/fullApps/modernNews/svg/textsize_icon.svg",
                              semanticsLabel: 'textsize',
                              height: 23.0,
                              width: 23.0,
                              color: Theme.of(context).colorScheme.darkColor,
                            ),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.only(start: 15.0),
                                child: Text(
                                  getTranslated(context, 'txtSize_lbl')!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .fontColor),
                                )),
                          ],
                        )),
                    SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.red[700],
                          inactiveTrackColor: Colors.red[100],
                          trackShape: RoundedRectSliderTrackShape(),
                          trackHeight: 4.0,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 12.0),
                          thumbColor: Colors.redAccent,
                          overlayColor: Colors.red.withAlpha(32),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 28.0),
                          tickMarkShape: RoundSliderTickMarkShape(),
                          activeTickMarkColor: Colors.red[700],
                          inactiveTickMarkColor: Colors.red[100],
                          valueIndicatorShape:
                              PaddleSliderValueIndicatorShape(),
                          valueIndicatorColor: Colors.redAccent,
                          valueIndicatorTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: Slider(
                          label: '$_fontValue',
                          value: _fontValue.toDouble(),
                          activeColor: colors.primary,
                          min: 15,
                          max: 40,
                          divisions: 10,
                          onChanged: (value) {
                            setStater(() {
                              setState(() {
                                _fontValue = value.round();
                                setPrefrence(font_value, _fontValue.toString());
                              });
                            });
                          },
                        )),
                  ],
                ));
          });
        });
  }

  allRowBtn() {
    return widget.isDetails!
        ? Row(
            children: [
              InkWell(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/images/fullApps/modernNews/svg/comment_icon.svg",
                      semanticsLabel: 'comment',
                      height: 16.0,
                      width: 16.0,
                      color: Theme.of(context).colorScheme.darkColor,
                    ),
                    Padding(
                        padding: EdgeInsetsDirectional.only(top: 4.0),
                        child: Text(
                          getTranslated(context, 'com_lbl')!,
                          style: Theme.of(this.context)
                              .textTheme
                              .caption
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .fontColor
                                      .withOpacity(0.8),
                                  fontSize: 9.0),
                        ))
                  ],
                ),
                onTap: () {
                  setState(() {
                    comEnabled = true;
                  });
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 9.0),
                child: InkWell(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/images/fullApps/modernNews/svg/sharee_icon.svg",
                        semanticsLabel: 'share',
                        height: 16.0,
                        width: 16.0,
                        color: Theme.of(context).colorScheme.darkColor,
                      ),
                      Padding(
                          padding: EdgeInsetsDirectional.only(top: 4.0),
                          child: Text(
                            getTranslated(context, 'share_lbl')!,
                            style: Theme.of(this.context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .fontColor
                                        .withOpacity(0.8),
                                    fontSize: 9.0),
                          ))
                    ],
                  ),
                  onTap: () async {},
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 9.0),
                child: InkWell(
                  child: Column(
                    children: [
                      Icon(
                        widget.model!.status == "1"
                            ? Icons.bookmark_outlined
                            : Icons.bookmark_border,
                        size: 16.0,
                        color: Theme.of(context).colorScheme.darkColor,
                      ),
                      Padding(
                          padding: EdgeInsetsDirectional.only(top: 4.0),
                          child: Text(
                            getTranslated(context, 'save_lbl')!,
                            style: Theme.of(this.context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .fontColor
                                        .withOpacity(0.8),
                                    fontSize: 9.0),
                          ))
                    ],
                  ),
                  onTap: () async {},
                ),
              ),
              Padding(
                  padding: EdgeInsetsDirectional.only(start: 9.0),
                  child: InkWell(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/images/fullApps/modernNews/svg/textsize_icon.svg",
                          semanticsLabel: 'textsize',
                          height: 16.0,
                          width: 16.0,
                          color: Theme.of(context).colorScheme.darkColor,
                        ),
                        Padding(
                            padding: EdgeInsetsDirectional.only(top: 4.0),
                            child: Text(
                              getTranslated(context, 'txtSize_lbl')!,
                              style: Theme.of(this.context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .fontColor
                                          .withOpacity(0.8),
                                      fontSize: 9.0),
                            ))
                      ],
                    ),
                    onTap: () {
                      changeFontSizeSheet();
                    },
                  )),
              Padding(
                  padding: EdgeInsetsDirectional.only(start: 9.0),
                  child: InkWell(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/images/fullApps/modernNews/svg/speakloud_icon.svg",
                          semanticsLabel: 'speakloud',
                          height: 16.0,
                          width: 16.0,
                          color: Theme.of(context).colorScheme.darkColor,
                        ),
                        Padding(
                            padding: EdgeInsetsDirectional.only(top: 4.0),
                            child: Text(
                              getTranslated(context, 'speakLoud_lbl')!,
                              style: Theme.of(this.context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .fontColor
                                          .withOpacity(0.8),
                                      fontSize: 9.0),
                            ))
                      ],
                    ),
                    onTap: () {},
                  )),
            ],
          )
        : Container();
  }

  dateView() {
    return widget.isDetails!
        ? !isReply
            ? !comEnabled
                ? Padding(
                    padding: EdgeInsetsDirectional.only(top: 8.0),
                    child: Text(
                      widget.model!.date!,
                      style: Theme.of(this.context).textTheme.caption?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .fontColor
                              .withOpacity(0.8),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                : Container()
            : Container()
        : Container();
  }

  tagView() {
    List<String> tagList = [];
    if (widget.isDetails!) {
      if (widget.model!.tagName! != "") {
        final tagName = widget.model!.tagName!;
        tagList = tagName.split(',');
      }
    }
    List<String> tagId = [];
    if (widget.isDetails!) {
      if (widget.model!.tagId! != "") {
        tagId = widget.model!.tagId!.split(",");
      }
    }
    return widget.isDetails!
        ? !isReply
            ? !comEnabled
                ? widget.model!.tagName! != ""
                    ? Padding(
                        padding: EdgeInsetsDirectional.only(top: 8.0),
                        child: SizedBox(
                            height: 20.0,
                            child: Row(
                              children: List.generate(tagList.length, (index) {
                                return Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        start: index == 0 ? 0 : 7),
                                    child: InkWell(
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                          child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 30, sigmaY: 30),
                                              child: Container(
                                                  height: 20.0,
                                                  width: 65,
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsetsDirectional
                                                      .only(
                                                          start: 3.0,
                                                          end: 3.0,
                                                          top: 2.5,
                                                          bottom: 2.5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.0),
                                                    color: colors.primary
                                                        .withOpacity(0.03),
                                                  ),
                                                  child: Text(
                                                    tagList[index],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2
                                                        ?.copyWith(
                                                          color: colors.primary,
                                                          fontSize: 11,
                                                        ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                  )))),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => NewsTag(
                                                tadId: tagId[index],
                                                tagName: tagList[index],
                                              ),
                                            ));
                                      },
                                    ));
                              }),
                            )))
                    : Container()
                : Container()
            : Container()
        : Container();
  }

  titleView() {
    return !isReply
        ? !comEnabled
            ? Padding(
                padding: EdgeInsetsDirectional.only(top: 6.0),
                child: Text(
                  widget.isDetails!
                      ? widget.model!.title!
                      : widget.model1!.title!,
                  style: Theme.of(this.context).textTheme.subtitle1?.copyWith(
                      color: Theme.of(context).colorScheme.fontColor,
                      fontWeight: FontWeight.w600),
                ),
              )
            : Container()
        : Container();
  }

  descView() {
    return !isReply
        ? !comEnabled
            ? Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  widget.isDetails!
                      ? widget.model!.desc!
                      : widget.model1!.desc!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: _fontValue.toDouble()),
                ))
            : Container()
        : Container();
  }

  allDetails() {
    return Padding(
        padding: EdgeInsets.only(top: deviceHeight! / 2.6),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding:
                  EdgeInsetsDirectional.only(top: 20.0, start: 20.0, end: 20.0),
              width: deviceWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: isDark! ? colors.darkModeColor : colors.bgColor),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    allRowBtn(),
                    dateView(),
                    tagView(),
                    titleView(),
                    descView(),
                    widget.isDetails!
                        ? !isReply
                            ? comEnabled
                                ? commentView()
                                : Container()
                            : Container()
                        : Container(),
                    widget.isDetails!
                        ? isReply
                            ? replyCommentView()
                            : Container()
                        : Container(),
                    // viewRelatedContent()
                  ]),
            )));
  }

  likeBtn() {
    return widget.isDetails!
        ? Positioned.directional(
            textDirection: Directionality.of(context),
            top: deviceHeight! / 2.84,
            start: deviceWidth! * 0.73,
            child: Column(children: [
              InkWell(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(52.0),
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          height: 52,
                          width: 52,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: colors.primary.withOpacity(0.7),
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            widget.model!.like == "1"
                                ? "assets/images/fullApps/modernNews/svg/likefilled_button.svg"
                                : "assets/images/fullApps/modernNews/svg/Like_icon.svg",
                            semanticsLabel: 'like icon',
                            color: colors.tempboxColor,
                          ),
                        ))),
                onTap: () async {},
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: 6.0),
                child: Text(
                  widget.model!.totalLikes != "0"
                      ? widget.model!.totalLikes! +
                          "\t" +
                          getTranslated(context, 'like_lbl')!
                      : "",
                  style: Theme.of(this.context)
                      .textTheme
                      .caption
                      ?.copyWith(color: colors.primary, fontSize: 9.0),
                ),
              )
            ]))
        : Container();
  }

/*  viewRelatedContent() {
    return widget.isDetails!
        ? !isReply
            ? !comEnabled
                ? newsList.length != 0
                    ? Padding(
                        padding: EdgeInsetsDirectional.only(
                          top: 15.0,
                        ),
                        child: Column(children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(getTranslated(context, 'related_news')!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(color: Theme.of(context).colorScheme.fontColor, fontWeight: FontWeight.w600))),
                          SizedBox(
                              height: 250,
                              child: ListView.builder(
                                itemCount: newsList.length,
                                scrollDirection: Axis.horizontal,
                                controller: controller,
                                itemBuilder: (context, index) {
                                  return newsItem(index);
                                },
                              ))
                        ]))
                    : Container()
                : Container()
            : Container()
        : Container();
  }

  newsItem(int index) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 15.0, start: index == 0 ? 0 : 6.0, bottom: 15.0),
      child: InkWell(
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(newsList[index].image!, height: 250.0, width: 193.0, fit: BoxFit.cover)),
            Positioned.directional(
                textDirection: Directionality.of(context),
                bottom: 7.0,
                start: 7,
                end: 7,
                height: 99,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: colors.tempboxColor.withOpacity(0.85),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                newsList[index].date!,
                                style: Theme.of(context).textTheme.caption?.copyWith(color: colors.tempdarkColor, fontSize: 10.0),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    newsList[index].title!,
                                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                        color: colors.tempdarkColor.withOpacity(0.9), fontWeight: FontWeight.w600, fontSize: 12.5, height: 1.0),
                                    maxLines: 3,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                            ],
                          ),
                        )))),
          ],
        ),
        onTap: () {
          News model = newsList[index];
          List<News> recList = [];
          recList.addAll(newsList);
          recList.removeAt(index);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => NewsDetails(
                    model: model,
                    index: index,
                    updateParent: updateHomePage,
                    id: model.id,
                    isFav: false,
                    isDetails: true,
                    news: recList,
                    //updateHome: updateHome,
                  )));
        },
      ),
    );
  }*/

  updateHomePage() {
    setState(() {
      bookmarkList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: deviceWidth,
        child: SingleChildScrollView(
            child: Stack(children: <Widget>[
          imageView(),
          imageSliderDot(),
          backBtn(),
          videoBtn(),
          allDetails(),
          likeBtn(),
        ])));
  }

  allCommentView() {
    return Row(
      children: [
        commentList.isNotEmpty
            ? Text(
                getTranslated(context, 'all_lbl')! +
                    "\t" +
                    commentList.length.toString() +
                    "\t" +
                    getTranslated(context, 'coms_lbl')!,
                style: Theme.of(this.context).textTheme.caption?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .fontColor
                        .withOpacity(0.6),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600),
              )
            : Container(),
        Spacer(),
        Align(
            alignment: Alignment.topRight,
            child: InkWell(
              child: SvgPicture.asset(
                "assets/images/fullApps/modernNews/svg/close_icon.svg",
                semanticsLabel: 'close icon',
                height: 23,
                width: 23,
                color: Theme.of(context).colorScheme.darkColor,
              ),
              onTap: () {
                setState(() {
                  comEnabled = false;
                });
              },
            ))
      ],
    );
  }

  profileWithSendCom() {
    return Padding(
        padding: EdgeInsetsDirectional.only(top: 5.0),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: profile != null && profile != ""
                    ? CircleAvatar(
                        backgroundImage: AssetImage(profile!),
                      )
                    : SizedBox(
                        height: 35,
                        width: 35,
                        child: Icon(
                          Icons.account_circle,
                          color: colors.primary,
                          size: 35,
                        ),
                      )),
            Expanded(
                flex: 7,
                child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 18.0),
                    child: TextField(
                      controller: _commentC,
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .fontColor
                              .withOpacity(0.7)),
                      onChanged: (String val) {
                        if (_commentC.text.trim().isNotEmpty) {
                          setState(() {
                            comBtnEnabled = true;
                          });
                        } else {
                          setState(() {
                            comBtnEnabled = false;
                          });
                        }
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 10.0, bottom: 2.0),
                          isDense: true,
                          suffixIconConstraints: BoxConstraints(
                            maxHeight: 35,
                            maxWidth: 30,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .fontColor
                                    .withOpacity(0.5),
                                width: 1.5),
                          ),
                          hintText: getTranslated(context, 'share_thoght_lbl')!,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .fontColor
                                      .withOpacity(0.7)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.send,
                              color: comBtnEnabled
                                  ? Theme.of(context)
                                      .colorScheme
                                      .fontColor
                                      .withOpacity(0.8)
                                  : Colors.transparent,
                              size: 20.0,
                            ),
                            onPressed: () async {},
                          )),
                    )))
          ],
        ));
  }

  allComListView() {
    return Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .fontColor
                          .withOpacity(0.5),
                    ),
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 20.0),
                controller: controller1,
                physics: NeverScrollableScrollPhysics(),
                itemCount: commentList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          commentList[index].profile != null ||
                                  commentList[index].profile != ""
                              ? SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage(commentList[index].profile!),
                                    radius: 32,
                                  ))
                              : SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: Icon(
                                    Icons.account_circle,
                                    color: colors.primary,
                                    size: 35,
                                  ),
                                ),
                          Expanded(
                              child: Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(start: 15.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(commentList[index].name!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  ?.copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .fontColor
                                                          .withOpacity(0.7),
                                                      fontSize: 13)),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: 10.0),
                                              child: Icon(
                                                Icons.circle,
                                                size: 4.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .fontColor
                                                    .withOpacity(0.7),
                                              )),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: 10.0),
                                              child: Text(
                                                commentList[index].date!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .fontColor
                                                            .withOpacity(0.7),
                                                        fontSize: 10),
                                              )),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          commentList[index].message!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .darkColor,
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          children: [
                                            InkWell(
                                                child: SvgPicture.asset(
                                                  "assets/images/fullApps/modernNews/svg/likecomment_icon.svg",
                                                  semanticsLabel: 'likecomment',
                                                  height: 13.0,
                                                  width: 13.0,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .darkColor,
                                                ),
                                                onTap: () {}),
                                            commentList[index].totalLikes! !=
                                                    "0"
                                                ? Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .only(start: 4.0),
                                                    child: Text(
                                                      commentList[index]
                                                          .totalLikes!,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2
                                                          ?.copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .darkColor),
                                                    ),
                                                  )
                                                : Container(
                                                    width: 12,
                                                  ),
                                            Padding(
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                        start: 35),
                                                child: InkWell(
                                                  child: SvgPicture.asset(
                                                    "assets/images/fullApps/modernNews/svg/dislikecomment_icon.svg",
                                                    semanticsLabel:
                                                        'dislikecomment',
                                                    height: 13.0,
                                                    width: 13.0,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .darkColor,
                                                  ),
                                                  onTap: () {},
                                                )),
                                            commentList[index].totalDislikes! !=
                                                    "0"
                                                ? Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .only(start: 4.0),
                                                    child: Text(
                                                      commentList[index]
                                                          .totalDislikes!,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2
                                                          ?.copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .darkColor),
                                                    ),
                                                  )
                                                : Container(
                                                    width: 12,
                                                  ),
                                            Padding(
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                        start: 35),
                                                child: InkWell(
                                                  child: SvgPicture.asset(
                                                    "assets/images/fullApps/modernNews/svg/replycomment_icon.svg",
                                                    semanticsLabel:
                                                        'replycomment',
                                                    height: 13.0,
                                                    width: 13.0,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .darkColor,
                                                  ),
                                                )),
                                            commentList[index]
                                                    .replyComList!
                                                    .isNotEmpty
                                                ? Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .only(start: 5.0),
                                                    child: Text(
                                                      commentList[index]
                                                          .replyComList!
                                                          .length
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2
                                                          ?.copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .darkColor),
                                                    ),
                                                  )
                                                : Container(),
                                            Spacer(),
                                            InkWell(
                                              child: Icon(
                                                Icons.more_vert_outlined,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .darkColor,
                                                size: 17,
                                              ),
                                              onTap: () {},
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 10.0),
                                          child: InkWell(
                                            child: Text(
                                              commentList[index]
                                                      .replyComList!
                                                      .isNotEmpty
                                                  ? commentList[index]
                                                          .replyComList!
                                                          .length
                                                          .toString() +
                                                      "\t" +
                                                      getTranslated(
                                                          context, 'reply_lbl')!
                                                  : "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  ?.copyWith(
                                                      color: colors.primary,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                isReply = true;
                                                replyComIndex = index;
                                              });
                                            },
                                          )),
                                    ],
                                  ))),
                        ]),
                    onTap: () {
                      setState(() {
                        isReply = true;
                        replyComIndex = index;
                      });
                    },
                  );
                })));
  }

  commentView() {
    return Padding(
        padding: EdgeInsetsDirectional.only(top: 10.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [allCommentView(), profileWithSendCom(), allComListView()],
        ));
  }

/*  commentView() {
    return Column(children: [

      Align(
          alignment: Alignment.topRight,
          child: InkWell(
            child: SvgPicture.asset(
              "assets/images/fullApps/modernNews/svg/close_icon.svg",
              semanticsLabel: 'close icon',
              height: 23,
              width: 23,
              color: Theme.of(context).colorScheme.darkColor,
            ),
            onTap: () {
              setState(() {
                comEnabled = false;
              });
            },
          )),
      Container(
          padding: EdgeInsetsDirectional.only(top: kToolbarHeight),
          child: Text(getTranslated(context, 'com_disable')!))
    ]);
  }*/

  allReplyComView() {
    return Row(
      children: [
        Text(
          getTranslated(context, 'all_lbl')! +
              "\t" +
              commentList[replyComIndex!].replyComList!.length.toString() +
              "\t" +
              getTranslated(context, 'reply_lbl')!,
          style: Theme.of(this.context).textTheme.caption?.copyWith(
              color: Theme.of(context).colorScheme.fontColor.withOpacity(0.6),
              fontSize: 12.0,
              fontWeight: FontWeight.w600),
        ),
        Spacer(),
        Align(
            alignment: Alignment.topRight,
            child: InkWell(
              child: SvgPicture.asset(
                "assets/images/fullApps/modernNews/svg/close_icon.svg",
                semanticsLabel: 'close icon',
                height: 23,
                width: 23,
                color: Theme.of(context).colorScheme.darkColor,
              ),
              onTap: () {
                setState(() {
                  isReply = false;
                });
              },
            ))
      ],
    );
  }

  replyComProfileWithCom() {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              commentList[replyComIndex!].profile != null ||
                      commentList[replyComIndex!].profile != ""
                  ? SizedBox(
                      height: 40,
                      width: 40,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage(commentList[replyComIndex!].profile!),
                        radius: 32,
                      ))
                  : SizedBox(
                      height: 35,
                      width: 35,
                      child: Icon(
                        Icons.account_circle,
                        color: colors.primary,
                        size: 35,
                      ),
                    ),
              Expanded(
                  child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(commentList[replyComIndex!].name!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .fontColor
                                              .withOpacity(0.7),
                                          fontSize: 13)),
                              Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(start: 10.0),
                                  child: Icon(
                                    Icons.circle,
                                    size: 4.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .fontColor
                                        .withOpacity(0.7),
                                  )),
                              Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(start: 10.0),
                                  child: Text(
                                    commentList[replyComIndex!].date!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .fontColor
                                                .withOpacity(0.7),
                                            fontSize: 10),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              commentList[replyComIndex!].message!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .fontColor,
                                      fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Row(
                              children: [
                                InkWell(
                                  child: SvgPicture.asset(
                                    "assets/images/fullApps/modernNews/svg/likecomment_icon.svg",
                                    semanticsLabel: 'likecomment',
                                    height: 13.0,
                                    width: 13.0,
                                    color:
                                        Theme.of(context).colorScheme.darkColor,
                                  ),
                                  onTap: () {},
                                ),
                                commentList[replyComIndex!].totalLikes! != "0"
                                    ? Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 4.0),
                                        child: Text(
                                          commentList[replyComIndex!]
                                              .totalLikes!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .darkColor,
                                              ),
                                        ),
                                      )
                                    : Container(
                                        width: 12,
                                      ),
                                Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 35),
                                    child: InkWell(
                                      child: SvgPicture.asset(
                                        "assets/images/fullApps/modernNews/svg/dislikecomment_icon.svg",
                                        semanticsLabel: 'dislikecomment',
                                        height: 13.0,
                                        width: 13.0,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .darkColor,
                                      ),
                                      onTap: () {},
                                    )),
                                commentList[replyComIndex!].totalDislikes! !=
                                        "0"
                                    ? Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 4.0),
                                        child: Text(
                                          commentList[replyComIndex!]
                                              .totalDislikes!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .darkColor,
                                              ),
                                        ),
                                      )
                                    : Container(
                                        width: 12,
                                      ),
                                Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 35),
                                    child: InkWell(
                                      child: SvgPicture.asset(
                                        "assets/images/fullApps/modernNews/svg/replycomment_icon.svg",
                                        semanticsLabel: 'replycomment',
                                        height: 13.0,
                                        width: 13.0,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .darkColor,
                                      ),
                                    )),
                                commentList[replyComIndex!]
                                        .replyComList!
                                        .isNotEmpty
                                    ? Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 5.0),
                                        child: Text(
                                          commentList[replyComIndex!]
                                              .replyComList!
                                              .length
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .darkColor,
                                              ),
                                        ),
                                      )
                                    : Container(),
                                Spacer(),
                                InkWell(
                                  child: Icon(
                                    Icons.more_vert_outlined,
                                    color:
                                        Theme.of(context).colorScheme.darkColor,
                                    size: 17,
                                  ),
                                  onTap: () {},
                                )
                              ],
                            ),
                          ),
                        ],
                      ))),
            ]));
  }

  replyComSendReplyView() {
    return Padding(
        padding: EdgeInsetsDirectional.only(top: 10.0),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: profile != null && profile != ""
                    ? CircleAvatar(
                        backgroundImage: AssetImage(profile!),
                      )
                    : SizedBox(
                        height: 35,
                        width: 35,
                        child: Icon(
                          Icons.account_circle,
                          color: colors.primary,
                          size: 35,
                        ),
                      )),
            Expanded(
                flex: 7,
                child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 18.0),
                    child: TextField(
                      controller: _replyComC,
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .fontColor
                              .withOpacity(0.7)),
                      onChanged: (String val) {
                        if (_replyComC.text.trim().isNotEmpty) {
                          setState(() {
                            replyComEnabled = true;
                          });
                        } else {
                          setState(() {
                            replyComEnabled = false;
                          });
                        }
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 10.0, bottom: 2.0),
                          isDense: true,
                          suffixIconConstraints: BoxConstraints(
                            maxHeight: 35,
                            maxWidth: 30,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .fontColor
                                    .withOpacity(0.5),
                                width: 1.5),
                          ),
                          hintText: getTranslated(context, 'public_reply')!,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .fontColor
                                      .withOpacity(0.7)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.send,
                              color: replyComEnabled
                                  ? Theme.of(context)
                                      .colorScheme
                                      .fontColor
                                      .withOpacity(0.8)
                                  : Colors.transparent,
                              size: 20.0,
                            ),
                            onPressed: () async {},
                          )),
                    )))
          ],
        ));
  }

  replyAllComListView() {
    return Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .fontColor
                          .withOpacity(0.5),
                    ),
                shrinkWrap: true,
                reverse: true,
                padding: EdgeInsets.only(top: 20.0),
                physics: NeverScrollableScrollPhysics(),
                itemCount: commentList[replyComIndex!].replyComList!.length,
                itemBuilder: (context, index) {
                  return Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        commentList[replyComIndex!]
                                        .replyComList![index]
                                        .profile !=
                                    null ||
                                commentList[replyComIndex!]
                                        .replyComList![index]
                                        .profile !=
                                    ""
                            ? SizedBox(
                                height: 40,
                                width: 40,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      commentList[replyComIndex!]
                                          .replyComList![index]
                                          .profile!),
                                  radius: 32,
                                ))
                            : SizedBox(
                                height: 35,
                                width: 35,
                                child: Icon(
                                  Icons.account_circle,
                                  color: colors.primary,
                                  size: 35,
                                ),
                              ),
                        Expanded(
                            child: Padding(
                                padding:
                                    EdgeInsetsDirectional.only(start: 15.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            commentList[replyComIndex!]
                                                .replyComList![index]
                                                .name!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .fontColor
                                                        .withOpacity(0.7),
                                                    fontSize: 13)),
                                        Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: 10.0),
                                            child: Icon(
                                              Icons.circle,
                                              size: 4.0,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .fontColor
                                                  .withOpacity(0.7),
                                            )),
                                        Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: 10.0),
                                            child: Text(
                                              commentList[replyComIndex!]
                                                  .replyComList![index]
                                                  .date!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  ?.copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .fontColor
                                                          .withOpacity(0.7),
                                                      fontSize: 10),
                                            )),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        commentList[replyComIndex!]
                                            .replyComList![index]
                                            .message!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .fontColor,
                                                fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            child: SvgPicture.asset(
                                              "assets/images/fullApps/modernNews/svg/likecomment_icon.svg",
                                              semanticsLabel: 'likecomment',
                                              height: 13.0,
                                              width: 13.0,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .darkColor,
                                            ),
                                            onTap: () {},
                                          ),
                                          commentList[replyComIndex!]
                                                      .replyComList![index]
                                                      .totalLikes! !=
                                                  "0"
                                              ? Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .only(start: 4.0),
                                                  child: Text(
                                                    commentList[replyComIndex!]
                                                        .replyComList![index]
                                                        .totalLikes!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle2
                                                        ?.copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .darkColor,
                                                        ),
                                                  ),
                                                )
                                              : Container(
                                                  width: 12,
                                                ),
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: 35),
                                              child: InkWell(
                                                child: SvgPicture.asset(
                                                  "assets/images/fullApps/modernNews/svg/dislikecomment_icon.svg",
                                                  semanticsLabel:
                                                      'dislikecomment',
                                                  height: 13.0,
                                                  width: 13.0,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .darkColor,
                                                ),
                                                onTap: () {},
                                              )),
                                          commentList[replyComIndex!]
                                                      .replyComList![index]
                                                      .totalDislikes! !=
                                                  "0"
                                              ? Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .only(start: 4.0),
                                                  child: Text(
                                                    commentList[replyComIndex!]
                                                        .replyComList![index]
                                                        .totalDislikes!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle2
                                                        ?.copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .darkColor,
                                                        ),
                                                  ),
                                                )
                                              : Container(),
                                          Spacer(),
                                          InkWell(
                                            child: Icon(
                                              Icons.more_vert_outlined,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .darkColor,
                                              size: 17,
                                            ),
                                            onTap: () {},
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ))),
                      ]);
                })));
  }

  replyCommentView() {
    return Padding(
        padding: EdgeInsetsDirectional.only(top: 10.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            allReplyComView(),
            replyComProfileWithCom(),
            replyComSendReplyView(),
            replyAllComListView(),
          ],
        ));
  }
}
