import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback toggleView;

  const SignUpScreen({Key? key, required this.toggleView}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Sign In'),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 200),
            Text('Yet another Todo list',
                style: Theme.of(context).textTheme.headline6),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(hintText: 'Enter email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) => val == null || !val.contains('@')
                            ? 'Enter an email address'
                            : null),
                    SizedBox(height: 20),
                    TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(hintText: 'Enter password'),
                        obscureText: true,
                        validator: (val) => val!.length < 6
                            ? 'Enter a password of '
                                'at least 6 chars'
                            : null),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // ignore: avoid_print
                            print('submit form');
                          }
                        },
                        child: Text('Sign Up'))
                  ],
                ),
              ),
            )
          ]),
        ));
  }}
