import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/eStudy/Model/All_Course_Model.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Model/My_Course_Model.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Model/Saved_Course_Model.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/flutter_rating_bar.dart';

class DesignConfig {
  static BoxDecoration boxDecorationContainer(Color color, double radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static Widget shadowButtonFullwidgth(Color btncolor, String btntext,
      Color textcolor, double radius, Color bordercolor, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      alignment: Alignment.center,
      decoration: buttonShadow(btncolor, radius, bordercolor),
      child: Text(
        btntext,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: textcolor,
        ),
      ),
    );
  }

  static BoxDecoration buttonShadow(
      Color btncolor, double radius, Color bordercolor) {
    return BoxDecoration(
        color: btncolor,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        border: Border.all(color: bordercolor),
        boxShadow: [
          BoxShadow(
            color: btncolor.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ]);
  }

  static Widget DisplayCoursePriceMy_course(My_Course_Model item,
      bool isfullratingbar, bool coursename, Color color1, Color color2) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                color1,
                color2,
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "\$ " + item.CoursePrice!,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: ColorsRes.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ),
          coursename && item.CourseName != null
              ? Text(" ${item.CourseName} | ")
              : Container(),
          Text(item.CourseRating.toString(),
              style: TextStyle(fontSize: 14, color: ColorsRes.lightgraycolor)),
          isfullratingbar
              ? RatingBarIndicator(
                  rating: double.parse(item.CourseRating!),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 14,
                  direction: Axis.horizontal,
                )
              : Icon(
                  Icons.star,
                  size: 14,
                  color: Colors.amber,
                )
          //Text("\t\t${item.rate}",style: TextStyle(color: ColorsRes.white,fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }

  static Widget DisplayCoursePriceSaved_course(Saved_Course_Model item,
      bool isfullratingbar, bool coursename, Color color1, Color color2) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                color1,
                color2,
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "\$ " + item.CoursePrice!,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: ColorsRes.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ),
          coursename && item.CourseName != null
              ? Text(" ${item.CourseName} | ")
              : Container(),
          Text(item.CourseRating.toString(),
              style: TextStyle(fontSize: 14, color: ColorsRes.lightgraycolor)),
          isfullratingbar
              ? RatingBarIndicator(
                  rating: double.parse(item.CourseRating!),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 14,
                  direction: Axis.horizontal,
                )
              : Icon(
                  Icons.star,
                  size: 14,
                  color: Colors.amber,
                )
          //Text("\t\t${item.rate}",style: TextStyle(color: ColorsRes.white,fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }

  static Widget DisplayCommentRattingAllCourse(
      String? CommentRatting, bool isfullratingbar, bool categoryname) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 0, end: 5),
      child: Row(
        children: <Widget>[
          isfullratingbar
              ? RatingBarIndicator(
                  rating: double.parse(CommentRatting!),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 14,
                  direction: Axis.horizontal,
                )
              : Icon(
                  Icons.star,
                  size: 14,
                  color: Colors.amber,
                )
          //Text("\t\t${item.rate}",style: TextStyle(color: ColorsRes.white,fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }

  static Widget DisplayCommentRattingMyCourse(
      String? CommentRatting, bool isfullratingbar, bool categoryname) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 0, end: 5),
      child: Row(
        children: <Widget>[
          isfullratingbar
              ? RatingBarIndicator(
                  rating: double.parse(CommentRatting!),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 14,
                  direction: Axis.horizontal,
                )
              : Icon(
                  Icons.star,
                  size: 14,
                  color: Colors.amber,
                )
          //Text("\t\t${item.rate}",style: TextStyle(color: ColorsRes.white,fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }

  static Widget DisplayCommentRattingSaveCourse(
      String? CommentRatting, bool isfullratingbar, bool categoryname) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 0, end: 5),
      child: Row(
        children: <Widget>[
          isfullratingbar
              ? RatingBarIndicator(
                  rating: double.parse(CommentRatting!),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 14,
                  direction: Axis.horizontal,
                )
              : Icon(
                  Icons.star,
                  size: 14,
                  color: Colors.amber,
                )
          //Text("\t\t${item.rate}",style: TextStyle(color: ColorsRes.white,fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }

  static Widget DisplayBundlePriceAll_course(
      All_Course_Model item, bool isfullratingbar, bool categoryname) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: const [
                ColorsRes.secondgradientcolor,
                ColorsRes.firstgradientcolor,
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "\$ " + item.CoursePrice!,
              style: TextStyle(
                  color: ColorsRes.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ),
          categoryname ? Text(" ${item.CourseName} | ") : Container(),
          Text("${item.CourseDiscount}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                fontSize: 12,
                color: ColorsRes.introMessagecolor,
              )),
          //Text("\t\t${item.rate}",style: TextStyle(color: ColorsRes.white,fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }

  static Widget DisplayCourseTitle(String title, int line) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 10, end: 5, top: 8),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: ColorsRes.introTitlecolor),
        maxLines: line,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Widget DisplayCourseTitleMultiline(String title) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5, top: 8),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: ColorsRes.introTitlecolor),
        //style: TextStyle(color: ColorsRes.black,fontWeight: FontWeight.bold),
      ),
    );
  }

  static Widget DisplayCourseImage(String? localimg, String? image,
      String? blurUrl, double height, double width) {
    return OctoImage(
      image: CachedNetworkImageProvider(image!),
      placeholderBuilder: OctoPlaceholder.blurHash(
        blurUrl!,
      ),
      width: width,
      height: height,
      errorBuilder: OctoError.icon(color: ColorsRes.black),
      fit: BoxFit.fill,
    );
  }
}
