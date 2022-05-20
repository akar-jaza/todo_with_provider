// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_with_provider/constants.dart';
import 'package:todo_with_provider/main.dart';
import 'dart:io' show Platform;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final _textFildController = TextEditingController();
  String _newTask = '';
  double platformPadding() {
    double padding = 0;
    if (Platform.isWindows) {
      return padding;
    } else {
      return padding = 8;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Container(),
      Container(),
    ];
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          MyApp.title,
          style: TextStyle(color: activeIconColor),
        ),
        backgroundColor: appBarColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bottomNavigationColor,
        unselectedItemColor: activeIconColor.withOpacity(0.7),
        selectedItemColor: activeIconColor,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(platformPadding()),
              child: Icon(
                Icons.fact_check_outlined,
                size: 26,
              ),
            ),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(platformPadding()),
              child: Icon(
                Icons.done,
                size: 28,
              ),
            ),
            label: 'Completed',
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff01579b),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => ShowDiologWidget(),
            barrierDismissible: true,
          );
        },
        child: const Icon(
          Icons.add,
          // color: Color(0xffbbdefe),
        ),
      ),
    );
  }
}

class ShowDiologWidget extends StatefulWidget {
  const ShowDiologWidget({Key? key}) : super(key: key);

  @override
  State<ShowDiologWidget> createState() => _ShowDiologWidgetState();
}

class _ShowDiologWidgetState extends State<ShowDiologWidget> {
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Todo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
