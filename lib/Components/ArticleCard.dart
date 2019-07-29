import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatefulWidget {
  _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    // TODO: implement build
    return new Container(
      margin: EdgeInsets.all(5),
      width: media.size.width * 0.90,
      height: 300,
      child: new Container(
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.all(5),
                  width: 100,
                  height: 100,
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(50.0),
                    child: new Image.network(
                        "https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg"),
                  ),
                ),
                Container(
                  width: media.size.width * 0.50,
                  margin: EdgeInsets.all(5),
                  child: new Text(
                    "What is MUN?",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                        color: Color.fromRGBO(17, 172, 83, 1),
                        fontSize: 22,
                        fontWeight: FontWeight.w200),
                  ),
                )
              ],
            ),
            new Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    width: media.size.width / 2.5,
                    child: new Text(
                      "@username",
                      style: new TextStyle(fontWeight: FontWeight.w200),
                    )),
                Container(
                    width: media.size.width / 2.5,
                    child: new Text(
                      "28/07/2019",
                      textAlign: TextAlign.right,
                      style: new TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w200),
                    ))
              ],
            ),
            new Row(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                  width: media.size.width * 0.85,
                  height: 150,
                  child: new Text(
                    "    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Netus et malesuada fames ac. Velit aliquet sagittis id consectetur purus ut. Amet nisl suscipit adipiscing bibendum est ultricies integer quis. Mauris vitae ultricies leo integer malesuada nunc vel risus. At risus viverra adipiscing at in tellus integer feugiat scelerisque. Vehicula ipsum a arcu cursus vitae. Gravida arcu ac tortor dignissim convallis aenean et. Augue eget arcu dictum varius duis at consectetur. Dictumst quisque sagittis purus sit amet volutpat consequat. Vitae nunc sed velit dignissim sodales ut eu. Donec ac odio tempor orci dapibus ultrices in. Sed turpis tincidunt id aliquet risus feugiat. Sit amet mattis vulputate enim nulla aliquet porttitor. Eget lorem dolor sed viverra ipsum nunc aliquet bibendum enim. Massa ultricies mi quis hendrerit. Dictum sit amet justo donec enim diam vulputate ut. Aliquam malesuada bibendum arcu vitae elementum. Libero id faucibus nisl tincidunt eget. Mi sit amet mauris commodo quis imperdiet.",
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w200),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
