import 'package:flutter/material.dart';
import '../Components/StarRating.dart';
import '../Components/ConferenceCard.dart';

class ConferencesPages extends StatefulWidget {
  ConferencesPages({Key key}) : super(key: key);

  _ConferencesPagesState createState() => _ConferencesPagesState();
}

class _ConferencesPagesState extends State<ConferencesPages> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: new ListView.builder(
          itemBuilder: (context, index) {
            return ConferenceCard();
          },
        ),
      ),
    );
  }
}


