import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFD2232A),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)))),
            child: const Text("Ingresar",
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16))));
  }
}
