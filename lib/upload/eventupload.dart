import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sheet_db/components/pageheading.dart';
import 'package:google_sheet_db/components/subheadings.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../pages/account.dart';
User loggedInUser;

class EventUpload extends StatefulWidget {
  @override
  _EventUploadState createState() => _EventUploadState();
}

class _EventUploadState extends State<EventUpload> {

  final _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  String img;
  String name;
  String desc;
  String venue;
  String date;
  String phone;
  String fee;
  String img1;
  String img2;
  String img3;
  String type;
  String gform;
  String status='false';



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
      }}
    catch(e){
      print(e);
    }
  }


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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  PageHeading(title: 'EVENT UPLOAD'),
                  SizedBox(height: 40,),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      img=value;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)
                      ),
                      labelText: 'POSTER LINK :',
                      labelStyle: TextStyle(color: Colors.white,fontSize: 16),
                      hintText: 'ENTER POSTER LINK',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
              SizedBox(height: 20,),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      name=value;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)
                      ),
                      labelText: 'EVENT NAME :',
                      labelStyle: TextStyle(color: Colors.white,fontSize: 16),
                      hintText: 'ENTER EVENT NAME',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      date=value;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)
                      ),
                      labelText: 'EVENT DATE :',
                      labelStyle: TextStyle(color: Colors.white,fontSize: 16),
                      hintText: 'ENTER EVENT DATE',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      venue=value;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)
                      ),
                      labelText: 'EVENT VENUE :',
                      labelStyle: TextStyle(color: Colors.white,fontSize: 16),
                      hintText: 'ENTER EVENT VENUE',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      fee=value;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)
                      ),
                      labelText: 'EVENT FEES (If Any) :',
                      labelStyle: TextStyle(color: Colors.white,fontSize: 16),
                      hintText: 'ENTER EVENT FEES',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      phone=value;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)
                      ),
                      labelText: 'CONTACT NUMBER :',
                      labelStyle: TextStyle(color: Colors.white,fontSize: 16),
                      hintText: 'ENTER CONTACT NUMBER',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      gform=value;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)
                      ),
                      labelText: 'GOOGLE FORM LINK :',
                      labelStyle: TextStyle(color: Colors.white,fontSize: 16),
                      hintText: 'PASTE GOOGLE FORM LINK',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('EVENT TYPE :',style: TextStyle(color: Colors.white,fontSize: 16),)],),
                  SizedBox(height: 20,),
                  Container(
                    color: Colors.white54,
                    child: DropdownButtonFormField(
                      items: [
                        DropdownMenuItem(
                          child: Text('Coding and Technical',style: TextStyle(color: Colors.blueGrey),),
                          value: 'option_1',
                        ),
                        DropdownMenuItem(
                          child: Text('Clean and Service',style: TextStyle(color: Colors.blueGrey),),
                          value: 'option_2',
                        ),
                        DropdownMenuItem(
                          child: Text('Cultural',style: TextStyle(color: Colors.blueGrey),),
                          value: 'option_3',
                        ),
                        DropdownMenuItem(
                          child: Text('Entertainment',style: TextStyle(color: Colors.blueGrey),),
                          value: 'option_4',
                        ),
                      ],
                      onChanged: (value) {
                        // do something with the value
                      },
                    ),
                  ),

                  SizedBox(height: 20,),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      desc=value;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)
                      ),
                      labelText: 'EVENT DESCRIPTION :',
                      labelStyle: TextStyle(color: Colors.white,fontSize: 16),
                      hintText: 'ENTER EVENT DETAILS',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 40,),
                  SubHeadings(title: 'PHOTOS & VIDEOS',),
                  SizedBox(height: 20,),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      img1=value;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)
                      ),
                      labelText: 'IMAGE 1 LINK :',
                      labelStyle: TextStyle(color: Colors.white,fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      img2=value;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)
                      ),
                      labelText: 'IMAGE 2 LINK :',
                      labelStyle: TextStyle(color: Colors.white,fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      img3=value;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)
                      ),
                      labelText: 'IMAGE 3 LINK :',
                      labelStyle: TextStyle(color: Colors.white,fontSize: 16),

                    ),
                  ),


                  SizedBox(height: 50,),

                  Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.purple,
                            Colors.lightBlueAccent,
                            Colors.greenAccent,
                            //add more colors
                          ]),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.50), //shadow for button
                            blurRadius: 9) //blur radius of shadow
                      ]
                  ),
                  child:SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          onSurface: Colors.transparent,
                          shadowColor: Colors.transparent,
                          //make color or elevated button transparent
                        ),
                        onPressed: () {

                          //Implement send functionality.
                          _firestore.collection('clubs').add({
                            'img': img,
                            'name':name,
                            'venue':venue,
                            'desc':desc,
                            'date': date,
                            'phone': phone,
                            'fee':  fee,
                            'img1': img1,
                            'img2': img2,
                            'img3': img3,
                            'type': type,
                            'gform': gform,
                            'status': 'false',
                          });
                        },
                        child: Text("ADD EVENT",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),)
                    ),
                  ),
                ),
              ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text,this.isMe});
  final String sender;
  final String text;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender,style: TextStyle(fontSize: 12.0,color: Colors.black54),),
          Material(
            elevation: 5.0,
            borderRadius: isMe ? BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),) :  BorderRadius.only(topRight: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),),
            color: isMe ? Colors.lightBlue : Colors.greenAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
              child: Text(text,
                style: TextStyle(fontSize: 15.0,color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
