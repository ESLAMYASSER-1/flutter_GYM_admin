import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'MySQL.dart';
import 'main.dart';

class ClientsPage extends StatefulWidget {
  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    if (database.isEmpty) {
      return Center(
        child: AlertDialog(
          title: Text("Connection Error"),
          content: Text("Please Connect to Internet for reaching Database!!"),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    select();
                    ClientsPage();
                  });

                },
                child: Text("OK"))
          ],
        ),
      );
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              Text(
                'You have '
                '${database.length} Clients:',
                style: TextStyle(fontSize: 20),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          select();
                          Future.delayed(Duration(seconds: 10));
                          if (database.isEmpty) {
                            Center(
                              child: AlertDialog(
                                title: Text("Connection Error"),
                                content: Text(
                                    "Please Connect to Internet for reaching Database!"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          select();
                                          ClientsPage();
                                        });

                                      },
                                      child: Text("OK"))
                                ],
                              ),
                            );
                          }
                        });
                      },
                      child: Icon(Icons.refresh)),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                      onPressed: () {
                        print("object");
                      },
                      child: SvgPicture.asset(
                        "assets/WhatsApp.svg",
                        width: 20,
                        height: 20,
                      )),
                ),
              ),
            ],
          ),
        ),
        for (var record in database)
          Row(
            children: [
              Checkbox(
                value: checkBox_State[record[1]],
                onChanged: (value) {
                  setState(() {
                    if (checkBox_State[record[1]] == false) {
                      checkBox_State[record[1]] = true;
                    } else {
                      checkBox_State[record[1]] = false;
                    }
                    checkedUsers.add(record[0]);
                  });
                },
              ),
              Text(
                ("${record[1].length > 12 ? "${record[1].toString().substring(0, 12)}..." : "${record[1]}${" " * (19 - (record[1].length)).toInt()}"} ${record[2]} ${record[3] == 1 ? "  Male" : "Female"}"),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              )
            ],
          )
      ],
    );
  }
}
