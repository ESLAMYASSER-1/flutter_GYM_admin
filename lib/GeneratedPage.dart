import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'MySQL.dart';

DateTime selectedDate=DateTime.now();
class GeneratedPage extends StatefulWidget {
  @override
  State<GeneratedPage> createState() => _GeneratedPageState();
}

class _GeneratedPageState extends State<GeneratedPage> {
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _heightController = TextEditingController();

  final _weightController = TextEditingController();

  final _trainingExpController = TextEditingController();
  final _phoneController = TextEditingController();
  final _moneyPaidController = TextEditingController();

  String nameIn = "";
  String phoneIn = "";
  String ageIn = "";
  String heightIn = "";
  String weightIn = "";
  String trainingExpIn = "";
  String moneyPaidIn = "";

  String selectedGenderIn = "Male";
  String selectedTrainingPurposeIn = "Gain Muscles";
  String selectedTriningPlaceIn = "In Gym";
  String selectedparticipationIn = "1 Month";

  List<String> genderInOptions = ["Male", "Female"];
  List<String> trainingPurposeInOptions = [
    "Gain Muscles",
    "Lose Weight",
    "Stay Fit and Healthy"
  ];
  List<String> trainingPlaceOptions = ["In Gym", "In Home"];
  List<String> participationOptions = [
    "1 Month",
    "2 Months",
    "3 Months",
    "6 Months",
    "1 Year"
  ];


  @override
  Widget build(BuildContext context) {

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
        });
    }

    var theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: theme.colorScheme.primaryContainer,
            child: ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                    xs: 12,
                    md: 4,
                    child: Container(
                      height: 70,
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: "Name:",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    )),
                ResponsiveGridCol(
                    xs: 12,
                    md: 4,
                    child: Container(
                      height: 70,
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            hintText: "Phone Number:",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    )),
                ResponsiveGridCol(
                    xs: 12,
                    md: 4,
                    child: Container(
                      height: 70,
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: TextField(
                          controller: _ageController,
                          decoration: InputDecoration(
                              hintText: "Age:",
                              border: OutlineInputBorder(),
                              suffixText: "Years Old"),
                        ),
                      ),
                    )),
                ResponsiveGridCol(
                    xs: 12,
                    md: 4,
                    child: Container(
                      height: 70,
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: TextField(
                          controller: _heightController,
                          decoration: InputDecoration(
                              hintText: "Height:",
                              border: OutlineInputBorder(),
                              suffixText: "CM"),
                        ),
                      ),
                    )),
                ResponsiveGridCol(
                    xs: 12,
                    md: 4,
                    child: Container(
                      height: 70,
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: TextField(
                          controller: _weightController,
                          decoration: InputDecoration(
                              hintText: "weight:",
                              border: OutlineInputBorder(),
                              suffixText: "KG"),
                        ),
                      ),
                    )),
                ResponsiveGridCol(
                    xs: 12,
                    md: 4,
                    child: Container(
                      height: 80,
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: TextField(
                          controller: _trainingExpController,
                          decoration: InputDecoration(
                              hintText: "Training Experience:",
                              border: OutlineInputBorder(),
                              suffixText: "Year"),
                        ),
                      ),
                    )),
                ResponsiveGridCol(
                    xs: 12,
                    md: 4,
                    child: Container(
                      height: 50,
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Row(
                          children: [
                            Text("Gender:"),
                            SizedBox(
                              width: 20,
                            ),
                            DropdownButton(
                              value: selectedGenderIn,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedGenderIn = newValue!;
                                });
                              },
                              items: genderInOptions
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              //-----
                            ),
                          ],
                        ),
                      ),
                    )),
                ResponsiveGridCol(
                    xs: 12,
                    md: 4,
                    child: Container(
                      height: 50,
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Row(
                          children: [
                            Text("Training Purpose:"),
                            SizedBox(
                              width: 20,
                            ),
                            DropdownButton(
                              value: selectedTrainingPurposeIn,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedTrainingPurposeIn = newValue!;
                                });
                              },
                              items: trainingPurposeInOptions
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              //-----
                            ),
                          ],
                        ),
                      ),
                    )),
                ResponsiveGridCol(
                    xs: 12,
                    md: 4,
                    child: Container(
                      height: 50,
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Row(
                          children: [
                            Text("Training Place:"),
                            SizedBox(
                              width: 20,
                            ),
                            DropdownButton(
                              value: selectedTriningPlaceIn,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedTriningPlaceIn = newValue!;
                                });
                              },
                              items: trainingPlaceOptions
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              //-----
                            ),
                          ],
                        ),
                      ),
                    )),
                ResponsiveGridCol(
                    xs: 12,
                    md: 4,
                    child: Container(
                      height: 40,
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Row(
                          children: [
                            Text("Participation:"),
                            SizedBox(
                              width: 20,
                            ),
                            DropdownButton(
                              value: selectedparticipationIn,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedparticipationIn = newValue!;
                                });
                              },
                              items: participationOptions
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              //-----
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Start Date:"),
                            TextButton(onPressed: (){
                              setState(() {
                                _selectDate(context);
                              });
                            }, child: Icon(Icons.date_range_outlined))
                          ],
                        ),
                      ),
                    )),
                ResponsiveGridCol(
                    xs: 12,
                    md: 4,
                    child: Container(
                      height: 40,
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Row(
                          children: [
                            Text("Paid money"),
                            SizedBox(width: 20,),
                            Container(
                              height: 40,
                              width: 90,
                              child: TextField(
                                controller: _moneyPaidController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  suffixText: "\$",
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    nameIn = _nameController.text;
                    phoneIn = _phoneController.text;
                    ageIn = _ageController.text;
                    heightIn = _heightController.text;
                    weightIn = _weightController.text;
                    trainingExpIn = _trainingExpController.text;
                    moneyPaidIn = _moneyPaidController.text;
                    print(
                        "$nameIn $phoneIn $ageIn $heightIn $weightIn $trainingExpIn $selectedGenderIn $selectedTrainingPurposeIn $selectedTriningPlaceIn $selectedparticipationIn $moneyPaidIn");
                    if(selectedGenderIn==genderInOptions[0]){
                    addToMale(nameIn, phoneIn, ageIn, heightIn, weightIn, trainingExpIn, selectedGenderIn, selectedTrainingPurposeIn, selectedTriningPlaceIn, selectedparticipationIn, moneyPaidIn,selectedDate );
                    selectedDate=DateTime.now();
                    selectFromMale();}else{
                      addToFeMale(nameIn, phoneIn, ageIn, heightIn, weightIn, trainingExpIn, selectedGenderIn, selectedTrainingPurposeIn, selectedTriningPlaceIn, selectedparticipationIn, moneyPaidIn,selectedDate);
                      selectedDate=DateTime.now();
                      selectFromFeMale();
                    }
                  },
                  icon: Icon(Icons.person_add_alt_1_rounded),
                  label: Text("ADD")),
              SizedBox(
                width: 10,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _nameController.clear();
                      _phoneController.clear();
                      _ageController.clear();
                      _heightController.clear();
                      _weightController.clear();
                      _trainingExpController.clear();
                      _moneyPaidController.clear();
                      selectedGenderIn ="Male";
                      selectedTrainingPurposeIn = trainingPurposeInOptions[0];
                      selectedTriningPlaceIn = "In Gym";
                      selectedparticipationIn = "1 Month";
                    });
                  },
                  icon: Icon(Icons.clear),
                  label: Text("Clear"),


              ),

            ],
          ),
        ],
      ),
    );
  }
}
// class BigCard extends StatelessWidget {
//   const BigCard({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     var style = theme.textTheme.displayMedium!.copyWith(color: theme.colorScheme.onPrimary);
//
//     return
//   }
// }
