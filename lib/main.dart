import 'dart:convert';
import 'dart:ui';

import 'package:belajar3_flutter/convert.dart';
import 'package:belajar3_flutter/dropdownsuhu.dart';
import 'package:belajar3_flutter/history.dart';
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
  // text controller
  TextEditingController etInput = new TextEditingController();
  //variabel berubah
  double _inputUser = 0;
  double _result = 0;
  String selectedDropdown = "kelvin";
  //0 fixing error di layout
  //buang expanded di result widget
  //1 buat variabel dropdown
  var listSatuanSuhu = ["kelvin", "reamur"];
  List<String> listHasil = [];

  _konversiSuhu() {
    setState(() {
      // print(listHasil.length);
      _inputUser = double.parse(etInput.text);
      switch (selectedDropdown) {
        case "kelvin":
          {
            // statements;
            _result = _inputUser + 273;
            listHasil.add("Konversi dari : " +
                "$_inputUser" +
                " ke " +
                "$_result" +
                " Kelvin");
          }
          break;

        case "reamur":
          {
            //statements;
            _result = _inputUser * 4 / 5;
            listHasil.add("Konversi dari : " +
                "$_inputUser" +
                " ke " +
                "$_result" +
                " Reamur");
          }
          break;
      }
    });
  }

  // _konversiSuhu() {
  //   setState(() {
  //     if (etInput.text.isNotEmpty) {
  //       _inputUser = double.parse(etInput.text);
  //     }
  //     if (listSatuanSuhu == "kelvin") {
  //       _result = _inputUser + 273;
  //     }
  //     if (listSatuanSuhu == "reamur") {
  //       _result = _inputUser + 0.8;
  //     }
  //   });
  // }

  onDropdownChanged(String value) {
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
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                InputSuhu(etInput: etInput),
                //3 buat dropdown biasa
                DropdownSuhu(
                  listSatuanSuhu: listSatuanSuhu,
                  selectedDropdown: selectedDropdown,
                  onDropdownChanged: onDropdownChanged,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ResultSuhu(
                        result: _result,
                      ),
                    ],
                  ),
                ),
                Convert(konvertHandler: _konversiSuhu),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Riwayat Konversi ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                history(listHasil: listHasil),
              ],
            ),
          ),
        ));
  }
}
