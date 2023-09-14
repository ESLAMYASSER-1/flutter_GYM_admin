import 'package:flutter/material.dart';
import 'package:one/MySQL.dart';
import 'package:provider/provider.dart';
import 'MyHomePage.dart';
var database =[];
final Map<String, bool> checkBox_State= {};
var checkedUsers= [];



void main() {
  selectFromMale();
  runApp(MyApp());

}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'One App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
    @override
  notifyListeners();

}




