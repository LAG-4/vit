import 'dart:ui';

import 'package:google_sheet_db/pages/clubsolo.dart';
import 'package:google_sheet_db/pages/events.dart';
import 'package:google_sheet_db/pages/navbar.dart';
import 'package:google_sheet_db/pages/login.dart';
import 'package:google_sheet_db/pages/registration.dart';
import 'package:google_sheet_db/pages/uploadpage.dart';
import 'package:google_sheet_db/theme_provider.dart';
import 'package:provider/provider.dart';
import 'pages/events.dart';
import 'pages/clubandchapter.dart';
import 'pages/clubinfo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
    );
  }
}