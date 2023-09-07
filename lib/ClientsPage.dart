import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'MySQL.dart';
import 'main.dart';

class ClientsPage extends StatefulWidget {
  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  @override
  Widget build(BuildContext context) {
    if (database.isEmpty) {
      return Center(
        child: AlertDialog(
          title: Text("Connection Error"),
          content: Text("Please Connect to Internet for reaching Database!!"),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    selectFromMale();
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
                style: TextStyle(fontSize: 15),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 16, 3, 16),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectFromMale();
                          sleep(Duration(seconds: 2));
                          Future.delayed(Duration(seconds: 2));
                          if (database.isEmpty) {
                            Center(
                              child: AlertDialog(
                                title: Text("Connection Error"),
                                content: Text(
                                    "Database is Empty or there is no Internet Connection for reaching Database!"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          selectFromMale();
                                        });

                                      },
                                      child: Text("OK"))
                                ],
                              ),
                            );
                          }
                        });
                      },
                      child: Container(child: Row(
                        children: [
                          Icon(Icons.refresh,size: 17),
                          Text("Male",style: TextStyle(fontSize: 13),),
                        ],
                      ))
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 3, 16),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectFromFeMale();
                          sleep(Duration(seconds: 2));
                          Future.delayed(Duration(seconds: 2));
                          if (database.isEmpty) {
                            Center(
                              child: AlertDialog(
                                title: Text("Connection Error"),
                                content: Text(
                                    "Database is Empty or there is no Internet Connection for reaching Database!"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          selectFromFeMale();
                                        });

                                      },
                                      child: Text("OK"))
                                ],
                              ),
                            );
                          }
                        });
                      },
                      child: Container(child: Row(
                        children: [
                          Icon(Icons.refresh,size: 17),
                          Text("FeMale",style: TextStyle(fontSize: 13),),
                        ],
                      ))
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: ElevatedButton(
                      onPressed: () {
                        print("object");
                      },
                      child: SvgPicture.asset(
                        "assets/WhatsApp.svg",
                        width: 16,
                        height: 16,
                      )),
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(onPressed: (){setState(() {

        });}, child: Text("ok")),
        for (var record in database)
          Row(
            children: [
              Checkbox(
                value: checkBox_State[record[0]],
                onChanged: (value) {
                  setState(() {
                    if (checkBox_State[record[0]] == false) {
                      checkBox_State[record[0]] = true;
                    } else {
                      checkBox_State[record[0]] = false;
                    }
                    checkedUsers.add(record[1]);
                  });
                },
              ),
              Container(
                width: 150,
                height: 30,
                child: Text(
                  // ("${record[0].length > 12 ? "${record[0].toString().substring(0, 12)}..." : "${record[0]}${" " * (19 - (record[0].length)).toInt()}"}"),
                  "${record[0]}",
                  style: TextStyle(
                    fontSize: 17
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),Container(
                width: 110,
                height: 30,
                child: Text(
                  "${record[1]} ",
                  style: TextStyle(
                      fontSize: 17
                  ),
                  overflow: TextOverflow.ellipsis,
                ),

              ),Container(
                width: 62,
                height: 33,
                child: Text(
                  "${record[6]}",
                  style: TextStyle(
                      fontSize: 18
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: 35,
                height: 35,
                child:  Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                          _showFormDialog(context,record[0]);
                      });
                    },
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
              )
            ],
          )
      ],
    );
  }
}


void _showFormDialog(BuildContext context,String name) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(name,softWrap: false,),
        content: MyForm(), // Your form widget
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Close the dialog
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}
class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              Text("Name:"),
              SizedBox(width: 20,),
            ],
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle form submission here
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}