import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form validation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Sign Up'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _phoneController;
  TextEditingController _passwordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _nameController,
                  autofillHints: [AutofillHints.name],
                  decoration: InputDecoration(
                    hintText: 'Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  autofillHints: [AutofillHints.email],
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    }
                    if (!value.contains('@')) {
                      return "A valid email should contain '@'";
                    }
                    if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _phoneController,
                  autofillHints: [AutofillHints.telephoneNumber],
                  decoration: InputDecoration(
                    hintText: 'Phone',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    }
                    if (value.length != 10) {
                      return 'A valid phone number should be of 10 digits';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    }
                    if (value.length < 8) {
                      return 'Password should have atleast 8 characters';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    //else make api call
                    showDialog(
                      context: context,
                      child: AlertDialog(
                        content: Text('Looks Good'),
                      ),
                    );
                  },
                  child: Text('SUBMIT'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
