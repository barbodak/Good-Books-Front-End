import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //     title: const Text(
        //   'Signup Page ! Signup you fucker',
        // )),
        body: Center(
          child: Container(
            width: 400,
            height: 500,
            // padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TextField(
                  maxLines: 1,
                  maxLength: 100,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your username',
                    counterText: ' ',
                    filled: true,
                    fillColor: Color.fromARGB(90, 15, 231, 191),
                  ),
                ),
                TextFormField(
                  maxLines: 1,
                  maxLength: 100,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your password',
                    counterText: ' ',
                    hintText: 'make a good password',
                    suffixIcon: IconButton(
                      icon: Icon(hidePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            hidePassword = !hidePassword;
                          },
                        );
                      },
                    ),
                  ),
                ),
                TextFormField(
                  maxLines: 1,
                  maxLength: 100,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'confirm your password',
                    counterText: ' ',
                    suffixIcon: IconButton(
                      icon: Icon(hidePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            hidePassword = !hidePassword;
                          },
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: const Text("SignUp"),
                  ),
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
