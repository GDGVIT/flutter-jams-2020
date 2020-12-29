import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _myTabController;

  @override
  void initState() {
    _myTabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _myTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VITian - Time Table'),
        bottom: TabBar(
          controller: _myTabController,
          tabs: [
            Tab(text: 'Mon'),
            Tab(text: 'Tue'),
            Tab(text: 'Wed'),
            Tab(text: 'Thu'),
            Tab(text: 'Fri'),
            Tab(text: 'Sat'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _myTabController,
        children: [
          //monday
          ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return MyCustomWidget();
            },
          ),
          Container(
            child: Center(
              child: Text('This is tue'),
            ),
          ),
          Container(
            child: Center(
              child: Text('This is wed'),
            ),
          ),
          Container(
            child: Center(
              child: Text('This is body'),
            ),
          ),
          Container(
            child: Center(
              child: Text('This is body'),
            ),
          ),
          Container(
            child: Center(
              child: Text('This is body'),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomWidget extends StatelessWidget {
  const MyCustomWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.all(16),
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        title: Text('2:00 PM - 2:45 PM'),
        subtitle: Column(
          //flutter: take as less area as possible
          mainAxisSize: MainAxisSize.min,
          //should start from left
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ALA'),
            Text('SLOT'),
            Text(
              'Student Units | Class Units',
              style: TextStyle(
                color: Colors.blue,
              ),
            )
          ],
        ),
        trailing: Container(
          color: Colors.red,
          child: Icon(Icons.access_alarm),
        ),
      ),
    );
  }
}
