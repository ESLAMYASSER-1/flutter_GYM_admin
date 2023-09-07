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

void addToMale(String name, String phoneNumber, String age, String height, String weight, String trainingExp, String gender, String trainingPurpose, String trainingPlace, String participation, String money,DateTime startDate)async{
  String endDate= "";
  DateTime x;
  switch (participation){
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
    case "6 Months":
      x = startDate.add(Duration(days: 180)) ;
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
    case "6 Months":
      x = startDate.add(Duration(days: 180)) ;
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