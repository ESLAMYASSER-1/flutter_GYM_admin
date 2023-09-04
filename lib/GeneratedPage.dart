import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'MySQL.dart';
import 'main.dart';

class GeneratedPage extends StatelessWidget {
  final _nameController = TextEditingController();
  String nameIn ="";
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
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
                    xs: 6,
                    md: 4,
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                    xs: 6,
                    md: 4,
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Name:",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    )),
                ResponsiveGridCol(
                    xs: 6,
                    md: 4,
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Name:",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    )),
                ResponsiveGridCol(
                    xs: 6,
                    md: 4,
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Name:",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    )),
                ResponsiveGridCol(
                    xs: 6,
                    md: 4,
                    child: Container(
                        height: 100,
                        alignment: Alignment(0, 0),
                        child: Text("1"))),
                ResponsiveGridCol(
                    xs: 6,
                    md: 4,
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      child: Text("2"),
                    )),
                ResponsiveGridCol(
                    xs: 6,
                    md: 4,
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      child: Text("3"),
                    )),
                ResponsiveGridCol(
                    xs: 6,
                    md: 4,
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      child: Text("4"),
                    )),
                ResponsiveGridCol(
                    xs: 6,
                    md: 4,
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      child: Text("1"),
                    )),
                ResponsiveGridCol(
                    xs: 6,
                    md: 4,
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      child: Text("2"),
                    )),
                ResponsiveGridCol(
                    xs: 6,
                    md: 4,
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      child: Text("3"),
                    )),
                ResponsiveGridCol(
                    xs: 6,
                    md: 4,
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      child: Text("4"),
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
                    nameIn =_nameController.text;
                    add(nameIn, 30, 0);
                    select();
                  },
                  icon: Icon(Icons.person_add_alt_1_rounded),
                  label: Text("ADD")),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    select();
                  },
                  child: Text("query")),
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
