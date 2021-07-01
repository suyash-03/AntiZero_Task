import 'package:animate_do/animate_do.dart';
import 'package:antizero_task/Constants/colors.dart';
import 'package:antizero_task/Constants/textstyles.dart';
import 'package:antizero_task/Data/choosenData.dart';
import 'package:antizero_task/Data/profilesData.dart';
import 'package:antizero_task/Model/User.dart';
import 'package:antizero_task/Screens/filteredList.dart';
import 'package:antizero_task/Screens/profiles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SelectFilters extends StatefulWidget {
  const SelectFilters({Key key}) : super(key: key);

  @override
  _SelectFiltersState createState() => _SelectFiltersState();
}

class _SelectFiltersState extends State<SelectFilters> {
  double _value = 18;
  @override
  Widget build(BuildContext context) {
    final selectedData = Provider.of<SelectedData>(context);
    return Container(
      decoration: BoxDecoration(gradient: primaryGradient),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement<void, void>(
                    context,
                    PageTransition(
                        child: Profiles(),
                        type: PageTransitionType.leftToRightJoined,
                        childCurrent: SelectFilters()));
              },
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Builder(
          builder: (context) => Column(
            children: [
              Expanded(
                child: SizedBox(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ZoomIn(
                                  child: FlatButton.icon(
                                      onPressed: () {
                                        print(selectedData.hobbies.isEmpty);
                                        print(_value);
                                        if(selectedData.hobbies.isEmpty == true && _value == 18){
                                          SnackBar snackBar = SnackBar(content: Text("No Filters Selected"),duration: Duration(seconds: 1),);
                                          Scaffold.of(context).showSnackBar(snackBar);
                                        }
                                        else {
                                          List<User> listToPass= [];
                                          List<User> tempList = users.where((user){
                                            return user.age>= _value;
                                          }).toList();

                                          tempList.forEach((user) {
                                            for(int i=0;i<selectedData.hobbies.length;i++){
                                              if( user.interests.contains(selectedData.hobbies[i])){
                                                listToPass.add(user);
                                              }
                                            }
                                          });
                                          Navigator.pushReplacement<void,void>(context, PageTransition(
                                              child: FilteredList(listToPass), type: PageTransitionType.rightToLeftJoined,childCurrent: SelectFilters()));
                                        }

                                      },
                                      icon: FaIcon(
                                        FontAwesomeIcons.check,
                                        color: Colors.greenAccent,
                                      ),
                                      label: Text(
                                        "Apply Filters",
                                        style: primaryHeadingButton,
                                      ))),
                              ZoomIn(
                                  child: FlatButton.icon(
                                      onPressed: () {
                                        selectedData.hobbies.clear();
                                        selectedData.androidDevelopment = false;
                                        selectedData.politics= false;
                                        selectedData.hunting = false;
                                        selectedData.racing = false;
                                        selectedData.dancing = false;
                                        selectedData.origami = false;
                                        selectedData.singing = false;
                                        selectedData.cooking = false;
                                        selectedData.soccer = false;
                                        selectedData.modelling = false;
                                        selectedData.meditation = false;
                                        setState(() {
                                          _value = 18;
                                        });
                                      },
                                      icon: FaIcon(
                                        FontAwesomeIcons.times,
                                        color: Colors.deepOrange,
                                      ),
                                      label: Text(
                                        "Reset Filters",
                                        style: primaryHeadingButton,
                                      ))),
                            ],
                          ),
                        ),
                        Center(
                          child: SlideInLeft(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              height: 220,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 30, 8.0, 10),
                                    child: Text(
                                      "Choose an Age Group",
                                      style: nameStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 5, 15, 10),
                                    child: SfSlider(
                                      min: 18.0,
                                      max: 100.0,
                                      value: _value,
                                      interval: 10,
                                      stepSize: 1,
                                      showTicks: true,
                                      showLabels: true,
                                      enableTooltip: true,
                                      minorTicksPerInterval: 0,
                                      onChanged: (dynamic value) {
                                        setState(() {
                                          _value = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "People with age $_value or above",
                                    style: msSmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: SlideInLeft(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 30, 8.0, 10),
                                    child: Text(
                                      "Pick your Interests",
                                      style: nameStyle,
                                    ),
                                  ),
                                  Text(
                                    "Birds of Same Feather Flock Together",
                                    style: msSmall,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Wrap(
                                    runSpacing: 0,
                                    children: [
                                      InkWell(
                                        child: interestBox("Android Development",
                                            selectedData.androidDevelopment),
                                        onTap: () {
                                          if (selectedData.androidDevelopment ==
                                              false) {
                                            selectedData.androidDevelopment =
                                                true;
                                            selectedData.hobbies
                                                .add("Android Development");
                                          } else if (selectedData
                                                  .androidDevelopment ==
                                              true) {
                                            selectedData.androidDevelopment =
                                                false;
                                            selectedData.hobbies
                                                .remove("Android Development");
                                          }
                                        },
                                      ),
                                      InkWell(
                                        child: interestBox(
                                            "Politics", selectedData.politics),
                                        onTap: () {
                                          if (selectedData.politics == false) {
                                            selectedData.politics = true;
                                            selectedData.hobbies.add("Politics");
                                          } else if (selectedData.politics ==
                                              true) {
                                            selectedData.politics = false;
                                            selectedData.hobbies
                                                .remove("Politics");
                                          }
                                        },
                                      ),
                                      InkWell(
                                        child: interestBox(
                                            "Hunting", selectedData.hunting),
                                        onTap: () {
                                          if (selectedData.hunting == false) {
                                            selectedData.hunting = true;
                                            selectedData.hobbies.add("Hunting");
                                          } else if (selectedData.hunting ==
                                              true) {
                                            selectedData.hunting = false;
                                            selectedData.hobbies
                                                .remove("Hunting");
                                          }
                                        },
                                      ),
                                      InkWell(
                                        child: interestBox(
                                            "Racing", selectedData.racing),
                                        onTap: () {
                                          if (selectedData.racing == false) {
                                            selectedData.racing = true;
                                            selectedData.hobbies.add("Racing");
                                          } else if (selectedData.racing ==
                                              true) {
                                            selectedData.racing = false;
                                            selectedData.hobbies
                                                .remove("Racing");
                                          }
                                        },
                                      ),
                                      InkWell(
                                        child: interestBox(
                                            "Dancing", selectedData.dancing),
                                        onTap: () {
                                          if (selectedData.dancing == false) {
                                            selectedData.dancing = true;
                                            selectedData.hobbies.add("Dancing");
                                          } else if (selectedData.dancing ==
                                              true) {
                                            selectedData.dancing = false;
                                            selectedData.hobbies
                                                .remove("Dancing");
                                          }
                                        },
                                      ),
                                      InkWell(
                                        child: interestBox(
                                            "Origami", selectedData.origami),
                                        onTap: () {
                                          if(selectedData.origami == false){
                                            selectedData.origami = true;
                                            selectedData.hobbies.add("Origami");
                                          }else if(selectedData.origami == true){
                                            selectedData.origami = false;
                                            selectedData.hobbies.remove("Origami");
                                          }
                                        },
                                      ),
                                      InkWell(
                                        child: interestBox(
                                            "Singing", selectedData.singing),
                                        onTap: () {
                                          if(selectedData.singing == false){
                                            selectedData.singing = true;
                                            selectedData.hobbies.add("Singing");
                                          }else if(selectedData.singing == true){
                                            selectedData.singing = false;
                                            selectedData.hobbies.remove("Singing");
                                          }
                                        },

                                      ),
                                      InkWell(
                                        child: interestBox(
                                            "Cooking", selectedData.cooking),
                                        onTap: () {
                                          if(selectedData.cooking == false){
                                            selectedData.cooking = true;
                                            selectedData.hobbies.add("Cooking");
                                          }else if(selectedData.cooking == true){
                                            selectedData.cooking = false;
                                            selectedData.hobbies.remove("Cooking");
                                          }
                                        },
                                      ),
                                      InkWell(
                                        child: interestBox(
                                            "Soccer", selectedData.soccer),
                                        onTap: () {
                                          if(selectedData.soccer == false){
                                            selectedData.soccer = true;
                                            selectedData.hobbies.add("Soccer");
                                          }else if(selectedData.soccer == true){
                                            selectedData.soccer = false;
                                            selectedData.hobbies.remove("Soccer");
                                          }
                                        },
                                      ),
                                      InkWell(
                                        child: interestBox(
                                            "Modelling", selectedData.modelling),
                                        onTap: () {
                                          if(selectedData.modelling == false){
                                            selectedData.modelling = true;
                                            selectedData.hobbies.add("Modelling");
                                          }else if(selectedData.modelling == true){
                                            selectedData.modelling = false;
                                            selectedData.hobbies.remove("Modelling");
                                          }
                                        },
                                      ),
                                      InkWell(
                                        child: interestBox(
                                            "Meditation", selectedData.meditation),
                                        onTap: () {
                                          if(selectedData.meditation == false){
                                            selectedData.meditation = true;
                                            selectedData.hobbies.add("Meditation");
                                          }else if(selectedData.meditation == true){
                                            selectedData.meditation = false;
                                            selectedData.hobbies.remove("Meditation");
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget interestBox(String interest, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: 160,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color:
                  isSelected == true ? Colors.yellow[700] : Colors.blueAccent,
              border: Border.all(color: Colors.black)),
          child: Center(
              child: Text(
            "$interest",
            style: checkBoxStyle,
          ))),
    );
  }
}
