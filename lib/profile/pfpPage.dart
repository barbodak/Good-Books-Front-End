import 'package:flutter/material.dart';
import 'package:the_fidibo_project/widgetAssets.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';

class pfpPage extends StatefulWidget {
  const pfpPage({super.key});

  @override
  State<pfpPage> createState() => _pfpPageState();
}

class _pfpPageState extends State<pfpPage> {
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
              child: Column(
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
                    decoration: myBoxDecoration.get(
                      globalTheme.getCS().primary.withOpacity(0.15),
                    ),
                    padding: const EdgeInsets.all(23.0),
                    height: 100,
                    width: 300,
                    child: Text(
                      "Barbod Coliaie\naccout ballence : 100\$",
                      textAlign: TextAlign.center,
                      style: globalTheme.get().textTheme.labelLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
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
                      onTap: () {},
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
                              globalTheme.isDrak = value;
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
                      onTap: () {},
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
                      onTap: () {},
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
