import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staj/components/homePage_Compenents.dart';

import 'package:flutter_staj/screens/HomePage_Screen/FeedDetail.dart';
import 'package:flutter_staj/screens/HomePage_Screen/Second_Page.dart';
import 'package:flutter_staj/screens/HomePage_Screen/third_Page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

const iconStar = 'assets/Icons/Star.svg';
const iconBookmark = 'assets/Icons/bookmark.svg';
const iconCheckMark = 'assets/Icons/checkmark-done-circle.svg';
const iconMore = 'assets/Icons/more.svg';
const iconArrow = 'assets/Icons/noun_back_2147853.svg';
const iconSearch = 'assets/Icons/noun_Search_3402452.svg';
const iconShare = 'assets/Icons/share.svg';
const iconColoredLine = 'assets/Icons/colored line.svg';

class _HomePageState extends State {
  HomePageCompenents homeCompenents;
  List data; //Json için liste şeklinde data alıyorum.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //Burada AnaComponentaki değişkenimi kullanamadım.Null Değeri döndürüyor ama diğer sayfalarda kullandığım zaman hata ile karşılaşmadım.
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
        ),
        bottomNavigationBar: Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: RaisedButton(
                    color: Colors.grey[200],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconStar,
                          color: Colors.grey,
                        ),
                        Text("      Feed"),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondPage()));
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
        body: SingleChildScrollView(
          child: futureBuild(),
        ));
  }

  FutureBuilder futureBuild() {
    //FutureBuilder ile json dosyamı çekiyorum.
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(
            "lib/models/appData.json"), //Json dosyamın yerini alıyorum
        builder: (context, snapshot) {
          var jsonData = json.decode(snapshot.data.toString());

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                //Userin ismini yazdırıyorum.
                "What are you learning today ${jsonData["user"]["name"]} ?",
                style: TextStyle(fontSize: 20, color: Colors.grey), //
                textAlign: TextAlign
                    .start, //Başlangıç noktasından itibaren yazdıyorum.
              ),
              SizedBox(
                //Box boyutunu belirlemek için SizedBox kullanıyorum.
                height: 320.0,
                child: ListView.builder(
                  //Json içindeki dataları ekrana yazdırmak için listView.Builder Kullanıyorum.
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis
                      .horizontal, //Boxların yan yana olması için horizontal veriyorum.
                  itemCount: jsonData["upperFeed"]
                      .length, //Ekrana Json dosyası içindeki upperFeed kadar sınır koyuyorum.
                  itemBuilder: (BuildContext context, int index) => InkWell(
                    //Tıkladığımızda PageDetail kısmına girmesi için ben Inkwell kullandım.
                    child: Card(
                        //Burada Card içine json dosyamın içindeki upperFeed bölümümün datalarını yazdırıyorum.
                        child: Container(
                            child: Container(
                      height: 250,
                      width: 320,
                      child: Column(children: <Widget>[
                        Column(children: <Widget>[
                          InkWell(
                            child: Column(children: <Widget>[
                              Stack(
                                //Resmin üstünde json dosyası içindeki type yazısını yazmak için Stack kullanıyorum.
                                children: <Widget>[
                                  Image.network(
                                    jsonData["upperFeed"][index]["imgUrl"],
                                  ),
                                  Text(
                                    jsonData["upperFeed"][index]["type"],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        backgroundColor: Colors.black),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              Text(
                                jsonData["upperFeed"][index]["link"],
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                jsonData["upperFeed"][index]["title"],
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                jsonData["upperFeed"][index]["readTimeMinutes"]
                                        .toString() +
                                    " Minutes",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey),
                                textAlign: TextAlign.left,
                              ),
                              Text(jsonData["upperFeed"][index]["text"]
                                  .toString()
                                  .substring(0, 150)),
                              Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    iconBookmark,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "Bookmark",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  ),
                                  SvgPicture.asset(
                                    iconCheckMark,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "Mark as read",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  ),
                                  SvgPicture.asset(
                                    iconShare,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "Share",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  )
                                ],
                              ),
                            ]),
                            onTap: () {
                              //Tıkladığım box için aldığım id değerini Navigator push kullanarak ilgili Detail bölümüne bağlıyorum.
                              if (index == 0) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FeedDetails(),
                                  ),
                                );
                              } else if (index == 1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FeedDetails1(),
                                  ),
                                );
                              } else if (index == 2) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FeedDetails2(),
                                  ),
                                );
                              } else if (index == 3) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FeedDetails3(),
                                  ),
                                );
                              } else if (index == 4) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FeedDetails4(),
                                  ),
                                );
                              }
                            },
                          ),
                        ])
                      ]),
                    ))),
                  ),
                ),
              ),
              ListTile(
                //Video da bulunan Mylist bölümünü yazıyorum.
                title: Text(
                  "My List",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 22, color: Colors.grey[600]),
                ),
                trailing: SvgPicture.asset(
                  iconArrow,
                  width: 20,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                //Bu kısımda ise bu seferde json dosyam içinde myList içindeki bölümü yazdırıyorum.
                height: 320.0,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: jsonData["myList"].length,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                    child: Card(
                        child: Container(
                            child: Container(
                      height: 350,
                      width: 250,
                      child: Column(children: <Widget>[
                        InkWell(
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Image.network(
                                    jsonData["myList"][index]["imgUrl"],
                                  ),
                                  Text(
                                    jsonData["myList"][index]["type"],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        backgroundColor: Colors.black),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              Text(
                                jsonData["myList"][index]["link"],
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                jsonData["myList"][index]["title"],
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                jsonData["myList"][index]["readTimeMinutes"]
                                        .toString() +
                                    " Minutes",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                jsonData["myList"][index]["text"]
                                    .toString()
                                    .substring(1, 150),
                                textAlign: TextAlign.left,
                              ),
                              Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    iconBookmark,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "Bookmark",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  ),
                                  SvgPicture.asset(
                                    iconCheckMark,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "Mark as read",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  ),
                                  SvgPicture.asset(
                                    iconShare,
                                    width: 20,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "Share",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  )
                                ],
                              )
                            ],
                          ),
                          onTap: () {
                            if (index == 0) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FeedDetails5(),
                                  ));
                            } else if (index == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FeedDetails6(),
                                  ));
                            } else if (index == 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FeedDetails7(),
                                  ));
                            }
                          },
                        )
                      ]),
                    ))),
                  ),
                ),
              )
            ],
          );
        });
  }
}
