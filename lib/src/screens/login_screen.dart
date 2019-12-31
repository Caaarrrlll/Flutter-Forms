import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  // Create reference to the form state and accociate it with the Form
  final formKey = GlobalKey<FormState>();
  String email = '', pw = '';

  Widget build(c) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passWordField(),
            // To add some padding
            Container(margin: EdgeInsets.only(top: 20.0)),
            submitButton()
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (String val){
        email = val;
      },
    );
  }

  Widget passWordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'P@ssWord123',
      ),
      obscureText: true,
      validator: valiDatePassword,
      onSaved: (String val){
        pw = val;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Submit'),
      onPressed: () {
        if( formKey.currentState.validate() ){
          formKey.currentState.save();
          print('email: $email, pw: $pw');
        }
      },
      color: Colors.blue,
    );
  }
}
