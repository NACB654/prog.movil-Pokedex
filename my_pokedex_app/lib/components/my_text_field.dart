import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String label = '';
  bool withIcon = false;

  MyTextField(this.label, this.withIcon, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        prefixIcon: withIcon == true ? const Icon(Icons.search) : null,
        labelText: label,
        floatingLabelStyle: const TextStyle(color: Color(0xFFD2232A)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFD2232A),
          ),
        ),
      ),
    );
  }
}
