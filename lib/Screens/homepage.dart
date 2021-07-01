import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'LandingPages/landingpage1.dart';
import 'LandingPages/landingpage2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController();

  void pageForward(){
    pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
  void pageBackward(){
    pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        LandingPage1(pageForward),LandingPage2(pageBackward)
      ],
    );
  }
}
