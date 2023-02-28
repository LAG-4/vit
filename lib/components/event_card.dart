import 'package:flutter/material.dart';

import '../pages/clubinfo.dart';

class EventCard extends StatelessWidget {
   EventCard({this.img,this.title});
  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        splashColor: Colors.black26,
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>Rotaract()),
          );
        },
        child: Card(color: Colors.blueGrey.shade900,
          shadowColor: Colors.purple.shade900,
          elevation: 10,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: Image(image: NetworkImage(img,),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title, style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                ),
                ),
              ),
              SizedBox(height: 5.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('It is a mock IPL auction where players can bid and buy real IPL players.', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 15.0,
                ),
                ),
              ),
              SizedBox(height: 30.0,),
            ],
          ),
        ),
      ),
    );
  }
}

