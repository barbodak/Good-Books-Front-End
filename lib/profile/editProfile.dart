import 'package:flutter/material.dart';
import 'package:the_fidibo_project/homePage.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';
import 'package:the_fidibo_project/Network.dart';
import 'package:the_fidibo_project/user.dart';
import 'package:the_fidibo_project/utils.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  final TextEditingController _name =
      TextEditingController(text: User.loggedIn.name);
  final TextEditingController _email =
      TextEditingController(text: User.loggedIn.email);
  final TextEditingController _password1 =
      TextEditingController(text: User.loggedIn.password);
  final TextEditingController _password2 = TextEditingController(text: "");
  String test = "Edit Profile Details";
  Color appBarColor = Colors.green;
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Theme(
      data: globalTheme.get(),
      child: Scaffold(
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
                            "updateUser\n" + u.userToString());
                        test = value;
                        print(value.length);
                        setState(() {});
                        if (value == "done") {
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Edit"),
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
