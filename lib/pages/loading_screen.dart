
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sheet_db/pages/navbar.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network('https://github.com/LAG-4/engproj.github.io/blob/main/vec%20logo.png?raw=true'),
      title: Text(
        "VIT-AP",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.blueGrey,
      showLoader: true,
      loaderColor: Colors.white,
      loadingText: Text("Brought To You By:\n Team Sripto",style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
      navigator: DamnTime(),
      durationInSeconds: 5,

    );
  }
}
