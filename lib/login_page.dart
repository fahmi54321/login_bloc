import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page'),),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            emailField(),
            passwordField(),
            SizedBox(height: 25),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'you@gmail.com',
        labelText: 'Email Address',
      ),
    );
  }

  Widget passwordField(){
    return TextField(
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
      ),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {},
      child: Text('Login'),
      color: Colors.blue,
    );
  }
}
