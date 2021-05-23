import 'package:flutter/material.dart';
import 'package:forget_what/services/authentication_services.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  final AuthenticationService _firebaseAuth = AuthenticationService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  double heightVar = 32;
  double titleFontSize = 32;
  double textFontSize = 24; 

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
            centerTitle: true, title: Text('Sign In', style: TextStyle(fontSize: titleFontSize, color: Colors.white)), actions: <Widget>[]),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              // Email
              TextFormField(
                style: TextStyle(fontSize: textFontSize),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Email Required';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  }),

              // Password
              TextFormField(
                style: TextStyle(fontSize: textFontSize),
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (val) {
                  if (val.length < 6) {
                    return 'Password must be at least 6 characters long.';
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                obscureText: true,
              ),

              SizedBox(height: heightVar),

              // Sign In
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent[400],
                  onPrimary: Colors.black,
                  side: BorderSide(width: 2.0, color: Colors.black), 
                ),
                child: Text("Sign In", style: TextStyle(fontSize: textFontSize),),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _firebaseAuth.signInWithEmailandPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = "failed credentials";
                      });
                    }
                  }
                  Navigator.pop(context);
                },
              ),

              // error message
              Text(
                error,
                style: TextStyle(color: Colors.red),
              ),

            ],
          ),
        ));
  }
}
