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

class EventCards extends StatefulWidget {
  @override
  _EventCardsState createState() => _EventCardsState();
}

class _EventCardsState extends State<EventCards> {
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

  final items = ['TODAY','THIS WEEK','THIS MONTH',];
  String value;

  @override
  Widget build(BuildContext context) {
    List months =
    ['JANUARY', 'FEBRUARY', 'MARCH', 'APRIL', 'MARCH','JUNE','JULY','AUGUST','SEPTEMBER','OCTOBER','NOVEMBER','DECEMBER'];
    var time = DateTime.now();
    var current_mon = time.month;

    DropdownMenuItem<String> buildMenuItem(String item)=> DropdownMenuItem(
        value: item,
        child: Text(item,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
        ));


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        textTheme: TextTheme(),
          iconTheme: IconThemeData(
            color: Colors.black
          ),
        automaticallyImplyLeading: false,
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
                  fontFamily: 'Kavoon',fontSize: 19
              ),
              ),
            ),
            Text('EVENTS',style: TextStyle(fontFamily: 'Poppins',fontSize: 10.0,fontWeight: FontWeight.bold,),)
          ],
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: (){
            showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder( // <-- SEE HERE
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                builder: (context) {
                  return Container(
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("What's Your",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 40.0),),
                              IconButton(onPressed: (){}, icon: Icon(Icons.close_rounded,size: 40.0,),),
                            ],
                          ),
                          Text("plan for today?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40.0),),
                          SizedBox(height: 10.0,),
                          Text("Choose your favourite activity from below :",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15.0,color: Colors.grey),),
                          SizedBox(height: 10.0,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(height: 5.0,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: IconButton(onPressed: (){},
                                          icon: Icon(Icons.code_rounded,size: 30.0,),
                                        ),
                                        color: Colors.grey,
                                      ),
                                      TextButton(onPressed: (){}, child: Text('Coding & Technical',style: TextStyle(color: Colors.grey.shade700,fontSize: 20.0),))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: IconButton(onPressed: (){},
                                          icon: Icon(Icons.cleaning_services_rounded,size: 30.0,),
                                        ),
                                        color: Colors.grey,
                                      ),
                                      TextButton(onPressed: (){}, child: Text('Clean & Service',style: TextStyle(color: Colors.grey.shade700,fontSize: 20.0),))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: IconButton(onPressed: (){},
                                          icon: Icon(Icons.music_note_rounded,size: 30.0,),
                                        ),
                                        color: Colors.grey,
                                      ),
                                      TextButton(onPressed: (){}, child: Text('Music & Singing',style: TextStyle(color: Colors.grey.shade700,fontSize: 20.0),))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: IconButton(onPressed: (){},
                                          icon: Icon(Icons.accessibility_new_rounded,size: 30.0,),
                                        ),
                                        color: Colors.grey,
                                      ),
                                      TextButton(onPressed: (){}, child: Text('Dancing & DJ',style: TextStyle(color: Colors.grey.shade700,fontSize: 20.0),))
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }, icon: Icon(Icons.settings_input_composite_outlined,size: 30.0,color: Colors.white,)),
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
        child: Flexible(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 120.0,),
                PageHeading(title: 'EVENTS'),
                SubHeadings(title: '${months[current_mon-1]}',),
                StreamBuilder(
                  stream: _firestore.collection('clubs').snapshots(),
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
                      child: ListView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
                        children: messageBubbles,
                      ),
                    );
                  },
                ),
              ],
            ),
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
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0,
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
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        Text('$venue'.toUpperCase(), style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                        ),
                        ),
                        Text('VENUE',style: TextStyle(
                          color: Colors.grey.shade300,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),),
                      ],
                    ),
                    Column(
                      children: [
                        Text('$date'.toUpperCase(), style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                        ),
                        ),
                        Text('$time'.toUpperCase(), style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.normal,
                          fontSize: 10.0,
                        ),
                        ),
                        Text('TIME',style: TextStyle(
                          color: Colors.grey.shade300,
                          fontWeight: FontWeight.bold,
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
