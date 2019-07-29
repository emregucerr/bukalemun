import 'package:flutter/material.dart';


class FeedPage extends StatefulWidget {
  FeedPage({Key key}) : super(key: key);

  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
 @override
  Widget build(BuildContext context) {
    return Container(
            color: Colors.white,

      child: Center(child: Text("Feed Page"),),
    );
  }
}