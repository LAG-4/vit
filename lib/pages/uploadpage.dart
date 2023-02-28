import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

class UploadPage extends StatefulWidget {

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {

  final textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    CollectionReference groceries=
        FirebaseFirestore.instance.collection('groceries');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textController,
          ),
        ),

        floatingActionButton: FloatingActionButton(onPressed: (){
          groceries.add({
            'name': textController.text,

          });
        },child: Icon(Icons.save),),
      ),
    );
  }
}
