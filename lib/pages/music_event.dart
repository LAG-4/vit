import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sheet_db/components/event_card.dart';
import 'package:google_sheet_db/pages/account.dart';
import 'package:google_sheet_db/pages/event_solo.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sheet_db/components/subheadings.dart';
import 'package:google_sheet_db/pages/login.dart';
import '../components/event_card.dart';
import '../components/pageheading.dart';
import '../components/transparentbutton.dart';
import 'package:google_sheet_db/pages/clubandchapter.dart';
import 'package:google_sheet_db/pages/clubinfo.dart';
import 'package:google_sheet_db/pages/navbar.dart';
import 'package:intl/intl.dart';

import '../pages/clubinfo.dart';
User loggedInUser;

class MusicEvent extends StatefulWidget {
  @override
  _MusicEventState createState() => _MusicEventState();
}

class _MusicEventState extends State<MusicEvent> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String messageText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser;
      if(user!=null){
        loggedInUser = user;
        print(loggedInUser.email);
      }}
    catch(e){
      print(e);
    }
  }

  void dropdownCallback(String selectedValue){
    if(selectedValue is String){
      setState(() {
        //_dropdownValue = selectedValue;
      });
    }
  }
  String value;

  @override
  Widget build(BuildContext context) {

    DropdownMenuItem<String> buildMenuItem(String item)=> DropdownMenuItem(
        value: item,
        child: Text(item,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
        ));


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        elevation: 0,
        title:Column(
          children: [
            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (bounds)=>LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.purple,Colors.lightBlueAccent,Colors.greenAccent],
              ).createShader(bounds),
              child: Text('VIT-AP',style: TextStyle(
                  fontFamily: 'Cubano',fontSize: 19
              ),
              ),
            ),
            Text('EVENTS',style: TextStyle(fontFamily: 'Poppins',fontSize: 10.0,fontWeight: FontWeight.bold,),)
          ],
        ),
        backgroundColor: Colors.transparent,
        actions: [

          SizedBox(width: 5.0,),
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AccountScreen()));
          }, icon: Icon(Icons.person_outline_rounded,size: 30.0,color: Colors.white,),),
          SizedBox(width: 5.0,),
        ],
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/notifications1.png?raw=true'),
        //       fit: BoxFit.cover,
        //       colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.15), BlendMode.darken)
        //   ),
        // ),//BACKGROUND IMAGE
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('🎵',style: TextStyle(fontSize: 25),),
                  SizedBox(width: 10,),
                  ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (bounds)=>LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.purple,Colors.lightBlueAccent,Colors.greenAccent],
                    ).createShader(bounds),
                    child: Text('MUSIC & SINGING EVENTS',style: TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.normal,fontFamily: 'Cubano',
                    ),
                    ),
                  ),
                ],
              ),
              StreamBuilder(
                stream: _firestore.collection('clubs').where('type',isEqualTo: 'music').snapshots(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.greenAccent,
                      ),
                    );
                  }
                  final messages = snapshot.data.docs;
                  List<MessageBubble> messageBubbles=[];
                  for(var message in messages){
                    final img = message.data()['img'];
                    final name = message.data()['name'];
                    final venue = message.data()['venue'];
                    final participants = message.data()['participants'];
                    final desc = message.data()['desc'];
                    final time = message.data()['time'];
                    final cname = message.data()['cname'];
                    final date = message.data()['date'];
                    final logo = message.data()['logo'];
                    final currentUser =loggedInUser.email;
                    final card = MessageBubble(img: img, desc: desc, name : name,venue: venue,participants:participants,time: time,logo: logo,cname: cname,date: date,
                    );
                    messageBubbles.add(card);
                  }

                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: messageBubbles,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MessageBubble extends StatelessWidget {
  MessageBubble({this.img , this.desc,this.name,this.venue,this.participants,this.time,this.logo,this.cname,this.date,this.data});
  final String img;
  final String desc;
  final String name;
  final String participants;
  final String venue;
  final String time;
  final String cname;
  final String date;
  final String logo;
  final data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        splashColor: Colors.black26,
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>Rotaract()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),

            border: GradientBoxBorder(
              width: 3,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.purple,Colors.lightBlueAccent,Colors.greenAccent],
              ),),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15) ,topRight: Radius.circular(15)),
                child: Image(image: NetworkImage(img,),
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$name'.toUpperCase(), style: TextStyle(
                    color: Colors.amber,
                    fontSize: 30.0,
                    fontFamily: 'Cubano',
                  ),
                  ),
                ),
              ),
              SizedBox(height: 5.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(image: NetworkImage('$logo',),width: 50,height: 50,)),
                        SizedBox(height: 5,),
                        Text('$cname'.toUpperCase(), style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 15.0,
                          fontFamily: 'Cubano',
                        ),
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        Text('$venue'.toUpperCase(), style: TextStyle(
                          color: Colors.amber,
                          fontFamily: 'Cubano',
                          fontSize: 12.0,
                        ),
                        ),
                        Text('VENUE',style: TextStyle(
                          color: Colors.grey.shade300,
                          fontFamily: 'Cubano',
                          fontSize: 15.0,
                        ),),
                      ],
                    ),
                    Column(
                      children: [
                        Text('$date'.toUpperCase(), style: TextStyle(
                          color: Colors.amber,
                          fontFamily: 'Cubano',
                          fontSize: 15.0,
                        ),
                        ),
                        Text('$time'.toUpperCase(), style: TextStyle(
                          color: Colors.amber,
                          fontFamily: 'Cubano',
                          fontSize: 10.0,
                        ),
                        ),
                        Text('TIME',style: TextStyle(
                          color: Colors.grey.shade300,
                          fontFamily: 'Cubano',
                          fontSize: 15.0,
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0,),
            ],
          ),
        ),
      ),
    );
  }

}
