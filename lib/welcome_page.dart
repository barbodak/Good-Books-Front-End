import 'package:flutter/material.dart';
import 'package:the_fidibo_project/auth_page/signup.dart';
import 'auth_page/login.dart';
// import 'auth_page/Signup.dart';

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
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.red,
      // ),
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 169, 17, 17),
          width: 400,
          height: 300,
          padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
          child: Column(
            children: [
              const Text("Welcome !", textScaleFactor: 4),
              const Text("login or signup", textScaleFactor: 2),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: style,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text("Log in"),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                    style: style,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Signup(),
                        ),
                      );
                    },
                    child: const Text("Sign up"),
                  ),
                ],
              ),
              // ElevatedButton(
              //   style: style,
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => Signup(),
              //       ),
              //     );
              //   },
              //   child: const Text("tmp"),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
