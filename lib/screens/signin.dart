// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../services/authentication.dart';
import '../shared/constants.dart';
import '../shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authservice = AuthService();
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? LoadingCycle() : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text("Sign in to Cycl-One"),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () => widget.toggleView(), 
            icon: Icon(Icons.person), 
            label: Text("Register"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                TextFormField(
                  decoration: textInputDecor.copyWith(hintText: 'email'),
                  validator: (value) => value!.endsWith('sliet.ac.in') ? null : 'Enter institute email id', 
                  onChanged: (value) => setState(() => email = value),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: textInputDecor.copyWith(hintText: 'password'),
                  validator: (value) => value!.length < 6 ? 'Enter valid password' : null,
                  obscureText: true,
                  onChanged: (value) => setState(() => password = value),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _authservice.signInWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'invalid email password combination';
                          loading = false;
                        });
                      }
                    }
                  }, 
                  child: Text('Sign In'),
                ),
              ],
            )),
            ElevatedButton(
              onPressed: () async => await _authservice.signInAnonymously(),
                child: Text("Sign In Anonymously"),
            ),
            SizedBox(height: 20,),
            Text(error, style: TextStyle(color: Colors.red,),),
          ],
        ),
      ),
    );
  }
} 