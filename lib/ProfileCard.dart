import 'package:antizero_task/Constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileCard extends StatefulWidget {
  final String name;
  final int age;
  final List<String> interests;
  final String image;
  ProfileCard(this.name,this.age,this.interests,this.image);

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Stack(
        children: [
          Center(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('${widget.image}')
                  ),
                  SizedBox(height: 20,),
                  Text(widget.name,style: nameStyle,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40,5,40,8),
                    child: Divider(color: Colors.grey[800],thickness: 2,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.facebook,color: Colors.blue[800],),
                      SizedBox(width: 10,),
                      FaIcon(FontAwesomeIcons.twitter,color: Colors.blueAccent,),
                      SizedBox(width: 10,),
                      FaIcon(FontAwesomeIcons.snapchat,color: Colors.yellow[800],),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Age: ${widget.age}",style: sfStyle,),
                  SizedBox(height: 10,),
                  Text("Enjoys:  " + widget.interests.toString().substring(1,widget.interests.toString().length-1) , style: msSmall,)
                ],
              )
          )
        ],
      ),
    );
  }
}
