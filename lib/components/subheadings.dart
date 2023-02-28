import 'package:flutter/material.dart';

class SubHeadings extends StatelessWidget {
  SubHeadings({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,style:
    TextStyle(
      fontWeight: FontWeight.normal,
      fontFamily: 'Cubano',
      fontSize: 20,
    ),
    );
  }
}
