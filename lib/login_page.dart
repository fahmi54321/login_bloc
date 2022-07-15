import 'package:flutter/material.dart';
import 'bloc/bloc.dart';
import 'bloc/providers.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //todo 6
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            emailField(bloc), //todo 7
            passwordField(bloc), //todo 8 (finish)
            SizedBox(height: 25),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField(Bloc bloc) {
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
              errorText: snapshot.error as String?,
            ),
            onChanged: bloc.changeEmail,
          );
        });
  }

  Widget passwordField(Bloc bloc) {

    return StreamBuilder(stream: bloc.password,builder: (context,snapshot){
      return TextField(
        decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          errorText: snapshot.error as String?
        ),
        onChanged: bloc.changePassword,
      );
    });
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {},
      child: Text('Login'),
      color: Colors.blue,
    );
  }
}
