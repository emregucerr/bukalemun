import 'package:flutter/material.dart';
import '../Components/StarRating.dart';

class ConferenceCard extends StatefulWidget {
  _ConferenceCardState createState() => _ConferenceCardState();
}

class _ConferenceCardState extends State<ConferenceCard> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    // TODO: implement build
    return ClipRRect(
      borderRadius: new BorderRadius.circular(60.0),
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 7, 15, 7),
        color: Color.fromRGBO(247, 247, 247, 1),
        child: new Row(
          children: <Widget>[
            Container(
              width: media.size.width * 0.70,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 5, 5),
                      child: new Text(
                        "MUNDP",
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            color: Color.fromRGBO(17, 172, 83, 1),
                            fontSize: 24,
                            fontWeight: FontWeight.w200,
                            decoration: null),
                      )),
                  new Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 5, 5),
                      child: new Text(
                        "The Koç School",
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                            decoration: null),
                      )),
                  new Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 5, 5),
                    child: new Text(
                      "20-23 February 2019",
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          decoration: null),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 5, 5),
                    child: new Text(
                      "www.modelundp.org",
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                          color: Color.fromRGBO(17, 172, 83, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                          decoration: null),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 5, 15),
                    child: new IconTheme(
                        data: IconThemeData(
                            color: Color.fromRGBO(17, 172, 83, 1), size: 12),
                        child: new StarRating(
                            rating: 4,
                            color: Color.fromRGBO(
                              17,
                              172,
                              83,
                              1,
                            ))),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Container(
                    height: 100,
                    child:
                        new Image.network("http://modelundp.org/img/icon.png")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
