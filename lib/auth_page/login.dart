import 'package:flutter/material.dart';
import 'package:the_fidibo_project/homePage.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return MaterialApp(
      theme: globalTheme.get(),
      home: Scaffold(
        // appBar: AppBar(
        //     title: const Text(
        //   'Login Page ! login you fucker',
        // )),
        body: Center(
          child: Container(
            width: 400,
            height: 500,
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    border: const OutlineInputBorder(),
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
                Align(
                  alignment: Alignment.centerRight,
                  child: Hero(
                    tag: 'in',
                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const homePage(),
                          ),
                        );
                      },
                      child: const Text("LogIn"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
