import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sheet_db/components/event_card.dart';
import 'package:google_sheet_db/pages/individual_club.dart';
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
import 'account.dart';
User loggedInUser;

class NonTechnicalClubPage extends StatefulWidget {
  @override
  _NonTechnicalClubPageState createState() => _NonTechnicalClubPageState();
}

class _NonTechnicalClubPageState extends State<NonTechnicalClubPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(color: Colors.white,),
        textTheme: TextTheme(),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 90.0,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('🕺🏻',style: TextStyle(fontSize: 30),),
                  SizedBox(width: 10,),
                  ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (bounds)=>LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.purple,Colors.lightBlueAccent,Colors.greenAccent],
                    ).createShader(bounds),
                    child: Text('NON-TECHNICAL CLUBS',style: TextStyle(
                      fontSize: 25.0, fontWeight: FontWeight.normal,fontFamily: 'Cubano',
                    ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              StreamBuilder(
                stream: _firestore.collection('events').where('type',isEqualTo: 'non-technical').snapshots(),       //stream: _firestore.collection('events').limit(1).snapshots(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.greenAccent,
                      ),
                    );
                  }
                  final messages = snapshot.data.docs;
                  List<ClubClass> messageBubbles=[];
                  for(var message in messages){
                    final img = message.data()['img'];
                    final name = message.data()['name'];
                    final contact = message.data()['contact'];
                    final email = message.data()['email'];
                    final faculty = message.data()['faculty'];
                    final link = message.data()['link'];
                    final register = message.data()['register'];
                    final currentUser =loggedInUser.email;
                    final card = ClubClass(data: message.data(),
                    );
                    messageBubbles.add(card);
                  }

                  return Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
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
    );
  }
}
class ClubClass extends StatelessWidget {
  ClubClass({this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            splashColor: Colors.black26,
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>DisplayDataPage(data: data,)),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image(image: NetworkImage(data['img'],),fit: BoxFit.cover,width: 150.0,height: 100.0,


              ),
            ),
          ),
          Text(data['name'],style: TextStyle(color: Colors.white,fontSize: 25.0,fontFamily: 'Cubano'),textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
