import 'package:flutter/material.dart';
import 'package:forget_what/services/authentication_services.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  final AuthenticationService _firebaseAuth = AuthenticationService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  double heightVar = 20;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('Create New Account'),
            actions: <Widget>[]),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              // Email
              TextFormField(
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

              // Sign up button
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _firebaseAuth
                        .signUpWithEmailandPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = "email error";
                      });
                    }
                  }
                },
                child: Text("Sign Up"),
              ),

              // error message
              Text(
                error,
                style: TextStyle(color: Colors.red),
              ),

              Text("Already Have an Account?"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_in');
                },
                child: Text('Sign In'),
              ),
              
            ],
          ),
        ));
  }
}
