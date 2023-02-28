import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sheet_db/components/pageheading.dart';
import 'package:google_sheet_db/components/subheadings.dart';
import 'package:url_launcher/url_launcher.dart';

import 'account.dart';

class DisplayDataPage extends StatefulWidget {
  final data;

  DisplayDataPage({this.data});

  @override
  _DisplayDataPageState createState() => _DisplayDataPageState();
}

class _DisplayDataPageState extends State<DisplayDataPage> {
  Future<void> _launchURL(String url) async{
    final Uri uri = Uri(scheme: "https",host: url);
    if(!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )){
      throw "Can not launch URl";
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
          IconButton(onPressed: (){
            showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder( // <-- SEE HERE
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                builder: (context) {
                  return Container(
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("What's Your",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 40.0),),
                              IconButton(onPressed: (){}, icon: Icon(Icons.close_rounded,color: Colors.black,size: 40.0,),),
                            ],
                          ),
                          Text("plan for today?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40.0),),
                          SizedBox(height: 10.0,),
                          Text("Choose your favourite activity from below :",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15.0,color: Colors.grey),),
                          SizedBox(height: 10.0,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(height: 5.0,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: IconButton(onPressed: (){},
                                          icon: Icon(Icons.code_rounded,size: 30.0,),
                                        ),
                                        color: Colors.grey,
                                      ),
                                      TextButton(onPressed: (){}, child: Text('Coding & Technical',style: TextStyle(color: Colors.grey.shade700,fontSize: 20.0),))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: IconButton(onPressed: (){},
                                          icon: Icon(Icons.cleaning_services_rounded,size: 30.0,),
                                        ),
                                        color: Colors.grey,
                                      ),
                                      TextButton(onPressed: (){}, child: Text('Clean & Service',style: TextStyle(color: Colors.grey.shade700,fontSize: 20.0),))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: IconButton(onPressed: (){},
                                          icon: Icon(Icons.music_note_rounded,size: 30.0,),
                                        ),
                                        color: Colors.grey,
                                      ),
                                      TextButton(onPressed: (){}, child: Text('Music & Singing',style: TextStyle(color: Colors.grey.shade700,fontSize: 20.0),))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: IconButton(onPressed: (){},
                                          icon: Icon(Icons.accessibility_new_rounded,size: 30.0,),
                                        ),
                                        color: Colors.grey,
                                      ),
                                      TextButton(onPressed: (){}, child: Text('Dancing & DJ',style: TextStyle(color: Colors.grey.shade700,fontSize: 20.0),))
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }, icon: Icon(Icons.settings_input_composite_outlined,size: 30.0,color: Colors.white,)),
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
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('events')
              .doc('rASgMv9F1rTUTBIuI3WW')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            var document = snapshot.data.data();

            if (document == null) {
              return Center(
                child: Text('Document not found'),
              );
            }

            return Container(
              padding: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 100.0,),
                    Image(image: NetworkImage('${widget.data['img']}'),),
                    SizedBox(height: 20.0,),
                    PageHeading(title: '${document['name']}'),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.email_rounded,),
                          color: Colors.white,
                        ),
                        SizedBox(width: 20.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SubHeadings(title: 'EMAIL',),
                            Text(
                              '${widget.data['email']}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.person_2_rounded,),
                          color: Colors.white,
                        ),
                        SizedBox(width: 20.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SubHeadings(title: 'FACULTY COORDINATOR',),
                            Text(
                              '${widget.data['faculty']}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.phone,),
                          color: Colors.white,
                        ),
                        SizedBox(width: 20.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SubHeadings(title: 'CONTACT NUMBER',),
                            Text(
                              '${document['phone']}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.link,),
                          color: Colors.white,
                        ),
                        SizedBox(width: 20.0,),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SubHeadings(title: 'EVENT LINK',),
                              SelectableText('${document['link']}',style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubHeadings(title: 'ABOUT CLUB',),
                        TextButton(onPressed: (){}, child: Text(
                          '${document['desc']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image(image: NetworkImage('${document['img1']}'),height: 100.0,),
                            Image(image: NetworkImage('${document['img2']}'),height: 100.0,),
                          ],
                        ),
                        Row(
                          children: [
                            Image(image: NetworkImage('${document['img3']}'),height: 100.0,),
                            Image(image: NetworkImage('${document['img4']}'),height: 100.0,),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    ElevatedButton(
                        onPressed: (){},
                      child: Text('REGISTER'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
