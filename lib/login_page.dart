import 'package:flutter/material.dart';
import 'bloc/bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
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

  Widget emailField() {
    return StreamBuilder(
        stream: bloc.email,
        builder: (
          context,
          AsyncSnapshot<String> snapshot,
        ) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@gmail.com',
              labelText: 'Email Address',
              errorText: snapshot.error.toString(),
            ),
            onChanged: bloc.changeEmail,
          );
        });
  }

  //todo 2
  Widget passwordField() {

    return StreamBuilder(stream: bloc.password,builder: (context,snapshot){
      return TextField(
        decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          errorText: snapshot.error.toString()
        ),
        onChanged: bloc.changePassword,
      );
    });
  }

  //todo 3 (finish)
  Widget submitButton() {
    return RaisedButton(
      onPressed: () {},
      child: Text('Login'),
      color: Colors.blue,
    );
  }
}
