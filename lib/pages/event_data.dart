import 'package:flutter/material.dart';
import 'package:google_sheet_db/components/subheadings.dart';
import 'package:google_sheet_db/pages/event_number_clublist.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../components/pageheading.dart';
import 'account.dart';
import 'event_approval.dart';
class EventSummary extends StatefulWidget {


  @override
  State<EventSummary> createState() => _EventSummaryState();
}

class _EventSummaryState extends State<EventSummary> {
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
          child: Column(
            children: [
              PageHeading(title: 'EVENTS DATA',),
             SizedBox(height: 20,),
             SubHeadings(title: 'THIS MONTH',),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                child: Container(
                  height: 150,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>EventNumberList()),
                          );
                        },
                          child: Column(
                            children: [
                              Text('TOTAL EVENTS:',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold,fontFamily: 'Phudu'),),
                              Text('86',style: TextStyle(color: Colors.white,fontSize: 50.0,fontWeight: FontWeight.bold,fontFamily: 'Phudu'),),
                            ],
                          ),),

                      ],
                    ),
                  ),
                ),
              ),
              SubHeadings(title: 'THIS YEAR',),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                child: Container(
                  height: 150,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>EventNumberList()),
                          );
                        },
                          child: Column(
                            children: [
                              Text('TOTAL EVENTS:',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold,fontFamily: 'Phudu'),),
                              Text('156',style: TextStyle(color: Colors.white,fontSize: 50.0,fontWeight: FontWeight.bold,fontFamily: 'Phudu'),),
                            ],
                          ),),

                      ],
                    ),
                  ),
                ),
              ),
              SubHeadings(title: 'OVER ALL EVENTS',),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                child: Container(
                  height: 150,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>EventNumberList()),
                          );
                        },
                          child: Column(
                            children: [
                              Text('TOTAL EVENTS:',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold,fontFamily: 'Phudu'),),
                              Text('276',style: TextStyle(color: Colors.white,fontSize: 50.0,fontWeight: FontWeight.bold,fontFamily: 'Phudu'),),
                            ],
                          ),),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
