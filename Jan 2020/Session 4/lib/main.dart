import 'package:flutter/material.dart';
//Used to import external library
import 'package:fluttertoast/fluttertoast.dart';
import 'package:session_four/secondPage.dart';

void main(){
  runApp(
    MaterialApp(
      title: "My flutter app",
      routes: <String, WidgetBuilder> {
        //Each page is mapped to a unique name to call it while navigating.
        '/screen2': (BuildContext context) => new SecondPage(),
      },
      home: MainPage()
    ),
  );
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text('Title'),
        ),
        //List View is used to create same pattern of list again and again.
        body: ListView(
          children: <Widget>[
            //GestureDetector is used to detect a gesture(single click, double click, drag) and perform tasks accordingly.
            GestureDetector(
              onTap: (){
                //FlutterToast is the external library imported to show toasts in a page.
                Fluttertoast.showToast(msg: 'Watch');
              },
              //ListTile is used to show content in the fixed format.
              child:ListTile(
                //trailing appears on right, title appears bigger and bolder, subtitle appears smaller, leading appears on left
                trailing: Icon(Icons.watch),
                title: Text('Watch'),
              ),
            ),
            GestureDetector(
              onTap: (){
                //This function is used to push a page on top of stack using its name defined in MaterialApp.
                Navigator.of(context).pushNamed('/screen2');
              },
              child:ListTile(
                trailing: Icon(Icons.watch),
                title: Text('Watch'),
              ),
            ),
            GestureDetector(
              onTap: (){
                //This function is used to push a page on top of stack using its name and also parameters can be passed in it.
                Navigator.push(
                context,
                new MaterialPageRoute(builder: (BuildContext context) => SecondPage())
                );
              },
              child: ListTile(
                trailing: Icon(Icons.watch),
                title: Text('Watch'),
              ),
            ),
            ListTile(
              trailing: Icon(Icons.watch),
              title: Text('Watch'),
            ),
          ],
        )
      );
  }
  
}