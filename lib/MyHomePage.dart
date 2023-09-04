import 'package:flutter/material.dart';
import 'ClientsPage.dart';
import 'GeneratedPage.dart';
import 'main.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex =0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratedPage();
        break;
      case 1:
        page = ClientsPage();
        break;
      default:
        page = Placeholder();
    }
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Column(
        children: [
          SafeArea(
            child: NavigationBar(
              destinations: [
                NavigationDestination(icon: Icon(Icons.person_add_alt_1_rounded), label:"ADD", ),
                NavigationDestination(icon: Icon(Icons.format_list_numbered), label: "DATA"),
                NavigationDestination(icon: Icon(Icons.manage_accounts_outlined), label: "Manage")
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value){
                setState(() {
                  selectedIndex =value;
                });
              },
            ),
          ),

          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          )
        ],
      ),
    );
  }
}