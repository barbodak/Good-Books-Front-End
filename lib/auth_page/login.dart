import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //     title: const Text(
        //   'Login Page ! login you fucker',
        // )),
        body: Center(
          child: Container(
            width: 400,
            height: 500,
            padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Enter your username", textScaleFactor: 1),
                TextFormField(
                  maxLines: 1,
                  maxLength: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text("enter your passwerd", textScaleFactor: 1),
                TextFormField(
                  maxLines: 1,
                  maxLength: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
