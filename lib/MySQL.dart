import 'package:mysql1/mysql1.dart';
import 'main.dart';


void select()async{
  database.clear();
  final conn = await MySqlConnection.connect(ConnectionSettings(host: 'mysql-143037-0.cloudclusters.net', port: 10039, user: 'admin', db: 'GYM', password: 'fUWeAl7I' ));
  var results = await conn
      .query('select * from users');
  database =results.toList();
  print(database);
  checkBox_State.clear();
  for (List record in database){
    checkBox_State[record[1]]=false;
  }
}
void add(String name, int age, int gender)async{
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'mysql-143037-0.cloudclusters.net', port: 10039, user: 'admin', db: 'GYM', password: 'fUWeAl7I' ));
  conn.query("INSERT INTO `users` (`Name`, `Age`, `GenderBI`) VALUES ('$name', '$age', '$gender');");
  select();
}


void removeClient(name)async{
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'mysql-143037-0.cloudclusters.net', port: 10039, user: 'admin', db: 'GYM', password: 'fUWeAl7I' ));
  conn.query("DELETE FROM `users` WHERE Name ='$name'");
}