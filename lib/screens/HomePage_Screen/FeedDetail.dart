import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staj/components/homePage_Compenents.dart';
import 'package:flutter_staj/screens/HomePage_Screen/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FeedDetails();
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

class _FeedDetails extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Animation daha önceki kurslarda yada internette aratmama rağmen bulamadım.Büyük ihtimal yanlış arattım yada neyi aratacağımı bilmediğimde kaynaklanıyordu.
        bottomNavigationBar: Row(
          //Bottom buttonlarım için Row içinde tasarlıyorum.
          children: <Widget>[
            Flexible(
                //Buttonumun nasıl olacağını tasarlıyorum.Ne kadar yer kaplıcak,Boyu ne kadar olacak gibi.
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                    color: Colors.grey[430],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconArrow,
                          color: Colors.grey,
                          width: 20,
                        ),
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
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconShare,
                          color: Colors.grey,
                          width: 20,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconBookmark,
                          color: Colors.grey,
                          width: 20,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconMore,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {}))
          ],
        ),
        body: FutureBuilder(
            //Diğer İlgili detailler (upperFeed için) içinde bu fonksiyonu kullanıyorum.
            //FutureBuilder ile json dosyamı çekiyorum.
            future: DefaultAssetBundle.of(context).loadString(
                "lib/models/appData.json"), //Json dosyamın yerini alıyorum
            builder: (context, snapshot) {
              var jsonData = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemCount: jsonData.length - 2,
                itemBuilder: (BuildContext context, index) => Card(
                    //Card içinde sayfayı tanımlıyorum.
                    child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Text(
                        jsonData["upperFeed"][0]
                            ["title"], //Başlığı yazdırıyorum.
                        style: TextStyle(fontSize: 20),
                      ),
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                    Image.network(jsonData["upperFeed"][0]
                        ["imgUrl"]), //Resmi yazdırıyorum.
                    ListTile(
                        title: Text(
                      "${jsonData["upperFeed"][0]["readTimeMinutes"]} minutes reading", //Dakika kısmını yazdırıyorum.
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                      textAlign: TextAlign.left,
                    )),
                    Text(
                      jsonData["upperFeed"][0]
                          ["text"], //Text kısmını yazdırıyorum.
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                )),
              );
            }));
  }
}

class FeedDetails1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FeedDetails1();
  }
}

class _FeedDetails1 extends State {
  HomePageCompenents homeComponents;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                    color: Colors.grey[430],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconArrow,
                          color: Colors.grey,
                          width: 20,
                        ),
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
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconShare,
                          color: Colors.grey,
                          width: 20,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconBookmark,
                          color: Colors.grey,
                          width: 20,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconMore,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {}))
          ],
        ),
        body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("lib/models/appData.json"),
            builder: (context, snapshot) {
              var jsonData = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemCount: jsonData.length - 2,
                itemBuilder: (BuildContext context, index) => Card(
                    child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Text(
                        jsonData["upperFeed"][1]["title"],
                        style: TextStyle(fontSize: 20),
                      ),
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                    Image.network(
                      jsonData["upperFeed"][1]["imgUrl"],
                    ),
                    ListTile(
                        title: Text(
                      "${jsonData["upperFeed"][1]["readTimeMinutes"]} minutes reading",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                      textAlign: TextAlign.left,
                    )),
                    Text(
                      jsonData["upperFeed"][1]["text"],
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  ],
                )),
              );
            }));
  }
}

class FeedDetails2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FeedDetails2();
  }
}

class _FeedDetails2 extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                    color: Colors.grey[430],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconArrow,
                          color: Colors.grey,
                          width: 20,
                        ),
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
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconShare,
                          color: Colors.grey,
                          width: 20,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconBookmark,
                          color: Colors.grey,
                          width: 20,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconMore,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {}))
          ],
        ),
        body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("lib/models/appData.json"),
            builder: (context, snapshot) {
              var jsonData = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemCount: jsonData.length - 2,
                itemBuilder: (BuildContext context, index) => Card(
                    child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Text(
                        jsonData["upperFeed"][2]["title"],
                        style: TextStyle(fontSize: 20),
                      ),
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                    Image.network(
                      jsonData["upperFeed"][2]["imgUrl"],
                    ),
                    ListTile(
                        title: Text(
                      "${jsonData["upperFeed"][2]["readTimeMinutes"]} minutes reading",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                      textAlign: TextAlign.left,
                    )),
                    Text(
                      jsonData["upperFeed"][2]["text"],
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  ],
                )),
              );
            }));
  }
}

class FeedDetails3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FeedDetails3();
  }
}

class _FeedDetails3 extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                    color: Colors.grey[430],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconArrow,
                          color: Colors.grey,
                          width: 20,
                        ),
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
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconShare,
                          color: Colors.grey,
                          width: 20,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconBookmark,
                          color: Colors.grey,
                          width: 20,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconMore,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {}))
          ],
        ),
        body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("lib/models/appData.json"),
            builder: (context, snapshot) {
              var jsonData = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemCount: jsonData.length - 2,
                itemBuilder: (BuildContext context, index) => Card(
                    child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Text(
                        jsonData["upperFeed"][3]["title"],
                        style: TextStyle(fontSize: 20),
                      ),
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                    Image.network(
                      jsonData["upperFeed"][3]["imgUrl"],
                    ),
                    ListTile(
                        title: Text(
                      "${jsonData["upperFeed"][3]["readTimeMinutes"]} minutes reading",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                      textAlign: TextAlign.left,
                    )),
                    Text(
                      jsonData["upperFeed"][3]["text"],
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  ],
                )),
              );
            }));
  }
}

class FeedDetails4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FeedDetails4();
  }
}

class _FeedDetails4 extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                    color: Colors.grey[430],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconArrow,
                          color: Colors.grey,
                          width: 20,
                        ),
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
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconShare,
                          color: Colors.grey,
                          width: 20,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconBookmark,
                          color: Colors.grey,
                          width: 20,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconMore,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {}))
          ],
        ),
        body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("lib/models/appData.json"),
            builder: (context, snapshot) {
              var jsonData = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemCount: jsonData.length - 2,
                itemBuilder: (BuildContext context, index) => Card(
                    child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Text(
                        jsonData["upperFeed"][4]["title"],
                        style: TextStyle(fontSize: 20),
                      ),
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                    Image.network(
                      jsonData["upperFeed"][4]["imgUrl"],
                    ),
                    ListTile(
                        title: Text(
                      "${jsonData["upperFeed"][4]["readTimeMinutes"]} minutes reading",
                      style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                      textAlign: TextAlign.left,
                    )),
                    Text(
                      jsonData["upperFeed"][4]["text"],
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  ],
                )),
              );
            }));
  }
}

class FeedDetails5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FeedDetails5();
  }
}

class _FeedDetails5 extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                    color: Colors.grey[430],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconArrow,
                          color: Colors.grey,
                          width: 20,
                        ),
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
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconShare,
                          color: Colors.grey,
                          width: 20,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconBookmark,
                          color: Colors.grey,
                          width: 20,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconMore,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {}))
          ],
        ),
        body: FutureBuilder(
            //Bu kısımda json dosyasından myList ile ilgili kısımları yazdırmak için kullanıyorum.Bu fonksiyon diğer idler içinde kullanılmıştır.
            future: DefaultAssetBundle.of(context).loadString(
                "lib/models/appData.json"), //Json dosyamın yerini alıyorum
            builder: (context, snapshot) {
              var jsonData = json.decode(snapshot.data.toString());
              return ListView.builder(
                //Json içindeki dataları ekrana yazdırmak için listView.Builder Kullanıyorum.
                itemCount: jsonData.length - 2,
                itemBuilder: (BuildContext context, index) => Card(
                    //Ekrana card olarak yazdırıyorum.
                    child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Text(
                        jsonData["myList"][0]
                            ["title"], //Başlığını yazdırıyorum.
                        style: TextStyle(fontSize: 20),
                      ),
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                    Image.network(
                      jsonData["myList"][0]
                          ["imgUrl"], //Ekrana resmi yazdırıyorum.
                    ),
                    ListTile(
                        title: Text(
                      "${jsonData["myList"][0]["readTimeMinutes"]} minutes reading", //Dakikayı yazdırıyorum.
                      style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                      textAlign: TextAlign.left,
                    )),
                    Text(
                      jsonData["myList"][0]["text"], //Texti yazdırıyorum.
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  ],
                )),
              );
            }));
  }
}

class FeedDetails6 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FeedDetails6();
  }
}

class _FeedDetails6 extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                    color: Colors.grey[430],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconArrow,
                          color: Colors.grey,
                          width: 20,
                        ),
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
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconShare,
                          color: Colors.grey,
                          width: 20,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconBookmark,
                          color: Colors.grey,
                          width: 20,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconMore,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {}))
          ],
        ),
        body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("lib/models/appData.json"),
            builder: (context, snapshot) {
              var jsonData = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemCount: jsonData.length - 2,
                itemBuilder: (BuildContext context, index) => Card(
                    child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Text(
                        jsonData["myList"][1]["title"],
                        style: TextStyle(fontSize: 20),
                      ),
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                    Image.network(
                      jsonData["myList"][1]["imgUrl"],
                    ),
                    ListTile(
                        title: Text(
                      "${jsonData["myList"][1]["readTimeMinutes"]} minutes reading",
                      style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                      textAlign: TextAlign.left,
                    )),
                    Text(
                      jsonData["myList"][1]["text"],
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  ],
                )),
              );
            }));
  }
}

class FeedDetails7 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FeedDetails7();
  }
}

class _FeedDetails7 extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                    color: Colors.grey[430],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconArrow,
                          color: Colors.grey,
                          width: 20,
                        ),
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
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconShare,
                          color: Colors.grey,
                          width: 20,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconBookmark,
                          color: Colors.grey,
                          width: 20,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {})),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.grey[300],
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          iconMore,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 0.1,
                        )
                      ],
                    ),
                    onPressed: () {}))
          ],
        ),
        body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("lib/models/appData.json"),
            builder: (context, snapshot) {
              var jsonData = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemCount: jsonData.length - 2,
                itemBuilder: (BuildContext context, index) => Card(
                    child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Text(
                        jsonData["myList"][2]["title"],
                        style: TextStyle(fontSize: 20),
                      ),
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                    Image.network(
                      jsonData["myList"][2]["imgUrl"],
                    ),
                    ListTile(
                        title: Text(
                      "${jsonData["myList"][2]["readTimeMinutes"]} minutes reading",
                      style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                      textAlign: TextAlign.left,
                    )),
                    Text(
                      jsonData["myList"][2]["text"],
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  ],
                )),
              );
            }));
  }
}
