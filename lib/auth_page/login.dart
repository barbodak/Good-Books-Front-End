import 'package:flutter/material.dart';
import 'package:the_fidibo_project/book.dart';
import 'package:the_fidibo_project/homePage.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';
import 'package:the_fidibo_project/Network.dart';
import 'package:the_fidibo_project/user.dart';
import 'package:the_fidibo_project/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController(text: "");
  final TextEditingController _password = TextEditingController(text: "");
  String test = "";
  Color appBarColor = Colors.green;
  bool hidePassword = true;
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
          child: Container(
            width: 400,
            height: 500,
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                  controller: _password,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Enter your password',
                    counterText: ' ',
                    hintText: 'you remember it, right?',
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
                      style: FilledButton.styleFrom(
                        backgroundColor: appBarColor,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        if (User.loggedIn.faveBooks.length > 0)
                          User.madeUser.faveBooks
                              .addAll(User.loggedIn.faveBooks);
                        if (User.loggedIn.ownedBooks.length > 0)
                          User.madeUser.ownedBooks
                              .addAll(User.loggedIn.ownedBooks);
                        User.madeUser.darkMode = User.loggedIn.darkMode;
                        appBarColor = Colors.red;
                        User u = User.loggedIn;
                        u.email = _email.text;
                        u.password = _password.text;
                        String value = "";
                        print(User.madeUser.password);
                        print(User.loggedIn.password);
                        print(User.madeUser.email);
                        print(User.loggedIn.email);
                        if (User.loggedIn.email == User.madeUser.email &&
                            User.loggedIn.password == User.madeUser.password)
                          value = "done";
                        else
                          value = "Wrong Username or Password";
                        test = value;
                        print(value.length);
                        setState(() {});
                        if (value == "done") {
                          print(User.loggedIn.userToString());
                          globalTheme.isDrak =
                              (User.loggedIn.darkMode == 1 ? true : false);
                          u.ownedBooks.addAll(User.madeUser.ownedBooks);
                          u.faveBooks.addAll(User.madeUser.faveBooks);
                          u.darkMode = User.madeUser.darkMode;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => homePage()),
                          ).then((value) {
                            // This block runs when you have returned back to the first page from second page
                            setState(() {
                              // Call setState to refresh the first page
                            });
                          });
                          ;
                        }
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
