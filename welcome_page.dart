import 'package:flutter/material.dart';
import 'package:the_fidibo_project/auth_page/signup.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';
import 'package:the_fidibo_project/widgetAssets.dart';
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
      // backgroundColor: Colors.black,
      body: Center(
        child: Container(
          // color: const Color.fromARGB(255, 169, 17, 17),
          width: 400,
          height: 330,
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
          decoration:
              myBoxDecoration.get(globalTheme.getCS().primary.withOpacity(0.1)),
          child: Column(
            children: [
              const Text("Welcome :)", textScaleFactor: 4),
              const Text("Please login or signup", textScaleFactor: 2),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'in',
                    child: FilledButton(
                      style: style,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text("Login"),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Hero(
                    tag: 'up',
                    child: FilledButton(
                      style: style,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Signup(),
                          ),
                        );
                      },
                      child: const Text("Signup"),
                    ),
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
