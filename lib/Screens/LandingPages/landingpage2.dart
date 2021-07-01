import 'package:animate_do/animate_do.dart';
import 'package:antizero_task/Constants/colors.dart';
import 'package:antizero_task/Constants/textstyles.dart';
import 'package:antizero_task/Screens/profiles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LandingPage2 extends StatefulWidget {
  final void Function() pageBackward;
  LandingPage2(this.pageBackward);

  @override
  _LandingPage2State createState() => _LandingPage2State();
}

class _LandingPage2State extends State<LandingPage2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: primaryGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            ZoomIn(
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: IconButton(
                      iconSize: 50,
                      color: Colors.blueAccent,
                      onPressed: () {
                       widget.pageBackward();
                      },
                      icon: Icon(Icons.arrow_upward),
                    )),
              ),
            ),
            SizedBox(height: 100,),
            ZoomIn(
              child: RichText(
                  text: TextSpan(
                      text:  "Let's ",
                      style: primaryHeading,
                      children: const<TextSpan>[
                        TextSpan(text: "Go\n",style: TextStyle(color: Color(0xff48dbfb)),),
                        TextSpan(text: "Already",style: TextStyle(fontSize: 30)),
                      ]
                  )
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ZoomIn(
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange[200],
                        offset: const Offset(
                          5.0,
                          8.0,
                        ),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xff1856e3)),
                child: MaterialButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Show Profiles",
                        style: TextStyle(color: Colors.white,fontFamily: 'Montserrat'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff48dbfb)
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushReplacement<void, void>(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeftJoined,
                            child: Profiles(),childCurrent: LandingPage2(widget.pageBackward)));
                  },
                ),
              ),
            ),
            SizedBox(height: 50,),
            Expanded(
              child: Container(
                child: FadeInUp(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 350,
                      child: Image.asset(
                        'assets/poseman.png',
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
