import 'package:bukalemun/Constants/tabBarStateConstant.dart';
import 'package:bukalemun/Model/tabBarStateModel.dart';
import 'package:flutter/material.dart';
import 'package:bukalemun/Services/tabBarState.dart';
import 'dart:math' as Math;

import 'package:provider/provider.dart';

class CustomTabBar extends StatefulWidget {
  double widgetHeight;
  CustomTabBar(this.widgetHeight);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  /// Diameter of the blank circle(Imaginery)
  ///while changing do not forget to change the diameter variable inside the [TabBarPainter]
  static double diameter = 80;

  /// 80 by default
  static double radius = diameter / 2;
  double topspace = 4;

  double index = 2;

  Widget ActiveLayer() {
    final media = MediaQuery.of(context);
    diameter = media.size.width / 5;

    return Container(
      child: new Stack(
        children: <Widget>[
          CustomShape(diameter),

          /// Left Element holder containing two touchable elements
          Positioned(
            bottom: 5,
            left: 5,
            child: new Container(
                child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Container(
                      width: 10,
                    ),
                    Container(
                      width: 65,
                      child: TouchableElement(
                          diameter,
                          widget.widgetHeight,
                          "assets/assets/forum.png",
                          "assets/assets/forumHighlighted.png",
                          0,
                          index,
                          this),
                    ),
                    new Container(
                      width: 15,
                    ),
                    Container(
                      width: 65,
                      child: TouchableElement(
                          diameter,
                          widget.widgetHeight,
                          "assets/assets/safari.png",
                          "assets/assets/safariHighlighted.png",
                          1,
                          index,
                          this),
                    ),
                  ],
                )
              ],
            )),
          ),

          /// Right Element holder containing two touchable elements
          Positioned(
            bottom: 5,
            right: 5,
            child: new Container(
                child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    Container(
                      width: 65,
                      child: TouchableElement(
                          diameter,
                          widget.widgetHeight,
                          "assets/assets/conference.png",
                          "assets/assets/conferenceHighlighted.png",
                          3,
                          index,
                          this),
                    ),
                    new Container(
                      width: 15,
                    ),
                    Container(
                      height: 65,
                      child: TouchableElement(
                          diameter,
                          widget.widgetHeight,
                          "assets/assets/profile.png",
                          "assets/assets/profileHighlighted.png",
                          4,
                          index,
                          this),
                    ),
                  ],
                )
              ],
            )),
          ),
        ],
      ),
    );
  }

  Widget SphereButton(var diametere) {
    final media = MediaQuery.of(context);
    var radiuse = diametere / 2;
    double elementIndex = 2;

    ///Current index of the touchable since this is midddle button value is 2
    final indexState = Provider.of<PageIndex>(context);

    Color highlightedColor = Color.fromRGBO(101, 173, 132, 1);
    Color neutralColor = Color.fromRGBO(112, 112, 112, 1);

    _renderColor() {
      if (indexState.state.index == elementIndex) {
        return highlightedColor;
      } else
        return neutralColor;
    }

    _handleTap() {
      indexState.updateState(TabBarState(
          index: elementIndex, pushSource: PushSource.tabBarController));
    }

    return Positioned(
      left: (media.size.width - diametere) / 2 + 5,
      bottom: widget.widgetHeight - (radiuse + topspace) + 5,
      child: GestureDetector(
        onTap: () => _handleTap(),
        child: new Container(
          child: Container(
              margin: EdgeInsets.all(10),
              child: Image.asset("assets/assets/Asset 6.png")),
          height: diameter - 10,
          width: diameter - 10,
          decoration: BoxDecoration(
              color: _renderColor(), borderRadius: BorderRadius.circular(70)),
        ),
      ),
    );
  }

  Widget CustomShape(var diameter) {
    final media = MediaQuery.of(context);

    radius = diameter / 2;
    return Container(
      height: widget.widgetHeight + diameter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: widget.widgetHeight,
            width: media.size.width,
            child: CustomPaint(
              painter: diameter == null
                  ? TabBarPainter()
                  : TabBarPainter(diameter: diameter, topSpace: topspace),
            ),
          ),
          SphereButton(diameter),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ActiveLayer();
  }
}

enum ElementMode {
  netural,
  highlighted,
}

const Duration pushDelay = Duration(milliseconds: 300);

class TouchableElement extends StatelessWidget {
  final double diameter;
  final double widgetHeight;
  final String url, urlHighlighted;
  final _CustomTabBarState parent;
  final double elementIndex;
  final double pageIndex;
  TouchableElement(this.diameter, this.widgetHeight, this.url,
      this.urlHighlighted, this.elementIndex, this.pageIndex, this.parent);

  var mode = ElementMode.netural;

  void pushIndex() {}

  Widget buildImage(double globalIndex) {
    if (globalIndex == elementIndex) {
      return Image.asset(urlHighlighted);
    } else {
      return Image.asset(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final elementWidth = (((media.size.width - diameter) / 2) - 15) / 2;
    final elemenetHeight = widgetHeight - 10;
    final indexState = Provider.of<PageIndex>(context);

    void naturalizePushSource() async {
      await new Future.delayed(pushDelay);
      indexState.updateOnlyPushSource(PushSource.neutral);
    }

    return new GestureDetector(
      onTap: () {
        indexState.updateState(TabBarState(
            index: elementIndex, pushSource: PushSource.tabBarController));
        naturalizePushSource();
      },
      child: new Container(
        key: UniqueKey(),
        width: elementWidth,
        height: elemenetHeight,
        child: Container(
            padding: EdgeInsets.all(10),
            child: buildImage(indexState.state.index)),
      ),
    );
  }
}

class TabBarPainter extends CustomPainter {
  final Color paintColor = Colors.white;
  final Color shadowColor = Colors.black.withOpacity(0.15);

  /// X value is the diameter(R) of the deleter circle;
  /// 80 by default
  final double diameter;
  final double topSpace;

  TabBarPainter({this.diameter = 80, this.topSpace = 4});

  @override
  void paint(Canvas canvas, Size size) {
    double startCurve = (size.width - diameter) / 2;

    /// Start point of the curve
    double endCurve = startCurve + diameter; // End Point of the curve

    double xValueInset = diameter * 0.05;
    double yValueOffset = (diameter / 2) * 4.0 / 3.0;

    Path path = Path();
    Path shadowPath = Path();

    Paint paint = Paint();
    Paint shadowPaint = Paint();

    /// Point to make a semicircle approximation using Bezier Curve
    var firstendPoint = new Offset(endCurve, topSpace);
    var controlPoint1 =
        new Offset(startCurve + xValueInset, yValueOffset + topSpace);
    var controlPoint2 = new Offset(
        (diameter - xValueInset) + startCurve, yValueOffset + topSpace);

    var shadowfirstendPoint = new Offset(endCurve - topSpace, 0.0);
    var shadowcontrolPoint1 =
        new Offset(startCurve + xValueInset + topSpace, yValueOffset);
    var shadowcontrolPoint2 = new Offset(
        (diameter - xValueInset) + startCurve - topSpace, yValueOffset);

    //! Start sketching Shape
    path.moveTo(0.0, topSpace);
    path.lineTo(startCurve, topSpace);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, firstendPoint.dx, firstendPoint.dy);
    path.lineTo(size.width, topSpace);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    //! End sketching Shape

    //! Start sketching Shadow

    shadowPath.lineTo(startCurve + topSpace, 0.0);
    shadowPath.cubicTo(
        shadowcontrolPoint1.dx,
        shadowcontrolPoint1.dy,
        shadowcontrolPoint2.dx,
        shadowcontrolPoint2.dy,
        shadowfirstendPoint.dx,
        shadowfirstendPoint.dy);
    shadowPath.lineTo(size.width, 0.0);
    shadowPath.lineTo(size.width, size.height);
    shadowPath.lineTo(0.0, size.height);
    shadowPath.close();

    //! End Sketching Shadow
    paint.color = paintColor;
    shadowPaint.color = shadowColor;

    canvas.drawShadow(shadowPath, Colors.black, 2.0, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TabBarPainter oldDelegate) => oldDelegate != this;
}
