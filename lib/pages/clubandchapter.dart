import 'package:flutter/material.dart';
import 'package:google_sheet_db/components/pageheading.dart';
import 'package:google_sheet_db/components/subheadings.dart';
import 'package:google_sheet_db/pages/events.dart';
import 'package:google_sheet_db/pages/individual_club.dart';
import 'account.dart';
import 'clubinfo.dart';
import 'clubsolo.dart';
import 'navbar.dart';

class ClubChapter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SizedBox(width: 5.0,),
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AccountScreen()));
          }, icon: Icon(Icons.person_outline_rounded,size: 30.0,color: Colors.white,),),
          SizedBox(width: 5.0,),
        ],
      ),
      body: Container   (
          decoration: BoxDecoration(
            color: Colors.black,
            // image: DecorationImage(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/notifications1.png?raw=true'),
            //     fit: BoxFit.cover,
            //     colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken)
            // ),
          ),//BACKGROUND IMAGE
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [SizedBox(height: 30.0,),
                  ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (bounds)=>LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.purple,Colors.lightBlueAccent,Colors.greenAccent],
                    ).createShader(bounds),
                    child: Text('CLUBS & CHAPTERS',style: TextStyle(
                      fontSize: 40.0, fontWeight: FontWeight.bold,fontFamily: 'Phudu'
                    ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  SubHeadings(title: "TECHNICAL CLUBS",),//NON TECH HEADING
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>DisplayDataPage()),
                                  );
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/board.png?raw=true',),
                                        width: 150.0,height: 100.0,fit: BoxFit.cover,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ), //rotaract
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  Rotaract()),
                                  );
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/Frame%2014.png?raw=true',),
                                        width: 150.0,height: 100.0,fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ), //LITDAC & ROTARACT
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  Rotaract()),
                                  );
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/Frame%2015.png?raw=true'
                                          '',),
                                        width: 150.0,height: 100.0,fit: BoxFit.cover,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  TechnicalClubPage(),
                                  ),);
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/1.png?raw=true',),
                                        width: 150.0,height: 100.0,fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),//BOOK BUZZ & ARROW
                  SizedBox(height: 30.0,),
                  SubHeadings(title: 'NON-TECHNICAL CLUBS',),//NON TECH HEADING
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  Rotaract()),
                                  );
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/board.png?raw=true',),
                                        width: 150.0,height: 100.0,fit: BoxFit.cover,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ), //rotaract
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  Rotaract()),
                                  );
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/Frame%2014.png?raw=true',),
                                        width: 150.0,height: 100.0,fit: BoxFit.cover,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ), //LITDAC & ROTARACT
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  Rotaract()),
                                  );
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/Frame%2015.png?raw=true'
                                          '',),
                                        width: 150.0,height: 100.0,fit: BoxFit.cover,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => TechnicalClubPage(),
                                  ),);
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/1.png?raw=true',),
                                        width: 150.0,height: 100.0,fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),//BOOK BUZZ & ARROW
                  SizedBox(height: 30.0,),
                  SubHeadings(title: 'CHAPTERS',),//NON TECH HEADING
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  Rotaract()),
                                  );
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/board.png?raw=true',),
                                        width: 150.0,height: 100.0,fit: BoxFit.cover,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ), //rotaract
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Rotaract()),
                                  );
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/Frame%2014.png?raw=true',),
                                        width: 150.0,height: 100.0,fit: BoxFit.cover,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ), //LITDAC & ROTARACT
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  Rotaract()),
                                  );
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/Frame%2015.png?raw=true'
                                          '',),
                                        width: 150.0,height: 100.0,fit: BoxFit.cover,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: InkWell(
                                splashColor: Colors.black26,
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => TechnicalClubPage()),
                                  );
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image(image: NetworkImage('https://github.com/LAG-4/engproj.github.io/blob/main/1.png?raw=true',),
                                        width: 150.0,height: 100.0,fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),//BOOK BUZZ & ARROW

                ],
              ),//MAIN CONTENT
            ),
          )//APP BODY
      ),
    );
  }
}

