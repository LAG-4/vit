
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sheet_db/components/subheadings.dart';
import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
User loggedInUser;

class ClubUpload extends StatefulWidget {
  @override
  _ClubUploadState createState() => _ClubUploadState();
}

class _ClubUploadState extends State<ClubUpload> {

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String img;
 String contact;
 String name;
 String email;
 String faculty;
 String link;
 String register;
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: ShaderMask(
                  blendMode: BlendMode.srcATop,
                  shaderCallback: (bounds)=>LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.purple,Colors.lightBlueAccent,Colors.greenAccent],
                  ).createShader(bounds),
                  child: Icon(Icons.menu_rounded,size: 40.0,)),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Center(child: Row(
          children: [
            SizedBox(width: 50.0,),
            Image(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/Frame.png?raw=true',),),
          ],
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (bounds)=>LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.purple,Colors.lightBlueAccent,Colors.greenAccent],
              ).createShader(bounds),
              child: IconButton(onPressed: (){}, icon: Icon(Icons.home_rounded,size: 30.0,))),
          SizedBox(width: 5.0,),
          ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds)=>LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.purple,Colors.lightBlueAccent,Colors.greenAccent],
            ).createShader(bounds),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.person_outline_rounded,size: 30.0,),),),
          SizedBox(width: 5.0,),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/login%20screen.png?raw=true'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken)
          ),
        ),//BACKGROUND IMAGE
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100.0,),
                  SubHeadings(title: 'LOGO',),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      img=value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter poster link',
                      hintStyle: TextStyle(color: Colors.white,),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  SubHeadings(title: 'NAME',),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      name=value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter poster link',
                      hintStyle: TextStyle(color: Colors.white,),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SubHeadings(title: 'EMAIL',),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      email=value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter club name',
                      hintStyle: TextStyle(color: Colors.white,),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  SubHeadings(title: 'contact',),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      contact=value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter event venue',
                      hintStyle: TextStyle(color: Colors.white,),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  SubHeadings(title: 'FACULTY',),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      faculty=value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter event description',
                      hintStyle: TextStyle(color: Colors.white,),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  SubHeadings(title: 'LINK',),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      link=value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter poster link',
                      hintStyle: TextStyle(color: Colors.white,),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  SubHeadings(title: 'REGISTRATION LINK',),
                  TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                      register=value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter poster link',
                      hintStyle: TextStyle(color: Colors.white,),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 80.0,),
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
                              _firestore.collection('events').add({
                                'img': img,
                                'name':name,
                                'contact': contact,
                                'email': email,
                                'faculty': faculty,
                                'link': link,
                                'register': register,
                              });
                            },
                            child: Text("ADD CLUB",style: TextStyle(
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
