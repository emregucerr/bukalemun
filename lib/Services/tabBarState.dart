import 'package:bukalemun/Constants/tabBarStateConstant.dart';
import 'package:bukalemun/Model/tabBarStateModel.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class PageIndex with ChangeNotifier{
  TabBarState state = TabBarState(pushSource: PushSource.tabBarController,index: 2);

  TabBarState get getState => state;

  void updateState(var data){
    state = data;
    notifyListeners();  
  }

  TabBarState getStateToCalc(){
    TabBarState returnValue = state;
    updateOnlyPushSource(PushSource.neutral);
    return returnValue; 
  }

  void updateOnlyPushSource(var src){
    var newState = TabBarState(pushSource: src,index: state.index);
    state = newState;

  }


}