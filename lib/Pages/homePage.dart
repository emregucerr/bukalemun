import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/StoryCard.dart';
import '../Components/ArticleCard.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final strings = ["one","two","three"];
    final media = MediaQuery.of(context);
    return Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          color: Colors.white,
          child: new Column(
            children: <Widget>[
              new Container(
                height: 110,
                child: new StoryListView(),
              ),
              new Container(
                child: new MainButtons(),
              ),
              new Column(children: strings.map((item) => new ArticleCard()).toList())
            ],
          ),
        ),
      ),
    );
  }
}

class StoryListView extends StatelessWidget {
  String getUsername(int index) {
    if (index == 0) {
      return "Add Story";
    } else {
      return "@emregucerr";
    }
  }

  Image getImg(int index) {
    if (index == 0) {
      return new Image.asset("assets/assets/addStory.png");
    } else {
      return new Image.network(
          "https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return new Wrap(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.all(20.0),
              child: new StoryCard(
                username: getUsername(index),
                imageSrc: getImg(index),
              ),
            )
          ],
        );
      },
    );
  }
}

class MainButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    // TODO: implement build
    return new Column(
      children: <Widget>[
        Container(
          height: media.size.height / 5,
          child: new CupertinoButton(
            child: new Image.asset("assets/assets/iceBreakersBtn.png"),
            onPressed: () {},
          ),
        ),
        Container(
          height: media.size.height / 5,
          child: new CupertinoButton(
            child: new Image.asset("assets/assets/conferenceMapBtn.png"),
            onPressed: () {},
          ),
        ),
        Container(
          height: media.size.height / 5,
          child: new CupertinoButton(
            child: new Image.asset("assets/assets/addFriendBtn.png"),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
