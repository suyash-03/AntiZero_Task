import 'package:animate_do/animate_do.dart';
import 'package:antizero_task/Constants/colors.dart';
import 'package:antizero_task/Constants/textstyles.dart';
import 'package:antizero_task/Data/profilesData.dart';
import 'package:antizero_task/Model/User.dart';
import 'package:antizero_task/Screens/profiles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../ProfileCard.dart';
import 'chooseFilters.dart';
import 'homepage.dart';

class FilteredList extends StatefulWidget {
  final List<User> filteredList ;
  FilteredList(this.filteredList);

  @override
  _FilteredListState createState() => _FilteredListState();
}

class _FilteredListState extends State<FilteredList> {
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
                        child: SelectFilters(),
                        childCurrent: FilteredList(widget.filteredList)));
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              FlatButton.icon(
                  icon: Icon(Icons.remove_circle,color: Colors.deepOrange,),
                  label: Text("Remove Filters",style: primaryHeadingButton,),
                  onPressed: () {
                    Navigator.pushReplacement<void, void>(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRightJoined,
                            child: Profiles(),
                            childCurrent: FilteredList(widget.filteredList)));
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
                  itemCount: widget.filteredList.length,
                  itemBuilder: (context, index) {
                    print(index);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10,top: 10),
                      child: Center(child: ZoomIn(
                        child: ProfileCard(
                          widget.filteredList[index].name,
                          widget.filteredList[index].age,
                          widget.filteredList[index].interests,
                          widget.filteredList[index].image,
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
