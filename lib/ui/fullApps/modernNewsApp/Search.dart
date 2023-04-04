// ignore_for_file: unused_element, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Color.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/String.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Session.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Model/News.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/NewsDetails.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

bool buildResult = false;

class _SearchState extends State<Search> with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String query = "";

  List<News> searchResult = [];

  String source = "";

  @override
  void initState() {
    print("searchresult****${searchResult.length}");
    _controller.addListener(() {
      print("controller listner****");
      if (_controller.text.isNotEmpty) {
        setState(() {
          searchResult = recentNewsList.where((items) {
            var noteTitle = items.title!.toLowerCase();
            print("items title****${items.title}");
            print(
                "text***${_controller.text}******${noteTitle.contains(_controller.text)}");
            //searchResult.add(items);
            return noteTitle.contains(_controller.text);
          }).toList();
        });
        /*recentNewsList.where((items) {
          var noteTitle = items.title!.toLowerCase();
          if (noteTitle.contains(_controller.text)) {
            print("add****");
            setState(() {
              searchResult.add(items);
            });

            print("search len****${searchResult.length}");
            return true;
          } else {
            return false;
          }
        });*/
      } else {
        clearAll();
      }
    });
    super.initState();
    //getHistory();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 10.0, top: 6.0, bottom: 6.0),
              child: Container(
                  height: 35,
                  padding: EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      "assets/images/fullApps/modernNews/svg/back_icon.svg",
                      semanticsLabel: 'back icon',
                      color: colors.primary,
                    ),
                  )));
        }),
        backgroundColor: Theme.of(context).canvasColor,
        title: TextField(
          onChanged: (text) async {
            setState(() {
              print("onclick****");
              query = text;

              // bool containsItem = recentNewsList.where((items) => items.title==))
              /*searchResult = recentNewsList.where((items) {
                var noteTitle = items.title!.toLowerCase();
                print("items title****${items.title}");
                print("text***$text******${noteTitle.contains(text)}");
                searchResult.add(items);
                return noteTitle.contains(text);
              }).toList();*/
            });
            if (_controller.text == "") {
              _controller.clear();
              query = "";
              setState(() {});
            }
          },
          controller: _controller,
          autofocus: true,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
              hintText: "Search",
              hintStyle: TextStyle(
                  color:
                      Theme.of(context).colorScheme.darkColor.withOpacity(0.5)),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.boxColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.boxColor),
              ),
              fillColor: colors.bgColor),
          // onChanged: (query) => updateSearchQuery(query),
        ),
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: () {
              _controller.text = '';
            },
            icon: Icon(
              Icons.close,
              color: colors.primary,
            ),
          )
        ],
      ),
      body: _showContent(),
    );
  }

  Widget listItem(int index) {
    News model = searchResult[index];
    return Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 7.0),
        child: ListTile(
            title: Text(
              model.title!,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Theme.of(context).colorScheme.fontColor,
                  fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(7.0),
                child: Image.asset(
                  model.image!,
                  fit: BoxFit.cover,
                  height: 80,
                  width: 80,
                )),
            onTap: () async {
              FocusScope.of(context).requestFocus(new FocusNode());
              News model = searchResult[index];
              List<News> seList = [];
              seList.addAll(searchResult);
              seList.removeAt(index);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => NewsDetails(
                        model: model,
                        index: index,
                        //updateParent: updateHome,
                        id: model.id,
                        isFav: false,
                        isDetails: true,
                        news: seList,
                        //updateHome: updateHome,
                      )));
            }));
  }

  //show snackbar msg
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

  clearAll() {
    setState(() {
      query = _controller.text;

      searchResult.clear();
    });
  }

  _showContent() {
    return searchResult.isEmpty
        ? Center(child: Text(getTranslated(context, 'no_news')!))
        : Padding(
            padding: EdgeInsetsDirectional.only(top: 15.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsetsDirectional.only(
                          bottom: 5, start: 10, end: 10, top: 12),
                      physics: BouncingScrollPhysics(),
                      itemCount: searchResult.length,
                      itemBuilder: (context, index) {
                        return listItem(index);
                      }),
                ),
              ],
            ));
  }
}

class _SuggestionList extends StatelessWidget {
  const _SuggestionList(
      {this.suggestions,
      this.textController,
      this.searchDelegate,
      this.notificationcontroller,
      this.getProduct,
      this.clearAll});

  final List<News>? suggestions;
  final TextEditingController? textController;

  final notificationcontroller;
  final SearchDelegate<News>? searchDelegate;
  final Function? getProduct, clearAll;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: suggestions!.length,
      shrinkWrap: true,
      controller: notificationcontroller,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int i) {
        final News suggestion = suggestions![i];

        return ListTile(
            title: Text(
              suggestion.title!,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Theme.of(context).colorScheme.fontColor,
                  fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            leading: textController!.text.toString().trim().isEmpty ||
                    suggestion.history!
                ? Icon(Icons.history)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(7.0),
                    child: suggestion.image == ''
                        ? Image.asset(
                            'assets/images/fullApps/modernNews/placeholder.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          )
                        : FadeInImage.assetNetwork(
                            image: suggestion.image!,
                            fadeInDuration: Duration(milliseconds: 10),
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                            placeholder: placeHolder,
                            imageErrorBuilder: (context, error, stackTrace) {
                              return errorWidget(80, 80);
                            },
                          )),
            trailing: Image.asset(
              "assets/images/fullApps/modernNews/search bar arrow.png",
              color: Theme.of(context).colorScheme.fontColor,
            ),
            onTap: () async {
              if (suggestion.title!.startsWith('Search Result for ')) {
                buildResult = true;
                clearAll!();
                getProduct!();
              } else if (suggestion.history!) {
                clearAll!();

                buildResult = true;
                textController!.text = suggestion.title!;
                textController!.selection = TextSelection.fromPosition(
                    TextPosition(offset: textController!.text.length));
              } else {
                buildResult = false;
                News model = suggestion;
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => NewsDetails(
                          model: model,
                          //index: index,
                          //updateParent: updateHome,
                          id: model.id,
                          isFav: false,
                          isDetails: true,
                          news: const [],
                          //updateHome: updateHome,
                        )));
              }
            });
      },
    );
  }
}
