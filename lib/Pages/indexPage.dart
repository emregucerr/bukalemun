import 'package:bukalemun/Components/CustomAppBar.dart';
import 'package:bukalemun/Components/CustomTabBar.dart';
import 'package:bukalemun/Constants/tabBarStateConstant.dart';
import 'package:bukalemun/Model/tabBarStateModel.dart';
import 'package:bukalemun/Pages/conferencesPage.dart';
import 'package:bukalemun/Pages/feedPage.dart';
import 'package:bukalemun/Pages/homePage.dart';
import 'package:bukalemun/Pages/profile.dart';
import 'package:bukalemun/Pages/searchPage.dart';
import 'package:bukalemun/Services/tabBarState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


///Index Page is the index of app containing the constant widgets such as [CustomAppBar] and [CustomTabBar] which will prevent the re-rendering so the performance issues
class IndexPage extends StatefulWidget {

  IndexPage({Key key,}) : super(key: key);

  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  int currentPage = 0; /// Initial page of the [PageView]

  /// This variable is defined here to prevent stack collusions after calculation
  double tabBarHeight = 80; /// Height of the [CustomTabBar]

  @override
  Widget build(BuildContext context) { 
        final media = MediaQuery.of(context);

    tabBarHeight = MediaQuery.of(context).size.height/10;
      return ChangeNotifierProvider<PageIndex>(
                      builder: (_) => PageIndex(),
                      child:Container(
       child: Stack(
         children: <Widget>[
         new Column(
            children: <Widget>[  
              CustomAppBar(), /// AppBar With logo
              PageFragment(), /// PageFragment containing the [PageView]            
              new Container(height: tabBarHeight,width: media.size.width,color: Colors.white,)
            ],    
          ),
          Positioned(
            bottom: 0,
            child: CustomTabBar(tabBarHeight)
          ), /// Custom Painted Tabbar
        ],
      ),
     )
    );
  }
}


class PageFragment extends StatelessWidget {
  PageController _controller = PageController(initialPage: 2);
  var animationDuration = Duration(milliseconds: 300); /// On change do not forget to change the duration value on [TouchableElement]
  var animationCurve = Curves.easeIn;
  

  @override
  Widget build(BuildContext context) {
    

  final indexState = Provider.of<PageIndex>(context);
  int previousPage;
  
  
  void listenChange(){
    
    if(previousPage == null){
      previousPage= 0;

    }


    var pageRAM  = _controller.page.round();
    
   if(indexState.state.pushSource != PushSource.tabBarController){
    if(previousPage !=pageRAM){
      indexState.updateState(TabBarState(index: pageRAM.toDouble(),pushSource: PushSource.pageController));
      previousPage = pageRAM;

    }
    previousPage = pageRAM;
      
   } 
  }

  

  

  void handleChange(){
    double check = 31;
    var indexRAM= indexState.state.index;
    if(_controller.hasClients == true && indexState.state.pushSource == PushSource.tabBarController){
      if(indexRAM.round() !=check.round()){
        check = indexRAM;
        _controller.animateToPage(indexState.state.index.toInt(),duration: animationDuration,curve: animationCurve);
      }
     // 

    } 
  }
  indexState.addListener(handleChange);
  _controller.addListener(listenChange);
   return Expanded(
     child:  new PageView(
          
          controller: _controller,
          children: <Widget>[
            FeedPage(),
            SearchPage(),
            HomePage(),
            ConferencesPages(),
            ProfilePage(),

          ],
        ),
     
   );
  }
}