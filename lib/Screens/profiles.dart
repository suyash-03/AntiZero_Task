import 'package:animate_do/animate_do.dart';
import 'package:antizero_task/Constants/colors.dart';
import 'package:antizero_task/Constants/textstyles.dart';
import 'package:antizero_task/Data/profilesData.dart';
import 'package:antizero_task/Screens/chooseFilters.dart';
import 'package:antizero_task/Screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../ProfileCard.dart';

class Profiles extends StatefulWidget {

  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(gradient: primaryGradient),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement<void, void>(
                    context,
                    PageTransition(
                        type: PageTransitionType.leftToRightJoined,
                        child: HomePage(),
                        childCurrent: Profiles()));
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              FlatButton.icon(
                  icon: Icon(Icons.filter_alt_rounded,color: Colors.white,),
                  label: Text("Filter",style: primaryHeadingButton,),
                  onPressed: () {
                    Navigator.pushReplacement<void, void>(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeftJoined,
                            child: SelectFilters(),
                            childCurrent: Profiles()));
                  })
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    print(index);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10,top: 10),
                      child: Center(child: ZoomIn(
                        child: ProfileCard(
                          users[index].name,
                          users[index].age,
                          users[index].interests,
                          users[index].image,
                        ),
                      )),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
