import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sheet_db/components/subheadings.dart';
import 'package:google_sheet_db/pages/chatscreen.dart';
import 'package:google_sheet_db/pages/history.dart';
import 'package:google_sheet_db/pages/individual_club.dart';
import 'package:google_sheet_db/pages/navbar.dart';
import 'package:google_sheet_db/pages/navbar2.dart';
import 'package:google_sheet_db/pages/student_welfare_home.dart';
import 'package:google_sheet_db/upload/clubupload.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:popup_card/popup_card.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import '../theme_provider.dart';


class AccountScreen extends StatefulWidget {

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
            _auth.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
          }, icon: Icon(Icons.logout_rounded,size: 30.0,color: Colors.white,),),
          SizedBox(width: 5.0,),
        ],
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/screen.png?raw=true'),
        //       fit: BoxFit.cover,
        //       colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken)
        //   ),
        // ),//BACKGROUND IMAGE
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60.0,),
              CircleAvatar(child: Icon(Icons.person,size: 120.0,),radius: 70.0,backgroundColor: Colors.grey,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(FirebaseAuth.instance.currentUser.email,style: TextStyle(color: Colors.white, fontSize: 12.0,fontWeight: FontWeight.bold),),
                    ),
                    SubHeadings(title: '21BCE7965',)
                  ],
                ),
              ),
              AccountOptions(text: 'My History',link: NavBarTwo(),icon: Icon(Icons.history,color: Colors.blueAccent,size: 35.0,),),
              AccountOptions(text: 'Conversations',link: ChatScreen(),icon: Icon(Icons.chat_outlined,color: Colors.pinkAccent,size: 35.0,),),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SubHeadings(title: 'REACH US',),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 18),
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
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: IconButton(onPressed: (){
                            launch('https://www.google.com/');
                          }, icon: Icon(Icons.web_rounded,color: Colors.lightBlueAccent,size: 35.0,),),
                        ),
                        TextButton(onPressed: (){
                          launch('https://www.google.com/');
                        }, child: Text( 'Website',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w300,fontFamily: 'Phudu'),),),
                        IconButton(onPressed: (){
                          launch('https://www.google.com/');
                        }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),),
                      ],
                    ),
                  ),
                ),
              ),//website
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 18),
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
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: IconButton(onPressed: (){
                            launch('mailto:vec.sripto@gmail.com');
                          }, icon:  Icon(Icons.contact_mail_rounded,color: Colors.greenAccent,size: 35.0,),),
                        ),
                        TextButton(onPressed: (){
                          launch('mailto:vec.sripto@gmail.com');
                        }, child: Text('Contact Us',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w300,fontFamily: 'Phudu'),),),
                        IconButton(onPressed: (){
                          launch('mailto:vec.sripto@gmail.com');
                        }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),),
                      ],
                    ),
                  ),
                ),
              ),//website
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SubHeadings(title: 'DEVELOPERS',),
              ),
              PopupItemLauncher(
                tag: 'test',
                child:  Container(
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
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Icon(Icons.person,color: Colors.amber,size: 35.0,),
                        ),
                        Text( 'SRI VARDHAN YELURI',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w300,fontFamily: 'Phudu'),),
                        Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                      ],
                    ),
                  ),
                ),
                popUp: PopUpItem(
                  padding: EdgeInsets.all(8), // Padding inside of the card
                  color: Colors.white, // Color of the card
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // Shape of the card
                  elevation: 20, // Elevation of the card
                  tag: 'test', // MUST BE THE SAME AS IN `PopupItemLauncher`
                  child: Container(
                    width: 500,
                    height: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(radius: 50,child: Icon(Icons.person,size: 80,),),
                              SizedBox(width: 15,),
                              Column(
                                children: [
                                  Text('SRI VARDHAN YELURI',style: TextStyle(fontFamily: 'Phudu',fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),),
                                  Text('VEC LEAD',style: TextStyle(fontFamily: 'Phudu',fontSize: 15, fontWeight: FontWeight.normal,color: Colors.black),),
                                  Text('21BCB7144',style: TextStyle(fontFamily: 'Phudu',fontSize: 15, fontWeight: FontWeight.normal,color: Colors.black),),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text('"Quote"',style: TextStyle(fontFamily: 'Phudu',fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                          SizedBox(height: 20,),
                          Text('REACH OUT:',style: TextStyle(fontFamily: 'Phudu',fontSize: 10,fontWeight: FontWeight.normal,color: Colors.black),),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Image.network('https://cdn-icons-png.flaticon.com/512/1409/1409946.png',width: 30,),
                                  TextButton(onPressed: (){
                                    launch('https://www.instagram.com/lag_aryan/');
                                  }, child: Text('Instagram')),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.network('https://cdn-icons-png.flaticon.com/512/2504/2504923.png',width: 30,),
                                  TextButton(onPressed: (){
                                    launch('https://www.linkedin.com/in/aryan-gupta-b794309a/');
                                  }, child: Text('Linked-In')),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ), // Your custom child widget.
                ),
              ),//sri vardhan
              PopupItemLauncher(
                  tag: 'test',
                  child:  Container(
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
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Icon(Icons.person,color: Colors.lime,size: 35.0,),
                          ),
                          Text( 'ARYAN GUPTA',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w300,fontFamily: 'Phudu'),),
                          Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                        ],
                      ),
                    ),
                  ),
                  popUp: PopUpItem(
                  padding: EdgeInsets.all(8), // Padding inside of the card
          color: Colors.white, // Color of the card
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // Shape of the card
          elevation: 20, // Elevation of the card
          tag: 'test', // MUST BE THE SAME AS IN `PopupItemLauncher`
          child: Container(
            width: 500,
              height: 300,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.network('https://sdk.bitmoji.com/render/panel/20048676-99921853394_1-s5-v1.png?transparent=1&palette=1&scale=1',width: 120,),
                        SizedBox(width: 15,),
                        Column(
                          children: [
                            Text('ARYAN GUPTA',style: TextStyle(fontFamily: 'Phudu',fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),),
                            Text('FLUTTER DEVELOPER',style: TextStyle(fontFamily: 'Phudu',fontSize: 15, fontWeight: FontWeight.normal,color: Colors.black),),
                            Text('21BCE7965',style: TextStyle(fontFamily: 'Phudu',fontSize: 15, fontWeight: FontWeight.normal,color: Colors.black),),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text('"I am just good at every video game i play"',style: TextStyle(fontFamily: 'Phudu',fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),
                    SizedBox(height: 20,),
                    Text('REACH OUT:',style: TextStyle(fontFamily: 'Phudu',fontSize: 10,fontWeight: FontWeight.normal,color: Colors.black),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Image.network('https://cdn-icons-png.flaticon.com/512/1409/1409946.png',width: 30,),
                            TextButton(onPressed: (){
                              launch('https://www.instagram.com/tusharnaidu301/');
                            }, child: Text('Instagram')),
                          ],
                        ),
                        Row(
                          children: [
                            Image.network('https://cdn-icons-png.flaticon.com/512/2504/2504923.png',width: 30,),
                            TextButton(onPressed: (){
                              launch('https://www.linkedin.com/in/tushar-naidu-97182a248/');
                            }, child: Text('Linked-In')),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
          ), // Your custom child widget.
        ),
              ),//aryan
              PopupItemLauncher(
                tag: 'test',
                child:  Container(
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
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Icon(Icons.person,color: Colors.lime,size: 35.0,),
                        ),
                        Text( 'TUSHAR NAIDU',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w300,fontFamily: 'Phudu'),),
                        Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                      ],
                    ),
                  ),
                ),
                popUp: PopUpItem(
                  padding: EdgeInsets.all(8), // Padding inside of the card
                  color: Colors.white, // Color of the card
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // Shape of the card
                  elevation: 20, // Elevation of the card
                  tag: 'test', // MUST BE THE SAME AS IN `PopupItemLauncher`
                  child: Container(
                    width: 500,
                    height: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.network('https://sdk.bitmoji.com/render/panel/20048676-99921853394_1-s5-v1.png?transparent=1&palette=1&scale=1',width: 120,),
                              SizedBox(width: 15,),
                              Column(
                                children: [
                                  Text('TUSHAR NAIDU',style: TextStyle(fontFamily: 'Phudu',fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),),
                                  Text('FLUTTER DEVELOPER',style: TextStyle(fontFamily: 'Phudu',fontSize: 15, fontWeight: FontWeight.normal,color: Colors.black),),
                                  Text('21BCB7073',style: TextStyle(fontFamily: 'Phudu',fontSize: 15, fontWeight: FontWeight.normal,color: Colors.black),),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text('"Keep Growing"',style: TextStyle(fontFamily: 'Phudu',fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),
                          SizedBox(height: 20,),
                          Text('REACH OUT:',style: TextStyle(fontFamily: 'Phudu',fontSize: 10,fontWeight: FontWeight.normal,color: Colors.black),),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Image.network('https://cdn-icons-png.flaticon.com/512/1409/1409946.png',width: 30,),
                                  TextButton(onPressed: (){
                                    launch('https://www.instagram.com/lag_aryan/');
                                  }, child: Text('Instagram')),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.network('https://cdn-icons-png.flaticon.com/512/2504/2504923.png',width: 30,),
                                  TextButton(onPressed: (){
                                    launch('https://www.linkedin.com/in/aryan-gupta-b794309a/');
                                  }, child: Text('Linked-In')),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ), // Your custom child widget.
                ),
              ),//tushar
            ],
          ),
        ),
      ),
    ),
    );
  }
}



class AccountOptions extends StatelessWidget {
AccountOptions({this.text,this.link,this.icon,this.color});
final text;
final link;
final icon;
final color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 18),
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
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: color,
                child: icon,
              ),
              TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>link));
              }, child: Text(text,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300,fontFamily: 'Phudu',color: Colors.white),),),
              IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>link));
              }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),),
            ],
          ),
        ),
      ),
    );
  }
}


