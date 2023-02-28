import 'package:flutter/material.dart';
import 'package:google_sheet_db/components/subheadings.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../components/pageheading.dart';
import 'account.dart';
import 'event_approval.dart';
class EventNumberList extends StatefulWidget {


  @override
  State<EventNumberList> createState() => _EventNumberListState();
}

class _EventNumberListState extends State<EventNumberList> {
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                PageHeading(title: 'CLUB LIST',),
                SizedBox(height: 20,),
                Box(title: '#1 ROTARACT CLUB',number: '20',),
                Box(title: '#2 BTH CLUB',number: '19',),
                Box(title: '#3 LIT-DAC CLUB',number: '15',),
                Box(title: '#4 GDSC CLUB',number: '14',),
                Box(title: '#5 KUGE GEMU CLAN',number: '12',),
                Box(title: '#6 OTAKU HAVEN',number: '10',),
                Box(title: '#7 OASIS CLUB',number: '9',),
                Box(title: '#8 CSI CLUB',number: '7',),
                Box(title: '#9 NGC CLUB',number: '3',),
                Box(title: '#10 ADVENTURE CLUB',number: '1',),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  Box({this.title,this.number});
  final String title;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('$title',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold,fontFamily: 'Phudu'),),
              Text('$number',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold,fontFamily: 'Phudu'),),
            ],
          ),
        ),
      ),
    );
  }
}
