import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:antizero_task/Constants/colors.dart';
import 'package:antizero_task/Constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LandingPage1 extends StatefulWidget {
  final void Function() pageForward;
  LandingPage1(this.pageForward);

  @override
  _LandingPage1State createState() => _LandingPage1State();
}

class _LandingPage1State extends State<LandingPage1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: secondaryGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                color: secondaryBg,
                height: MediaQuery.of(context).size.height /1.4,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeInUp(
                          child: Image.asset(
                            'assets/img3.png',
                            height: 800,
                            width: 800,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ZoomIn(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text(
                      'Meet',
                      style: primaryHeading,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  SizedBox(
                    height: 80,
                    width: 120,
                    child: DefaultTextStyle(
                      style: primaryHeadingBlue,
                      child:
                      AnimatedTextKit(repeatForever: true, animatedTexts: [
                        RotateAnimatedText('Thrilling'),
                        RotateAnimatedText('Exciting'),
                        RotateAnimatedText('Similar'),
                      ]),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  SizedBox(
                    child: Text(
                      'People',
                      style: primaryHeading,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: ZoomIn(
                  child: Container(
                      child: IconButton(
                        iconSize: 50,
                        color: Colors.blueAccent,
                        onPressed: () {
                          widget.pageForward();
                        },
                        icon: Icon(Icons.arrow_downward_rounded),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
