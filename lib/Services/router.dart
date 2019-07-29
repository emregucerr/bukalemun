import 'package:bukalemun/Constants/routerConstants.dart';
import 'package:flutter/material.dart';
import 'package:bukalemun/Pages/indexPage.dart' as prefix0;


Route<dynamic> generateRoute(RouteSettings settings) {
  // Here is where all the routing is handled

  switch(settings.name){
    case IndexPage : {
        return MaterialPageRoute(builder: (context) => prefix0.IndexPage());
      }
      break;
  }

}
