import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/model/Comment.dart';

class CommentList extends StatefulWidget {
  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  late List<Comment> commentlist;
  @override
  void initState() {
    super.initState();
    commentlist = [];
    setCommentList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          DesignConfig.setAppbar(StringsRes.comments) as PreferredSizeWidget?,
      body: commentWidget(),
    );
  }

  Widget commentWidget() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemBuilder: (context, index) {
          Comment comment = commentlist[index];
          return buttonWithShadow(comment);
        },
        separatorBuilder: (context, index) => SizedBox(
              height: 15,
            ),
        itemCount: commentlist.length);
  }

  Widget buttonWithShadow(Comment comment) {
    return IntrinsicHeight(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: ColorsRes.white,
              boxShadow: [
                BoxShadow(
                  color: ColorsRes.appcolor.withOpacity(0.3),
                  offset: Offset(4, 4),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: ColorsRes.white,
              boxShadow: const [
                BoxShadow(
                  color: ColorsRes.btnlightshadow,
                  offset: Offset(-4, -4),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 30,
                      child: ClipOval(
                        child: OctoImage(
                          image: CachedNetworkImageProvider(comment.imgurl!),
                          placeholderBuilder:
                              OctoPlaceholder.blurHash(comment.hash!),
                          errorBuilder: OctoError.icon(color: Colors.black),
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(comment.username!,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .merge(TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsRes.black,
                                ))),
                        Row(children: [
                          Icon(
                            Icons.alarm,
                            color: ColorsRes.grey,
                            size: 15,
                          ),
                          Text(
                            "\t${comment.datetime}",
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(comment.comment!)
              ],
            ),
          ),
        ],
      ),
    );
  }

  setCommentList() {
    commentlist.add(new Comment(
        id: 1,
        username: "Wrteam01",
        datetime: "1 hour ago",
        userimage: "assets/images/fullApps/newsapp/news1a.jpg",
        imgurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1a.jpg?alt=media&token=4f9b47cb-7e46-4768-a764-31a3ca814bc0",
        hash: "L4BVw^9v00tR01-oE3a001kD~VI:",
        comment:
            "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday."));

    commentlist.add(new Comment(
        id: 2,
        username: "Wrteam02",
        userimage: "assets/images/fullApps/newsapp/news4a.jpg",
        datetime: "2 hour ago",
        imgurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews4a.jpg?alt=media&token=0ff53d59-404c-4f12-96f8-3fecd07e5dec",
        hash: "LEFP1@_4EgEM?cbd9vR\$4:V@xFM{",
        comment:
            "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday."));

    commentlist.add(new Comment(
        id: 3,
        username: "Wrteam03",
        datetime: "3 hour ago",
        userimage: "assets/images/fullApps/newsapp/news4c.jpg",
        imgurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews4c.jpg?alt=media&token=be9283a5-2bee-4ca1-a609-6354d2622bb5",
        hash: "LHHAqxxv8|I]}rSKD*o#TeaK,nni",
        comment:
            "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday."));

    commentlist.add(new Comment(
        id: 4,
        username: "Wrteam04",
        datetime: "1 day ago",
        userimage: "assets/images/fullApps/newsapp/news4e.jpg",
        imgurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews4e.jpg?alt=media&token=807196d4-81b3-46c6-a557-ae656edc2f75",
        hash: "LSI:tnz:[W;3};Ita#s9E,I.SgkC",
        comment:
            "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday."));

    commentlist.add(new Comment(
        id: 5,
        username: "Wrteam05",
        datetime: "5 days ago",
        userimage: "assets/images/fullApps/newsapp/news6b.jpg",
        imgurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews6b.jpg?alt=media&token=d85831e9-7eb6-455a-9dd0-9339ee50dc3a",
        hash: "L6FYMt58FY-9-K-=%N?Z~A4oxu?b",
        comment:
            "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday."));

    commentlist.add(new Comment(
        id: 6,
        username: "Wrteam06",
        datetime: "1 week ago",
        userimage: "assets/images/fullApps/newsapp/news6e.jpg",
        imgurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews6e.jpg?alt=media&token=8b12b972-536c-4b5e-8901-050ad96ae788",
        hash: "LKJ*6V%dt0Iv~Ux^xvMx%NNHRjs:",
        comment:
            "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday."));
  }
}
