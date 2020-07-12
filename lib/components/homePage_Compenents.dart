//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageCompenents {
  String iconStar = 'assets/Icons/Star.svg';
  String iconBookmark = 'assets/Icons/bookmark.svg';
  String iconCheckMark = 'assets/Icons/checkmark-done-circle.svg';
  String iconMore = 'assets/Icons/more.svg';
  String iconArrow = 'assets/Icons/noun_back_2147853.svg';
  String iconSearch = 'assets/Icons/noun_Search_3402452.svg';
  String iconShare = 'assets/Icons/share.svg';
  String iconColoredLine = 'assets/Icons/colored line.svg';

  AppBar homeAppBarPage() {
    return AppBar(
      //Genel Appbar bölümü için appBar compenentı yazıyorum.
      title: Text(
        "Feed",
        style: TextStyle(color: Colors.black),
      ),
      bottom: PreferredSize(
          child: SvgPicture.asset(
            iconColoredLine,
            height: 2.2,
          ),
          preferredSize: null),
      centerTitle: true,
      backgroundColor: Colors.grey[50],
      actions: <Widget>[
        SvgPicture.asset(
          iconSearch,
          height: 80,
        ),
      ],
      elevation: 0,
    );
  }
}
