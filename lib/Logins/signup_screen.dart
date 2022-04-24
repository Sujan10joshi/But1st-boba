import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _signInText(),
                const SizedBox(height: 30),
                _emailField(),
                const SizedBox(height: 40),
                _passwordField(),
                const SizedBox(height: 40),
                _loginButton(),
                const SizedBox(height: 20),
                _orText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signInText() {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Column(
        children: const [
          Text(
            'Sign In',
            style: TextStyle(
                fontSize: 40.0,
                fontFamily: 'RobotoSlab',
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4),
          ),
        ],
      ),
    );
  }

  _emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          // validator: validateEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              hintText: "User Email",
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              prefixIcon: Icon(
                Icons.mail,
                color: Colors.black,
              )),
        ),
      ],
    );
  }

  _passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          // validator: validatePassword,
          obscureText: true,
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              hintText: "Password",
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              prefixIcon: Icon(
                Icons.mail,
                color: Colors.black,
              )),
        ),
      ],
    );
  }

  _loginButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
            child: const Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'RobotoSlab',
                letterSpacing: 1.6,
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            }),
      ],
    );
  }

  _orText() {
    return Column(
      children: const [
        Text(
          '-OR-',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'RobotoSlab',
            letterSpacing: 1.5,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Sign in with',
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: 'RobotoSlab',
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}
