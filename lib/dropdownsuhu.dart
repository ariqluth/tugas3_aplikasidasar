import 'package:flutter/material.dart';

class DropdownSuhu extends StatelessWidget {
  final List<String> listSatuanSuhu;
  final String selectedDropdown;
  final Function onDropdownChanged;

  const DropdownSuhu(
      {Key? key,
      required this.listSatuanSuhu,
      required this.selectedDropdown,
      required this.onDropdownChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: listSatuanSuhu.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: selectedDropdown,
      onChanged: (value) {
        onDropdownChanged(value.toString());
      },
      isExpanded: true,
    );
  }
}
