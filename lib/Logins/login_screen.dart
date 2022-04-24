import 'package:but1st_boba/Logins/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                _forgetPasswordText(),
                const SizedBox(height: 40),
                _loginButton(),
                const SizedBox(height: 20),
                _orText(),
                const SizedBox(height: 25),
                _loginWithLogos(),
                const SizedBox(height: 20),
                _signUpText(),
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
          validator: validateEmail,
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
          validator: validatePassword,
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

  _forgetPasswordText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          child: const Text(
            'Forget Password?',
            style: TextStyle(
                fontFamily: 'RobotoSlab',
                color: Colors.black,
                letterSpacing: 1.2),
          ),
          onPressed: () {},
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

  _loginWithLogos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        CircleAvatar(
          backgroundImage: AssetImage('lib/assets/images/facebook.png'),
          foregroundColor: Colors.black12,
          radius: 40.0,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('lib/assets/images/google.png'),
          foregroundColor: Colors.black12,
          radius: 40.0,
        ),
      ],
    );
  }

  _signUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Didn\'t have an account?',
          style: TextStyle(
            fontSize: 18.0,
            letterSpacing: 1.4,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignupScreen()));
          },
          child: const Text(
            'Create',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'Required';
  }

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) {
    return 'Invalid E-mail Format';
  }

  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return 'Required.';
  }
  return null;
}
