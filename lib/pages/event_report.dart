import 'package:flutter/material.dart';
import 'package:google_sheet_db/components/pageheading.dart';
import 'package:google_sheet_db/components/subheadings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sheet_db/pages/event_approval.dart';
import 'package:google_sheet_db/upload/eventupload.dart';

import 'account.dart';

class EventReport extends StatefulWidget {
  @override
  State<EventReport> createState() => _EventReportState();
}

class _EventReportState extends State<EventReport> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
            Text('EVENTS',style: TextStyle(fontFamily: 'Poppins',fontSize: 10.0,fontWeight: FontWeight.bold,shadows: <Shadow>[
              Shadow(
                offset: Offset(3.0, 1.0),
                blurRadius: 15.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),]),)
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PageHeading(title: 'EVENT REPORT',),
            SizedBox(height: 20,),
            Text('Pending Reports'.toUpperCase(),style: TextStyle(color: Colors.red),),
            SizedBox(height: 20,),
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
                List<EventBubble> messageBubbles=[];
                for(var message in messages){
                  final img = message.data()['img'];
                  final name = message.data()['name'];
                  final venue = message.data()['venue'];
                  final participants = message.data()['participants'];
                  final desc = message.data()['desc'];
                  final time = message.data()['time'];
                  final card = EventBubble(img: img, desc: desc, name : name,venue: venue,participants:participants,time: time,
                  );
                  messageBubbles.add(card);
                }

                return Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
                    children: messageBubbles,
                  ),
                );
              },
            ),
            SizedBox(height: 20,),
            Text('Past Reports'.toUpperCase(),style: TextStyle(color: Colors.lightBlue),),
            SizedBox(height: 20,),
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
                List<EventBubble> messageBubbles=[];
                for(var message in messages){
                  final img = message.data()['img'];
                  final name = message.data()['name'];
                  final venue = message.data()['venue'];
                  final participants = message.data()['participants'];
                  final desc = message.data()['desc'];
                  final time = message.data()['time'];
                  final card = EventBubble(img: img, desc: desc, name : name,venue: venue,participants:participants,time: time,
                  );
                  messageBubbles.add(card);
                }

                return Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
                    children: messageBubbles,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.img , this.desc,this.name,this.venue,this.participants,this.time});
  final String img;
  final String desc;
  final String name;
  final String participants;
  final String venue;
  final String time;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(onPressed: (){
        Navigator.push(context,
          MaterialPageRoute(builder: (context)=>null),
        );
      },
          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$name'.toUpperCase(),style: TextStyle(fontSize: 15),),
                ElevatedButton(onPressed: (){}, child: Text('View Status'))
              ],
            ),
          )),
    );
  }
}

class EventBubble extends StatelessWidget {
  EventBubble({this.img , this.desc,this.name,this.venue,this.participants,this.time});
  final String img;
  final String desc;
  final String name;
  final String participants;
  final String venue;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        splashColor: Colors.black26,
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>null),
          );
        },
        child: Card(color: Colors.blueGrey.shade900,
          shadowColor: Colors.purple.shade900,
          elevation: 10,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: Image(image: NetworkImage(img,),
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$name'.toUpperCase(), style: TextStyle(
                    color: Colors.white,
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
                        Text('$participants'.toUpperCase(), style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                        ),
                        ),
                        Text('PARTICIPANTS',style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),),
                      ],
                    ),
                    Column(
                      children: [
                        Text('$venue'.toUpperCase(), style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                        ),
                        ),
                        Text('VENUE',style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),),
                      ],
                    ),
                    Column(
                      children: [
                        Text('$time'.toUpperCase(), style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                        ),
                        ),
                        Text('TIME',style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              Center(
                child: Text('$desc'.toUpperCase(), style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 15.0,
                ),
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
