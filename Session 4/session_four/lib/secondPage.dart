import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body:  Column(
        children: <Widget>[
          Text("Second page"),
          GestureDetector(
            onTap: (){
              //Function to pop out the top screen present in the stack.
              Navigator.of(context).pop();
            },
            child: Text('Back'),
          )
        ],
      )
    );
  }
}