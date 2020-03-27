//import the package for icons, design, color, etc.
import 'package:flutter/material.dart';

//main() function is th entry point of the applicaton.
void main()=> runApp(MyApp());

//A class is created to show the first page when the application opens. It entends StatelessWidget because each time the app opens, there is no change in the content of any Widget of the app.
class MyApp extends StatelessWidget{

  //build function is Overrided so that we can customize our app according to our requirements.
  @override
  Widget build(BuildContext context) {
    //MaterialApp is used to give a primary architecture to the app including primary colour, showing the banner on top left corner, giving title, etc.
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Application",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      //Scaffold is present to define structure of a page including Appbar, Bottom Navigation bar, Body, etc.
      home:Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text('Title'),
          //actions is used to display Widgets on right side of Appbar.
          actions: <Widget>[
            Icon(Icons.ac_unit)
          ],
        ),
        //SingleChildScrollView is used to enable users toscroll throught the entire page.
        body: SingleChildScrollView(
          //Conatainer is used to create a section with required height, width, color, padding, margin, decoration, etc.
          child:  Container(
          height: 700.0,
          width: 400.0,
          color: Colors.amber,
          //The main Widget is Column, so everything inside it will be shown in a vertical fashion.
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.green,
                //Row is used to show everything inside it in a horizontal fashion.
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("In a row", style: TextStyle(fontWeight: FontWeight.bold),),
                    Container(
                      //BoxDecoration is used to add shadow, corner radius, gradient, etc. in a container
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(40.0)
                    ),
                    alignment: Alignment(-1, 0),
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    padding: EdgeInsets.all(10.0),
                    //Text is used to display Text with various styles like font size, bold, italic, text direction defined in TextStyle Widget.
                    child :Text("Hello World",textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo
                        ),
                      ),
                    ),
                    //Icon is used to display Icon which can be imported using "Icons." keyword.
                    Icon(Icons.ac_unit, size: 40.0,),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30.0),
                color: Colors.white,
                child : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("In a column", style: TextStyle(fontWeight: FontWeight.bold),),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(40.0)
                    ),
                    alignment: Alignment(-1, 0),
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    padding: EdgeInsets.all(10.0),
                    child :Text("Hello World",textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo
                      ),
                    ),
                  ),
                  Icon(Icons.ac_unit, size: 40.0,),
                  ],
                ),
              ),
              Text("In a stack", style: TextStyle(fontWeight: FontWeight.bold),),
              //Stack Widget is used to align items in z-axis i.e. on top of each other. You can add margin to make sure both the elements are visible or else, they will overlap each other.
              Stack(
                children: <Widget>[
                  Container(
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(40.0)
                ),
                alignment: Alignment(0, 0),
                margin: EdgeInsets.symmetric(vertical: 20.0),
                padding: EdgeInsets.only(top:20.0),
                child :Text("Hello World",textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo
                  ),
                ),
              ),
              Container(
                alignment: Alignment(0, 0),
                child :Icon(Icons.person_outline, size: 40.0,),
              ),
                ],
              ),
            ],
          )
        )
        )
      ) 
    ); 
  }
}

//In case you are not able to recall a value'sname, you can press Ctrl and then Enter key, to see a list of values acceptable in a Widget. Also, you can click on the Widget while pressing Ctrl key, to go to its documentation and understand it completely.
