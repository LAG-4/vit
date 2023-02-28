import 'package:flutter/material.dart';
class TransparentButton extends StatelessWidget {
  TransparentButton({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){}, child: Text(title,),style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.white)
        ),
      ),
    ),
    );
  }
}

