import 'package:flutter/material.dart';
import 'package:flutter_staj/components/homePage_Compenents.dart';
import 'package:flutter_staj/screens/HomePage_Screen/third_Page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_page.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondPage();
  }
}

class _SecondPage extends State {
  HomePageCompenents homeCompenents = HomePageCompenents();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeCompenents
          .homeAppBarPage(), //Ana compenent classımdan appBar için yazdığım değişkenimi çekiyorum.
      bottomNavigationBar: Row(
        //Bottom buttonlarımı yazıyorum ve tıklandığında ilgili sayfalara gönderiyorum.
        children: <Widget>[
          Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: RaisedButton(
                  color: Colors.grey[200],
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(iconStar, color: Colors.grey),
                      Text("    Feed"),
                      SizedBox(
                        width: 0.1,
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  })),
          Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: RaisedButton(
                  color: Colors.grey[200],
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(iconStar, color: Colors.grey),
                      Text("      Label"),
                      SizedBox(
                        width: 0.1,
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SecondPage()));
                  })),
          Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: RaisedButton(
                  color: Colors.grey[200],
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(iconStar, color: Colors.grey),
                      Text("      Label"),
                      SizedBox(
                        width: 0.1,
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ThirdPage()));
                  }))
        ],
      ),
    );
  }
}
