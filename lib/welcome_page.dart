import 'package:flutter/material.dart';

class welcome_page extends StatefulWidget {
  const welcome_page({super.key});

  @override
  State<welcome_page> createState() => _welcome_pageState();
}

class _welcome_pageState extends State<welcome_page> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            color: Color.fromARGB(255, 169, 17, 17),
            width: 400,
            height: 300,
            padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
            child: Column(
              children: [
                Text("Welcome !", textScaleFactor: 4),
                Text("login or signup", textScaleFactor: 2),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: style,
                      onPressed: () {},
                      child: Text("Log in"),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    ElevatedButton(
                      style: style,
                      onPressed: () {},
                      child: Text("Sign up"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
