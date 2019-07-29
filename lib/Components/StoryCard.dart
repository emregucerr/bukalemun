import 'package:flutter/material.dart';

class StoryCard extends StatefulWidget {
  final String username;
  final Image imageSrc;

  const StoryCard({Key key, this.username, this.imageSrc}): super(key: key);

  _StoryCardState createState() => _StoryCardState();
}

class _StoryCardState extends State<StoryCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new ClipRRect(
          borderRadius: new BorderRadius.circular(35.0),
          child: new Container(
            width: 70,
            height: 70,
            child: widget.imageSrc,
          ),
        ),
        new Text(widget.username, style: new TextStyle(
          fontFamily: "Roboto",
          fontSize: 12.0,
          fontWeight: FontWeight.w400
        ),)
      ],
    );
  }

}