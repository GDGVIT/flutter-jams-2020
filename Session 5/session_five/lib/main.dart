import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'This title',
        c: 10,
        counter:1
      ),
    );
  }
}

//Defining a Stateful Widget.
class MyHomePage extends StatefulWidget {
  //Passing parameters to the Stateful Widget.
  MyHomePage({
    Key key, 
     this.title,
     this.counter,
     this.c
  });
  //Declaring variables.
  final String title;
  int counter,c;

  @override 
  _MyHomePageState createState()=>_MyHomePageState();
}

//Defining the state of the MyHomePage class.
class _MyHomePageState extends State<MyHomePage>{
  //int _counter=0, c=9;
  _increment(){
    //Using setState to change the values of variables dynamically.
    setState(() {
      widget.counter++;
      widget.c = widget.c + 1;
    });
  
    //Changing print statements based on values of variable.
    if(widget.counter==2){
      print("It is 2");
    }
    else if(widget.counter==4){
      print("It is 4");
    }
    else{
      print("No value");
    }
  }

  //Changing contents of the page based on values of variable.
  show(){
    if(widget.counter==2){
      print("It is 2");
      return Icon(Icons.access_time);
    }
    else if(widget.counter==4){
      print("It is 4");
      return Icon(Icons.account_circle);
    }
    else{
      print("No value");
      return Icon(Icons.weekend);
    }
  }

  //Used to flush all the values of setState() present.
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Taking title from the main class using "widget." keyword.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Defining Expanded in Row to show the effect of "flex" in distributing the available area.
            Row(
              children: <Widget>[
                Expanded(flex:2,child: Container(
                  margin:EdgeInsets.only(left:4,right:4),
                  color: Colors.red,
                  child :Text('1'))),
                Expanded(flex:3,child:Container(
                  color: Colors.yellow,
                  child :Text('1'))),
                   Expanded(flex:4,child:Container(
                  color: Colors.purple,
                  child :Text('1')))
              ],
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            //Using "$" symbol to call the variables from MyHomePage class and put them in {} if the name is seperated by ".".
            Text(
              'The value of _counter is ${widget.counter}',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'Value of c is ${widget.c}',
              style: Theme.of(context).textTheme.display1,
            ),
            //Calling function to dynamically change the content of the page.
            show(),
            //Setting the icon in the page based on the value of counter variable.
            widget.counter==2? 
              Icon(Icons.add_to_queue, color: Colors.purple,size: 32.0,)
              : 
              Icon(Icons.ac_unit)
          ],
        ),
      ),
      //FAB is used to display button on the top of body.
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Increment',
        child: Icon(Icons.add,),
      ),
    );
  }


}
