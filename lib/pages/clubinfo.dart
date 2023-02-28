import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sheet_db/components/pageheading.dart';
import 'package:google_sheet_db/components/subheadings.dart';
import 'package:url_launcher/url_launcher.dart';

import 'account.dart';
class Rotaract extends StatefulWidget {

  @override
  State<Rotaract> createState() => _RotaractState();
}

class _RotaractState extends State<Rotaract> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          actions: [
            SizedBox(width: 5.0,),
            IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AccountScreen()));
            }, icon: Icon(Icons.person_outline_rounded,size: 30.0,color: Colors.white,),),
            SizedBox(width: 5.0,),
          ],
        ),
        body: Container   (
            // decoration: BoxDecoration(
            //   image: DecorationImage(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/notifications1.png?raw=true'),
            //       fit: BoxFit.cover,
            //       colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)
            //   ),
            // ),//BACKGROUND IMAGE
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/unnamed.png?raw=true',),),
                      ),
                      PageHeading(title: 'LOOKISM'),
                      SizedBox(height: 50.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Brought To You By:',style: TextStyle(fontSize: 15,fontFamily: 'Phudu'),),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network('https://res.cloudinary.com/glide/image/fetch/f_auto,w_225,h_226,c_lfill/https%3A%2F%2Fmedia-exp1.licdn.com%2Fdms%2Fimage%2FC560BAQFLXyvfYVoAvw%2Fcompany-logo_200_200%2F0%2F1630137643540%3Fe%3D2147483647%26v%3Dbeta%26t%3DatILuhByiMuPmqHx54UhOtDwzPzMXh3EDxWKgTNJMRI'
                            ,width: 50,height: 50,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      View(title: 'Entertainment',icon: Icon(Icons.accessibility_new_rounded,color: Colors.white,),),
                      SizedBox(height: 10.0,),
                      View(title: 'Sat 10, Dec 2022',icon: Icon(Icons.calendar_today_rounded,color: Colors.white,),),
                      SizedBox(height: 10.0,),
                      View(title: '9:00 AM - 6:00 PM',icon: Icon(Icons.watch_later_rounded,color: Colors.white,),),
                      SizedBox(height: 10.0,),
                      View(title: 'AMPHITHEATRE, AB-2',icon: Icon(Icons.pin_drop,color: Colors.white,),),
                      SizedBox(height: 10.0,),
                      View(title: '9192837249',icon: Icon(Icons.phone,color: Colors.white,),),
                      SizedBox(height: 10.0,),
                      View(title: '\$ 5',icon: Icon(Icons.payments_rounded,color: Colors.white,),),
                      SizedBox(height: 10.0,),
                      View(title: 'www.club.com',icon: Icon(Icons.web_sharp,color: Colors.white,),),
                      SizedBox(height: 10.0,),
                      View(title: 'www.eventlink.com',icon: Icon(Icons.link_rounded,color: Colors.white,),),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text('ifhgwyeiuiawehfuhewygvfuhaewvygfbuiewgfyunewabhgviwuaebgvywggfugunfygewuifgtyawgu4awuinuiarweghwahey8ghewajgu9wahgwheugh',
                        style: TextStyle(fontSize: 20,fontFamily: 'Phudu',),
                        ),
                      ),
                      ElevatedButton(onPressed: (){
                        launch('https://www.google.com/forms/about/');
                      }, child: Text('REGISTER NOW'),),
                    ],

                  ),//MAIN CONTENT
                ),
              ),
            )//APP BODY
        ),

      ),
    );
  }
}

class View extends StatelessWidget {
View({this.title,this.icon});
final icon;
final title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 25.0,),
        Container(
          height: 50,
          width: 50,
          child: icon,
          color: Colors.grey,
        ),
        SizedBox(width: 20.0,),
        Text('$title',style: TextStyle(color: Colors.white,fontSize: 20.0,fontFamily: 'Phudu'),),
      ],
    );
  }
}



