import 'package:flutter/material.dart';
import 'package:the_fidibo_project/homePage.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';
import 'package:the_fidibo_project/Network.dart';
import 'package:the_fidibo_project/user.dart';
import 'package:the_fidibo_project/utils.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool hidePassword = true;
  final TextEditingController _name = TextEditingController(text: "");
  final TextEditingController _email = TextEditingController(text: "");
  final TextEditingController _password1 = TextEditingController(text: "");
  final TextEditingController _password2 = TextEditingController(text: "");
  Color appBarColor = Colors.green;
  String test = "";
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: globalTheme.get(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(test),
          backgroundColor: appBarColor,
        ),
        body: Center(
          child: SizedBox(
            width: 400,
            height: 500,
            // padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  maxLines: 1,
                  maxLength: 100,
                  controller: _name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your name',
                    counterText: ' ',
                    filled: true,
                    fillColor: Color.fromARGB(90, 15, 231, 191),
                  ),
                ),
                TextField(
                  maxLines: 1,
                  maxLength: 100,
                  controller: _email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your email',
                    counterText: ' ',
                    filled: true,
                    fillColor: Color.fromARGB(90, 15, 231, 191),
                  ),
                ),
                TextFormField(
                  maxLines: 1,
                  maxLength: 100,
                  obscureText: hidePassword,
                  controller: _password1,
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
                TextFormField(
                  maxLines: 1,
                  maxLength: 100,
                  obscureText: hidePassword,
                  controller: _password2,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
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
                  child: Hero(
                    tag: 'up',
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: appBarColor,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        appBarColor = Colors.red;
                        User u = User.loggedIn;
                        u.email = _email.text;
                        u.password = _password1.text;
                        u.name = _name.text;
                        if (_email.text == "" ||
                            _name.text == "" ||
                            _password1.text == "" ||
                            _password2.text == "") {
                          test = "Please fill all the fields";
                          setState(() {});
                          return;
                        }
                        if (!utils.checkEmail(_email.text)) {
                          test = "not real Email";
                          setState(() {});
                          return;
                        }
                        if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$')
                                .hasMatch(_password1.text) ||
                            _password1.text.contains(_name.text)) {
                          test = "week password";
                          setState(() {});
                          return;
                        }
                        if (_password1.text != _password2.text) {
                          test = "paswords do not match";
                          setState(() {});
                          return;
                        }
                        String value = await MyNetwork.sendRequest(
                            "signup\n" + u.userToString());
                        test = value;
                        print(value.length);
                        print('test');
                        setState(() {});
                        if (value == "done") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const homePage()),
                          ).then((value) {
                            // This block runs when you have returned back to the first page from second page
                            setState(() {
                              // Call setState to refresh the first page
                            });
                          });
                          ;
                        }
                      },
                      child: const Text("SignUp"),
                    ),
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
