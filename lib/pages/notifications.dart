import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sheet_db/components/pageheading.dart';
import 'package:google_sheet_db/pages/clubinfo.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'account.dart';
import 'navbar.dart';

class NotificationPage extends StatefulWidget {

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String messageText;
  @override

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          backgroundColor: Colors.black,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
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
            child: SafeArea(
                child: Center(
                  child: Column(
                  children: [
                  SizedBox(height: 30.0,),
                  PageHeading(title: 'NOTIFICATIONS'),
                    StreamBuilder(
                      stream: _firestore.collection('notifications').snapshots(),
                      builder: (context,snapshot){
                        if(!snapshot.hasData){
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.greenAccent,
                            ),
                          );
                        }
                        final messages = snapshot.data.docs;
                        List<NotificationMessage> messageBubbles=[];
                        for(var message in messages){
                          final img = message.data()['img'];
                          final name = message.data()['name'];
                          final venue = message.data()['venue'];
                          final link = message.data()['link'];
                          final desc = message.data()['desc'];
                          final card = NotificationMessage(img: img, desc: desc, name : name,venue: venue,link:link,
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
            ),
          ),
        ) ,
    );
  }
}
class NotificationMessage extends StatefulWidget {

  NotificationMessage({this.img , this.desc,this.name,this.venue,this.link});
  final String img;
  final String desc;
  final String name;
  final String link;
  final String venue;

  @override
  State<NotificationMessage> createState() => _NotificationMessageState();
}

class _NotificationMessageState extends State<NotificationMessage> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: (){
          setState(() {
            isVisible =! isVisible;
          });
        },
        child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),

            border: GradientBoxBorder(
              width: 5,
              gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.purple,Colors.lightBlueAccent,Colors.greenAccent],
            ),),
          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(widget.img,height: 150.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(widget.name.toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                if (isVisible)
                  Text(widget.desc,style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}