import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  final Function konvertHandler;

  Convert({Key? key, required this.konvertHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () => konvertHandler(),
        child: Text("Konversi Suhu"),
      ),
    );
  }
}
