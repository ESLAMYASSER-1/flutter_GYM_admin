import 'package:mysql1/mysql1.dart';
import 'main.dart';


DateTime now = DateTime.now();

void selectFromMale()async{
  final conn = await MySqlConnection.connect(ConnectionSettings(host: 'sql11.freesqldatabase.com', port: 3306, user: 'sql11644483', db: 'sql11644483', password: 'kn7MrUnzx1' ));
  var results = await conn
      .query('select * from MaleClients');
  database =results.toList();
  checkBox_State.clear();
  for (List record in database){
    checkBox_State[record[0]]=false;
  }
  print(database);
}


void selectFromFeMale()async{
  final conn = await MySqlConnection.connect(ConnectionSettings(host: 'sql11.freesqldatabase.com', port: 3306, user: 'sql11644483', db: 'sql11644483', password: 'kn7MrUnzx1' ));
  var results = await conn
      .query('select * from FeMaleClients');
  database =results.toList();
  checkBox_State.clear();
  for (List record in database){
    checkBox_State[record[0]]=false;
  }
  print(database);
}

void search(String searchINPUT) async{
  final conn = await MySqlConnection.connect(ConnectionSettings(host: 'sql11.freesqldatabase.com', port: 3306, user: 'sql11644483', db: 'sql11644483', password: 'kn7MrUnzx1' ));
  var results = await conn
      .query('SELECT * FROM `MaleClients` WHERE (Name like "%$searchINPUT%") or(PhoneNumber like "%$searchINPUT%") UNION SELECT * FROM `FeMaleClients` WHERE (Name like "%$searchINPUT%") or(PhoneNumber like "%$searchINPUT%")');
  database =results.toList();
  checkBox_State.clear();
  for (List record in database){
    checkBox_State[record[0]]=false;
  }
  print(database);
}

void addToMale(String name, String phoneNumber, String age, String height, String weight, String trainingExp, String gender, String trainingPurpose, String trainingPlace, String participation, String money,DateTime startDate)async{
  String endDate= "";
  DateTime x;
  switch (participation){
    case "15 Days":
      x = startDate.add(Duration(days: 15)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "1 Month":
      x = startDate.add(Duration(days: 30)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "2 Months":
      x = startDate.add(Duration(days: 60)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "3 Months":
      x = startDate.add(Duration(days: 90)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "4 Months":
      x = startDate.add(Duration(days: 120)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "5 Months":
      x = startDate.add(Duration(days: 150)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "6 Months":
      x = startDate.add(Duration(days: 180)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "7 Months":
      x = startDate.add(Duration(days: 210)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "8 Months":
      x = startDate.add(Duration(days: 240)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "9 Months":
      x = startDate.add(Duration(days: 270)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "10 Months":
      x = startDate.add(Duration(days: 300)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "11 Months":
      x = startDate.add(Duration(days: 330)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "1 Year":
      x = startDate.add(Duration(days: 365)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
  }
  final conn = await MySqlConnection.connect(ConnectionSettings(host: 'sql11.freesqldatabase.com', port: 3306, user: 'sql11644483', db: 'sql11644483', password: 'kn7MrUnzx1' ));
  conn.query("INSERT INTO `MaleClients` VALUES ('$name', '$phoneNumber', '$age', '$height', '$weight', '$trainingExp', '$gender', '$trainingPurpose', '$trainingPlace', '$participation', '$money', '$startDate', '$endDate');");
  selectFromMale();
}

void addToFeMale(String name, String phoneNumber, String age, String height, String weight, String trainingExp, String gender, String trainingPurpose, String trainingPlace, String participation, String money,DateTime startDate)async{
  String endDate= "";
  DateTime x;
  switch (participation){
    case "15 Days":
      x = startDate.add(Duration(days: 15)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "1 Month":
      x = startDate.add(Duration(days: 30)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "2 Months":
      x = startDate.add(Duration(days: 60)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "3 Months":
      x = startDate.add(Duration(days: 90)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "4 Months":
      x = startDate.add(Duration(days: 120)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "5 Months":
      x = startDate.add(Duration(days: 150)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "6 Months":
      x = startDate.add(Duration(days: 180)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "7 Months":
      x = startDate.add(Duration(days: 210)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "8 Months":
      x = startDate.add(Duration(days: 240)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "9 Months":
      x = startDate.add(Duration(days: 270)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "10 Months":
      x = startDate.add(Duration(days: 300)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "11 Months":
      x = startDate.add(Duration(days: 330)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
    case "1 Year":
      x = startDate.add(Duration(days: 365)) ;
      endDate = "${x.year}-${x.month}-${x.day}";
      break;
  }
  final conn = await MySqlConnection.connect(ConnectionSettings(host: 'sql11.freesqldatabase.com', port: 3306, user: 'sql11644483', db: 'sql11644483', password: 'kn7MrUnzx1' ));
  conn.query("INSERT INTO `FeMaleClients` VALUES ('$name', '$phoneNumber', '$age', '$height', '$weight', '$trainingExp', '$gender', '$trainingPurpose', '$trainingPlace', '$participation', '$money', '$startDate', '$endDate');");
  selectFromFeMale();
}


void removeClient(name)async{
  final conn = await MySqlConnection.connect(ConnectionSettings(host: 'sql11.freesqldatabase.com', port: 3306, user: 'sql11644483', db: 'sql11644483', password: 'kn7MrUnzx1' ));
  conn.query("DELETE FROM `MaleClients` WHERE Name ='$name'");
}