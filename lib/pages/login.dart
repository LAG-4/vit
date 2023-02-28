import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sheet_db/pages/chatscreen.dart';
import 'package:google_sheet_db/pages/faculty_home.dart';
import 'package:google_sheet_db/pages/loading_screen.dart';
import 'package:google_sheet_db/pages/navbar.dart';
import 'package:google_sheet_db/pages/registration.dart';
import 'package:google_sheet_db/pages/uploadpage.dart';
import 'package:google_sheet_db/upload/eventupload.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String errorMessage = '';
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: SafeArea(
        child: Container(
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
          child: Scaffold(
            body: Padding(padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [

                      const Text('VEC',style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold,),),
                      const SizedBox(height: 20.0,),
                      const Text('Welcome To VIT-AP',style: TextStyle(fontSize: 44.0,fontWeight: FontWeight.bold,),),
                      const Text('Clubs & Events',style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold,),),
                      const SizedBox(height: 94.0,),
                      TextField(

                        onChanged: (value) {
                          //Do something with the user input.
                          email =value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey,),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple.shade800, width: 2.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 26.0,),
                      TextField(
                        obscureText: true,
                        onChanged: (value) {
                          //Do something with the user input.
                          password=value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey,),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple.shade800, width: 2.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 120.0,),

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
                            child:  ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                onSurface: Colors.transparent,
                                shadowColor: Colors.transparent,
                                //make color or elevated button transparent
                              ),
                              onPressed: () async {
                                try {
                                  final user = await _auth.signInWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  );
                                  if (user != null) {
                                    // check if the user is an admin or a client
                                    var userEmail = user.user.email;
                                    if (userEmail == 'test@test.com') {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) =>FacultyHome()),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => LoadingScreen()),
                                      );
                                    }
                                  }
                                } catch (e) {
                                  setState(() {
                                    errorMessage = e.message;
                                  });
                                }
                              },
                              child: Text('Login'),
                            ),
                          ),
                        ),
                      ),

                    ],


                    // body: Container(
                    //   padding: EdgeInsets.all(20.0),
                    //   child: Column(
                    //     children: [
                    //       TextField(
                    //         onChanged: (value) {
                    //           email = value;
                    //         },
                    //         decoration: InputDecoration(
                    //           hintText: 'Email',
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         height: 20.0,
                    //       ),
                    //       TextField(
                    //         onChanged: (value) {
                    //           password = value;
                    //         },
                    //         decoration: InputDecoration(
                    //           hintText: 'Password',
                    //         ),
                    //         obscureText: true,
                    //       ),
                    //       SizedBox(
                    //         height: 20.0,
                    //       ),
                    //       ElevatedButton(
                    //         onPressed: () async {
                    //           try {
                    //             final user = await _auth.signInWithEmailAndPassword(
                    //               email: email,
                    //               password: password,
                    //             );
                    //             if (user != null) {
                    //               // check if the user is an admin or a client
                    //               var userEmail = user.user.email;
                    //               if (userEmail == 'test@test.com') {
                    //                 Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(builder: (context) => ChatScreen()),
                    //                 );
                    //               } else {
                    //                 Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(builder: (context) => DamnTime()),
                    //                 );
                    //               }
                    //             }
                    //           } catch (e) {
                    //             setState(() {
                    //               errorMessage = e.message;
                    //             });
                    //           }
                    //         },
                    //         child: Text('Login'),
                    //       ),
                    //       SizedBox(
                    //         height: 20.0,
                    //       ),
                    //       Text(
                    //         errorMessage,
                    //         style: TextStyle(
                    //           color: Colors.red,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
