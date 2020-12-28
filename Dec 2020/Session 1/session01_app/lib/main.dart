import 'package:flutter/material.dart';

void main() {
  //here
  runApp(FormApp());
}

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _nameController;
  TextEditingController _phoneController;
  TextEditingController _passwordController;
  TextEditingController _emailController;
  bool dontShowPassword = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @overrid
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter SDC Session1'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (input) {
                      if (input.isEmpty) {
                        return "This parameter is required";
                      }
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: dontShowPassword,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffix: IconButton(
                        icon: Icon(dontShowPassword ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            dontShowPassword = !dontShowPassword;
                          });
                        },
                      ),
                    ),
                    validator: (input) {
                      if (input.isEmpty) {
                        return "This parameter is required";
                      }
                      if (input.length < 8) {
                        return "password length should be atleast 8 characters";
                      }
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                    ),
                    validator: (input) {
                      if (input.isEmpty) {
                        return "This parameter is required";
                      }
                      if (input.length != 10) {
                        return "phone should be 10 digits";
                      }
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: [AutofillHints.email],
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (input) {
                      if (input.isEmpty) {
                        return "This parameter is required";
                      }
                      if (!RegExp(r'[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+').hasMatch(input)) {
                        return "email format incorrect";
                      }
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  RaisedButton(
                    color: Colors.orange,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        showDialog(
                          context: context,
                          child: AlertDialog(
                            title: Text('Success'),
                            content: Text('All ok '),
                            actions: [
                              FlatButton(
                                onPressed: ()=>Navigator.pop(context),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          child: AlertDialog(
                            title: Text('Error'),
                            content: Text('Please fix error ssjsjjsjs sjjsss sj sjssjsda kaskldasss'),
                            actions: [
                              FlatButton(
                                onPressed: ()=>Navigator.pop(context),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
