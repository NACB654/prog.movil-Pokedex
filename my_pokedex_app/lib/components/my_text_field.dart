import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String label = '';
  bool withIcon = false;
  bool isPassword = false;
  TextEditingController textControl;

  MyTextField(this.label, this.withIcon, this.textControl, this.isPassword,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 16),
      cursorColor: const Color(0xFFD2232A),
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: withIcon == true ? const Icon(Icons.search) : null,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFD2232A),
          ),
        ),
      ),
      controller: textControl,
    );
  }
}
