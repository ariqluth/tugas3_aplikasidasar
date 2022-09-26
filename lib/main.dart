import 'dart:convert';
import 'dart:ui';

import 'package:belajar3_flutter/convert.dart';
import 'package:belajar3_flutter/inputsuhu.dart';
import 'package:belajar3_flutter/resultsuhu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // this widget is the the root of your application
  TextEditingController etInput = new TextEditingController();
//  state
  double inputUser = 0;
  double _result = 0;
  double kelvin = 0;
  double farenheit = 0;
  double reamur = 0;
  String selectedDropdown = "kelvin";

  // buat dropdown
  var listSatuanSuhu = ["kelvin", "reamur", "farenheit"];
  List<String> listHasil = [];

  _konversiSuhu() {
    setState(() {
      print(listHasil.length);
      inputUser = double.parse(etInput.text);
      switch (selectedDropdown) {
        case "kelvin":
          {
            // statements;
            _result = inputUser + 273;
            listHasil.add("Konversi dari : " +
                "$inputUser" +
                " ke " +
                "$_result" +
                " Kelvin");
          }
          break;

        case "reamur":
          {
            //statements;
            _result = inputUser * 4 / 5;
            listHasil.add("Konversi dari : " +
                "$inputUser" +
                " ke " +
                "$_result" +
                " Reamur");
          }
          break;
      }
    });
  }

  konfersi() {
    // print("Tombol di klik");
    //  set state
    setState(() {
      inputUser = double.parse(etInput.text);
      reamur = 4 / 5 * inputUser;
      farenheit = 9 / 5 * inputUser + 32;
      kelvin = inputUser + 273;
    });
  }

  _onDropdownChanged(String value) {
    setState(() {
      selectedDropdown = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              InputSuhu(etInput: etInput),
              // 3 buat dropdown biasa
              DropdownButton(
                items: listSatuanSuhu.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: selectedDropdown,
                onChanged: _onDropdownChanged(toString()),
                isExpanded: true,
              ),
              // DropdownMenuItem(
              //   child: Text("Kelvin"),
              //   value: "Kelvin",
              // ),
              // DropdownMenuItem(
              //   child: Text("Reamur"),
              //   value: "Reamur",
              // ),
              // ],
              // value: "Kelvin",
              // onChanged: (value) {},
              // isExpanded: true,
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ResultSuhu(
                    result: _result,
                  ),
                ],
              ),

              Convert(konvertHandler: _konversiSuhu),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      child: Text(
                        "Item 1",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Item 1",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Item 1",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
