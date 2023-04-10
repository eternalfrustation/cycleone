// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import '../services/authentication.dart';
import '../shared/constants.dart';
import '../shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  const Register({super.key, required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _authservice = AuthService();
  String email = '';
  String password = '';
  String name = '';
  int rollNo = 0;
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? LoadingCycle() : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text("Register"),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () => widget.toggleView(), 
            icon: Icon(Icons.person), 
            label: Text("Sign In Instead")),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
          children: <Widget>[
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
            TextFormField(
              decoration: textInputDecor.copyWith(hintText: 'name'),
              validator: (value) => value!.isEmpty ? 'Enter name' : null,
              onChanged: (value) => setState(() => name = value),
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: textInputDecor.copyWith(hintText: 'roll number'),
              validator: (value) => value!.length != 7 ? 'Enter 7 digit roll number' : null,
              onChanged: (value) => setState(() => rollNo = int.parse(value)),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() => loading = true);
                  dynamic result = await _authservice.registerWithEmailAndPassword(email, password, name, rollNo);
                  if (result == null) {
                    setState(() {
                      error = 'backend error';
                      loading = false;
                    });
                  }
                }
              }, 
              child: Text('Sign Up'),
            ),
            SizedBox(height: 20,),
            Text(error, style: TextStyle(color: Colors.red,),),
          ],
        )),
      ),
    );
  }
}