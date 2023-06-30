import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:the_fidibo_project/widgetAssets.dart';
import 'package:the_fidibo_project/welcome_page.dart';
import 'package:the_fidibo_project/user.dart';
import 'package:the_fidibo_project/Network.dart';
import 'package:the_fidibo_project/profile/editProfile.dart';
import 'package:the_fidibo_project/profile/paymentPage.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';

class pfpPage extends StatefulWidget {
  const pfpPage({super.key});

  @override
  State<pfpPage> createState() => _pfpPageState();
}

class _pfpPageState extends State<pfpPage> {
  final TextEditingController _number = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    // Using a Builder widget instead of a MaterialApp widget
    return Builder(
      builder: (context) {
        // Using the same theme as the first page
        return Theme(
          data: globalTheme.get(),
          child: Scaffold(
            appBar: AppBar(),
            // backgroundColor: globalTheme.getCS().surfaceTint.withOpacity(1),
            body: Center(
              child: ListView(
                children: [
                  // SizedBox(
                  //   height: 30,
                  // ),
                  const Hero(
                    tag: '1',
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 250,
                    ),
                  ),
                  Container(
                    // decoration: myBoxDecoration.get(
                    //   globalTheme.getCS().primary.withOpacity(0.15),
                    // ),
                    padding: const EdgeInsets.all(23.0),
                    height: 150,
                    width: 100,
                    child: Text(
                      User.loggedIn.name +
                          "\n" +
                          User.loggedIn.email +
                          "\n" +
                          "accout ballence :" +
                          User.loggedIn.accountBalance.toString() +
                          "\$",
                      textAlign: TextAlign.center,
                      style: globalTheme.get().textTheme.labelLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Card(
                    child: ListTile(
                      leading: Text(
                        'Edit Profile',
                        style: globalTheme.get().textTheme.labelLarge,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                      ),
                      enabled: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const editProfile(),
                          ),
                        ).then((value) {
                          // This block runs when you have returned back to the first page from second page
                          setState(() {
                            // Call setState to refresh the first page
                          });
                        });
                      },
                      minVerticalPadding: 35,
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Text(
                        'Dark Mode',
                        style: globalTheme.get().textTheme.labelLarge,
                      ),
                      trailing: Switch(
                        // This bool value toggles the switch.,
                        value: globalTheme.isDrak,
                        activeColor: Colors.amber[800],
                        inactiveThumbColor: Colors.black,
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(
                            () {
                              User.loggedIn.darkMode = (value == true ? 1 : 0);
                              globalTheme.isDrak = value;
                              MyNetwork.sendRequest("updateUser\n" +
                                  User.loggedIn.userToString());
                              print(User.loggedIn.name);
                            },
                          );
                        },
                      ),
                      minVerticalPadding: 35,
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Text(
                        'Increase Acount Balance',
                        style: globalTheme.get().textTheme.labelLarge,
                      ),
                      trailing: Icon(
                        Icons.attach_money_sharp,
                        size: 35,
                        color: Colors.amber[800],
                      ),
                      enabled: true,
                      onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Increase Your Balance'),
                          content: TextField(
                            controller: _number,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter your Amount',
                              counterText: ' ',
                              hintText: 'The dev loves money!',
                              suffixIcon: Icon(Icons.attach_money_rounded),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => paymentPage(
                                            Amount: _number.text,
                                          )),
                                ).then((value) {
                                  // This block runs when you have returned back to the first page from second page
                                  setState(() {});
                                  Navigator.pop(context, 'OK');
                                });
                              },
                              child: const Text('Confirm'),
                            ),
                          ],
                        ),
                      ),
                      minVerticalPadding: 35,
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Text(
                        'Subscribe to Fidibod Plus',
                        style: globalTheme.get().textTheme.labelLarge,
                      ),
                      trailing: Icon(
                        Icons.star_half_rounded,
                        size: 35,
                        color: Colors.amber[800],
                      ),
                      enabled: true,
                      onTap: () {},
                      minVerticalPadding: 35,
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Text(
                        'LogOut',
                        style: globalTheme.get().textTheme.labelLarge,
                      ),
                      trailing: const Icon(
                        Icons.login_outlined,
                        size: 35,
                        color: Colors.red,
                      ),
                      enabled: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const welcome_page(),
                          ),
                        ).then((value) {
                          // This block runs when you have returned back to the first page from second page
                          setState(() {
                            // Call setState to refresh the first page
                          });
                        });
                        ;
                      },
                      minVerticalPadding: 35,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
