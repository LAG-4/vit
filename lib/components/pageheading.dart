import 'package:flutter/material.dart';
class PageHeading extends StatelessWidget {
  PageHeading({@required this.title});
final String title;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds)=>LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.purple,Colors.lightBlueAccent,Colors.greenAccent],
      ).createShader(bounds),
      child: Text(title,style: TextStyle(
          fontSize: 40.0, fontWeight: FontWeight.normal,fontFamily: 'Cubano',
      ),
      ),
    );
  }
}
