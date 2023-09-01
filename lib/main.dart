import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:async';


void main() {
  runApp(MyApp());
}
void mySQLConnect () async{
  final conn = await MySqlConnection.connect(new ConnectionSettings(
      host: 'mysql-143037-0.cloudclusters.net', port: 10039, user: 'admin', db: 'GYM', password: 'fUWeAl7I' ));
  var results = await conn
      .query('select * from users');
      for (var row in results) {
    print(row);
  }
}
void select()async{
  final conn = await MySqlConnection.connect(new ConnectionSettings(
      host: 'mysql-143037-0.cloudclusters.net', port: 10039, user: 'admin', db: 'GYM', password: 'fUWeAl7I' ));
  var results = await conn
      .query('select * from users');
  for (var row in results) {
    print(row);
  }
}
void add(String Name, int age, int gender)async{
  final conn = await MySqlConnection.connect(new ConnectionSettings(
      host: 'mysql-143037-0.cloudclusters.net', port: 10039, user: 'admin', db: 'GYM', password: 'fUWeAl7I' ));
  conn.query("INSERT INTO `users` (`Name`, `Age`, `GenderBI`) VALUES ('$Name', '$age', '$gender');");
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext(){
    current = WordPair.random();
    notifyListeners();
  }
  var favorites =<WordPair>[];
  void toggleFavorite(){
    if(favorites.contains(current)){
      favorites.remove(current);
    }else{
      favorites.add(current);
    }
    notifyListeners();
  }


}

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
        page = FavoritePage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: [
                NavigationRailDestination(icon: Icon(Icons.home), label: Text("Home")),
                NavigationRailDestination(icon: Icon(Icons.favorite), label: Text("Favorite"))
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

class GeneratedPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    IconData icon;
    if(appState.favorites.contains(pair)){
      icon= Icons.favorite;
    }else{
      icon= Icons.favorite_outline;
    }

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(pair: pair),
            SizedBox(height: 10,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                    onPressed: (){
                      appState.toggleFavorite();
                      print(appState.favorites);
                    },
                    icon: Icon(icon),
                    label: Text("Like")
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  },
                  child: Text('Next'),
                ),
                ElevatedButton(onPressed:(){ add(appState.current.asPascalCase,20,1);}, child: Text("ADD"))

              ],
            ),
          ],
        ),
      );

  }
}

class FavoritePage extends StatefulWidget{
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context){
    var appState = context.watch<MyAppState>();
    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }
    return ListView(
      children: [
        Padding(
            padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          Row(
            children: [
              IconButton(
                  onPressed: (){
                    setState(() {
                      appState.favorites.remove(pair);
                    });
                  }, icon: Icon(Icons.favorite)),
              Text(pair.asPascalCase, style: Theme.of(context).textTheme.displaySmall!.copyWith(color:Theme.of(context).colorScheme.primary),)
            ],
          )
      ],
    );
  }
}
class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(color: theme.colorScheme.onPrimary);

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(pair.asLowerCase,
        style: style,
        semanticsLabel: pair.asPascalCase,
        ),
      ),
    );
  }
}