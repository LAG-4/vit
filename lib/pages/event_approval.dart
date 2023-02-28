import 'package:flutter/material.dart';
import 'package:google_sheet_db/components/pageheading.dart';
import 'package:google_sheet_db/components/subheadings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sheet_db/upload/eventupload.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import 'account.dart';
import 'clubinfo.dart';

class EventApproval extends StatefulWidget {
  @override
  State<EventApproval> createState() => _EventApprovalState();
}

class _EventApprovalState extends State<EventApproval> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
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
            SizedBox(height: 120,),
            SubHeadings(title: 'PERMISSIONS',),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>EventUpload()),
                );
              },
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('NEW',style: TextStyle(fontSize: 25),),
                        Icon(Icons.add_box_rounded,size: 30,),
                        Text('EVENT',style: TextStyle(fontSize: 25),),
                      ],
                    ),
                  )),
            ),
            SizedBox(height: 20,),
            SubHeadings(title: 'ONGOING/RECENT',),
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
                  final card = MessageBubble(img: img, desc: desc, name : name,venue: venue,participants:participants,time: time,
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
            SubHeadings(title: 'PAST EVENTS',),
            StreamBuilder(
              stream: _firestore.collection('clubs').where('status',isEqualTo: true).snapshots(),
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
                  final cname = message.data()['cname'];
                  final date = message.data()['date'];
                  final logo = message.data()['logo'];
                  final card = EventBubble(img: img, desc: desc, name : name,venue: venue,participants:participants,time: time,logo: logo,cname: cname,date: date,
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
          MaterialPageRoute(builder: (context)=>EventApproval()),
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
  EventBubble({this.img , this.desc,this.name,this.venue,this.participants,this.time,this.logo,this.cname,this.date});
  final String img;
  final String desc;
  final String name;
  final String participants;
  final String venue;
  final String time;
  final String cname;
  final String date;
  final String logo;
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
